
import Shell from '@/layouts/Shell'

export default function Settings(){
  return (
    <Shell title="الإعدادات">
      <div className="card p-4 space-y-3">
        <div className="flex items-center gap-3">
          <label className="w-48">لغة الواجهة</label>
          <select className="input"><option>العربية</option><option>English</option></select>
        </div>
        <div className="flex items-center gap-3">
          <label className="w-48">لون أساسي</label>
          <input className="input" type="color" defaultValue="#E53935" />
        </div>
        <button className="btn btn-primary">حفظ</button>
      </div>
    </Shell>
  )
}
