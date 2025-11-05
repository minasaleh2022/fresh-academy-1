
import { useForm } from 'react-hook-form'
import { useAuth } from '@/services/auth'
import { useNavigate } from 'react-router-dom'

type F = { nationalId: string; password: string }

export default function Login(){
  const { register, handleSubmit } = useForm<F>({ defaultValues: { nationalId: '10000000000000', password: '123456' } })
  const { login } = useAuth()
  const nav = useNavigate()
  const onSubmit = async (v: F) => {
    try {
      await login(v.nationalId, v.password)
      nav('/')
    } catch(e: any){
      alert(e.message || 'Login failed')
    }
  }
  return (
    <div className="min-h-screen grid place-items-center">
      <form onSubmit={handleSubmit(onSubmit)} className="card w-full max-w-md p-6 space-y-3">
        <h1 className="text-center">تسجيل الدخول — لوحة الإدارة</h1>
        <label className="label">الرقم القومي</label>
        <input className="input" {...register('nationalId', { required: true, minLength: 10 })} />
        <label className="label">كلمة المرور</label>
        <input className="input" type="password" {...register('password', { required: true })} />
        <button className="btn btn-primary w-full mt-2">دخول</button>
        <p className="text-xs text-center text-gray-500">تجريبي: 10000000000000 / أي كلمة</p>
      </form>
    </div>
  )
}
