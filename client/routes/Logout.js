import auth from '../api/auth';
import { redirect } from 'react-router-dom';

export async function action () {
  await auth.logout();
  return redirect('/');
}
