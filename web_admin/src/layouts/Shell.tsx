
import { Link, useLocation } from 'react-router-dom'
import { useAuth } from '@/services/auth'
import React from 'react'
import clsx from 'clsx'

const NavLink: React.FC<{to: string; label: string}> = ({to, label}) => {
  const { pathname } = useLocation()
  const active = pathname === to
  return <Link to={to} className={clsx('px-3 py-2 rounded-xl', active ? 'bg-primary text-white' : 'hover:bg-gray-100')}>{label}</Link>
}

const Shell: React.FC<{title?: string; children: React.ReactNode}> = ({ title, children }) => {
  const { user, logout } = useAuth()
  return (
    <div className="min-h-screen">
      <header className="bg-white border-b">
        <div className="mx-auto max-w-7xl px-4 py-3 flex items-center justify-between">
          <div className="flex items-center gap-3">
            <div className="h-8 w-8 rounded-xl bg-primary"></div>
            <h1 className="text-lg font-bold">Fresh Academy — Admin</h1>
          </div>
          <nav className="flex items-center gap-2">
            <NavLink to="/" label="الرئيسية" />
            <NavLink to="/users" label="المستخدمون" />
            <NavLink to="/courses" label="الدورات" />
            <NavLink to="/attendance" label="الحضور" />
            <NavLink to="/reports" label="التقارير" />
            <NavLink to="/support" label="الدعم" />
            <NavLink to="/settings" label="الإعدادات" />
          </nav>
          <div className="flex items-center gap-3">
            <span className="text-sm text-gray-600">{user?.name} • {user?.role}</span>
            <button className="btn" onClick={logout}>خروج</button>
          </div>
        </div>
      </header>
      <main className="mx-auto max-w-7xl px-4 py-6">
        {title && <h2 className="text-xl font-semibold mb-4">{title}</h2>}
        {children}
      </main>
    </div>
  )
}
export default Shell
