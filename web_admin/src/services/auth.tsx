
import React, { createContext, useContext, useEffect, useState } from 'react'
import axios from 'axios'

type Role = 'admin' | 'trainer' | 'trainee'
export type User = { id: string; name: string; role: Role; nationalId: string; email: string }

type AuthCtx = {
  user: User | null
  login: (nationalId: string, password: string) => Promise<void>
  logout: () => void
}

const Ctx = createContext<AuthCtx>({ user: null, login: async()=>{}, logout: ()=>{} })

export const AuthProvider: React.FC<{children: React.ReactNode}> = ({ children }) => {
  const [user, setUser] = useState<User | null>(null)

  useEffect(() => {
    const raw = localStorage.getItem('fa_user')
    if (raw) setUser(JSON.parse(raw))
  }, [])

  async function login(nationalId: string, password: string){
    // Mock local until API is ready:
    const demo: Record<string, User> = {
      '10000000000000': { id: '1', name: 'Admin User',   role: 'admin',   nationalId, email: 'admin@fresh.com' },
      '20000000000000': { id: '2', name: 'Trainer User', role: 'trainer', nationalId, email: 'trainer@fresh.com' },
      '30000000000000': { id: '3', name: 'Trainee User', role: 'trainee', nationalId, email: 'trainee@fresh.com' },
    }
    const u = demo[nationalId]
    if (!u || !password) throw new Error('بيانات الدخول غير صحيحة')
    setUser(u)
    localStorage.setItem('fa_user', JSON.stringify(u))
  }

  function logout(){
    setUser(null)
    localStorage.removeItem('fa_user')
  }

  return <Ctx.Provider value={{ user, login, logout }}>{children}</Ctx.Provider>
}

export const useAuth = () => useContext(Ctx)
