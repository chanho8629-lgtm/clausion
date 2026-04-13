import { useCallback, useMemo } from 'react';
import { useAuthStore } from '../store/authStore';
import type { User } from '../types';

export function useAuth() {
  const store = useAuthStore();

  const login = useCallback(
    (email: string, password: string) => store.login(email, password),
    [store],
  );

  const logout = useCallback(() => store.logout(), [store]);

  const register = useCallback(
    (email: string, password: string, name: string, role: User['role'], inviteCode?: string) =>
      store.register(email, password, name, role, inviteCode),
    [store],
  );

  const isAuthenticated = useMemo(
    () => store.token !== null,
    [store.token],
  );

  return {
    user: store.user,
    token: store.token,
    isAuthenticated,
    login,
    logout,
    register,
  };
}
