
import Shell from '@/layouts/Shell'

export default function Dashboard(){
  return (
    <Shell title="لوحة التحكم">
      <div className="grid md:grid-cols-3 gap-4">
        <div className="card p-4"><div className="text-sm text-gray-500">إجمالي المتدربين</div><div className="text-3xl font-bold">1,280</div></div>
        <div className="card p-4"><div className="text-sm text-gray-500">الدورات النشطة</div><div className="text-3xl font-bold">24</div></div>
        <div className="card p-4"><div className="text-sm text-gray-500">نسبة النجاح</div><div className="text-3xl font-bold">92%</div></div>
      </div>
      <div className="grid md:grid-cols-2 gap-4 mt-4">
        <div className="card p-4 h-64">رسم بياني (لاحقًا)</div>
        <div className="card p-4 h-64">توزيع المتدربين (لاحقًا)</div>
      </div>
    </Shell>
  )
}
