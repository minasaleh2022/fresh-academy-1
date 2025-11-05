
import Shell from '@/layouts/Shell'
import { useState } from 'react'

type U = { id: string; name: string; role: 'admin'|'trainer'|'trainee'; nationalId: string; email: string }

export default function Users(){
  const [users, setUsers] = useState<U[]>([
    { id: '1', name: 'Admin User', role: 'admin', nationalId: '10000000000000', email: 'admin@fresh.com' },
    { id: '2', name: 'Trainer User', role: 'trainer', nationalId: '20000000000000', email: 'trainer@fresh.com' },
    { id: '3', name: 'Trainee User', role: 'trainee', nationalId: '30000000000000', email: 'trainee@fresh.com' },
  ])
  const [form, setForm] = useState<U>({ id: '', name: '', role: 'trainee', nationalId: '', email: '' })

  function save(){
    if (!form.name || !form.nationalId) return alert('أكمل البيانات')
    if (form.id){
      setUsers(prev => prev.map(u => u.id === form.id ? form : u))
    } else {
      setUsers(prev => [...prev, { ...form, id: String(Date.now()) }])
    }
    setForm({ id: '', name: '', role: 'trainee', nationalId: '', email: '' })
  }
  function edit(u: U){ setForm(u) }
  function remove(id: string){ setUsers(prev => prev.filter(u => u.id !== id)) }

  return (
    <Shell title="إدارة المستخدمين">
      <div className="grid md:grid-cols-3 gap-4">
        <div className="card p-4 md:col-span-1">
          <div className="space-y-2">
            <input className="input" placeholder="الاسم" value={form.name} onChange={e=>setForm({...form, name: e.target.value})}/>
            <select className="input" value={form.role} onChange={e=>setForm({...form, role: e.target.value as any})}>
              <option value="admin">مدير</option>
              <option value="trainer">مدرب</option>
              <option value="trainee">متدرب</option>
            </select>
            <input className="input" placeholder="الرقم القومي" value={form.nationalId} onChange={e=>setForm({...form, nationalId: e.target.value})}/>
            <input className="input" placeholder="البريد الإلكتروني" value={form.email} onChange={e=>setForm({...form, email: e.target.value})}/>
            <button className="btn btn-primary w-full" onClick={save}>{form.id ? 'تعديل' : 'إضافة'}</button>
          </div>
        </div>
        <div className="card p-4 md:col-span-2">
          <table className="w-full text-sm">
            <thead>
              <tr className="text-left text-gray-500 border-b">
                <th className="py-2">الاسم</th><th>الدور</th><th>الرقم القومي</th><th>الإيميل</th><th></th>
              </tr>
            </thead>
            <tbody>
              {users.map(u => (
                <tr key={u.id} className="border-b">
                  <td className="py-2">{u.name}</td>
                  <td>{u.role}</td>
                  <td>{u.nationalId}</td>
                  <td>{u.email}</td>
                  <td className="text-right space-x-2">
                    <button className="btn" onClick={()=>edit(u)}>تعديل</button>
                    <button className="btn" onClick={()=>remove(u.id)}>حذف</button>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>
    </Shell>
  )
}
