import { redirect } from 'react-router-dom';
import auth from '../api/auth';

export default async function apiFetch (url, options = {}) {
  const response = await fetch(url, options);

  if (response.status === 401) {
    await auth.logout();
    return redirect('/');
  }

  return response;
}
