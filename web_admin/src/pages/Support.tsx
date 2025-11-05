
import Shell from '@/layouts/Shell'

export default function Support(){
  return (
    <Shell title="الدعم الفني">
      <div className="grid md:grid-cols-2 gap-4">
        <div className="card p-4">قاعدة المعرفة (مقالات وأدلة)</div>
        <div className="card p-4">محادثة مباشرة (محاكاة)</div>
      </div>
    </Shell>
  )
}
