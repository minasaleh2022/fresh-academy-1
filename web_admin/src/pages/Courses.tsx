
import Shell from '@/layouts/Shell'
import { useState } from 'react'

type C = { id: string; title: string; department: string; level: string; hours: number }

export default function Courses(){
  const [courses, setCourses] = useState<C[]>([
    { id: '1', title: 'Refrigerators', department: 'Cooling', level: 'Beginner', hours: 10 },
    { id: '2', title: 'Air Conditioners', department: 'AC', level: 'Intermediate', hours: 16 },
  ])
  const [form, setForm] = useState<C>({ id: '', title: '', department: 'Cooling', level: 'Beginner', hours: 4 })

  function save(){
    if (!form.title) return alert('أدخل اسم الدورة')
    if (form.id) setCourses(prev=>prev.map(c=>c.id===form.id?form:c))
    else setCourses(prev=>[...prev, {...form, id:String(Date.now())}])
    setForm({ id:'', title:'', department:'Cooling', level:'Beginner', hours:4 })
  }
  function edit(c:C){ setForm(c) }
  function remove(id:string){ setCourses(prev=>prev.filter(c=>c.id!==id)) }

  return (
    <Shell title="إدارة الدورات">
      <div className="grid md:grid-cols-3 gap-4">
        <div className="card p-4 space-y-2">
          <input className="input" placeholder="اسم الدورة" value={form.title} onChange={e=>setForm({...form, title:e.target.value})}/>
          <input className="input" placeholder="القسم" value={form.department} onChange={e=>setForm({...form, department:e.target.value})}/>
          <select className="input" value={form.level} onChange={e=>setForm({...form, level:e.target.value})}>
            <option>Beginner</option><option>Intermediate</option><option>Expert</option>
          </select>
          <input type="number" className="input" placeholder="عدد الساعات" value={form.hours} onChange={e=>setForm({...form, hours:Number(e.target.value)})}/>
          <button className="btn btn-primary w-full" onClick={save}>{form.id?'تعديل':'إضافة'}</button>
        </div>
        <div className="card p-4 md:col-span-2">
          <table className="w-full text-sm">
            <thead><tr className="text-left text-gray-500 border-b"><th className="py-2">العنوان</th><th>القسم</th><th>المستوى</th><th>الساعات</th><th></th></tr></thead>
            <tbody>
              {courses.map(c=>(
                <tr key={c.id} className="border-b">
                  <td className="py-2">{c.title}</td>
                  <td>{c.department}</td>
                  <td>{c.level}</td>
                  <td>{c.hours}</td>
                  <td className="text-right">
                    <button className="btn" onClick={()=>edit(c)}>تعديل</button>
                    <button className="btn" onClick={()=>remove(c.id)}>حذف</button>
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
