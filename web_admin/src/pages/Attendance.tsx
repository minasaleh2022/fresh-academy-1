
import Shell from '@/layouts/Shell'
import { useState } from 'react'

type A = { id: string; trainee: string; date: string; present: boolean }

export default function Attendance(){
  const [records, setRecords] = useState<A[]>([
    { id:'1', trainee:'Ali Hassan', date: new Date().toISOString().slice(0,10), present: true },
    { id:'2', trainee:'Sara Adel', date: new Date().toISOString().slice(0,10), present: false },
  ])
  function toggle(id:string){ setRecords(prev=>prev.map(r=>r.id===id?{...r, present:!r.present}:r)) }
  return (
    <Shell title="تسجيل الحضور">
      <div className="card p-4">
        <table className="w-full text-sm">
          <thead><tr className="text-left text-gray-500 border-b"><th className="py-2">المتدرب</th><th>التاريخ</th><th>حضور</th></tr></thead>
          <tbody>
            {records.map(r=>(
              <tr key={r.id} className="border-b">
                <td className="py-2">{r.trainee}</td>
                <td>{r.date}</td>
                <td><input type="checkbox" checked={r.present} onChange={()=>toggle(r.id)} /></td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </Shell>
  )
}
