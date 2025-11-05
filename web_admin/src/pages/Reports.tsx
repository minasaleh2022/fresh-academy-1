
import Shell from '@/layouts/Shell'

export default function Reports(){
  return (
    <Shell title="التقارير والرسوم">
      <div className="grid md:grid-cols-2 gap-4">
        <div className="card p-4 h-64">Bar Chart (placeholder)</div>
        <div className="card p-4 h-64">Pie Chart (placeholder)</div>
      </div>
      <div className="card p-4 mt-4">
        <button className="btn btn-primary">تصدير PDF</button>
      </div>
    </Shell>
  )
}
