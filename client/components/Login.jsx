import React from 'react';
import {
  json,
  redirect,
  useFetcher,
  useLocation
} from 'react-router-dom';

import auth from '../api/auth';

export async function action ({ request }) {
  try {
    const formData = await request.formData();
    const redirectTo = formData.get('redirectTo');
    await auth.login(formData);
    return auth.loggedIn ? redirect(redirectTo || '/') : null;
  }
  catch (err) {
    if (err.status === 401) {
      return json({ error: 'Invalid username or password.' });
    }
  }
}

export async function loader () {
  if (auth.loggedIn) return redirect('/');
  return null;
}

export default function Login () {
  const location = useLocation();
  const fetcher = useFetcher();

  const params = new URLSearchParams(location.search);
  const from = params.get('from') || '/';

  return (
    <section>
      <h2>Log In</h2>
      <fetcher.Form method='post' id='login-form' action='/login' replace>
        <input type='hidden' name='redirectTo' value={from} />
        <section>
          <label>
            Username
            <input
              placeholder='Username'
              type='text'
              name='username'
              required
            />
          </label>
        </section>
        <section>
          <label>
            Password
            <input
              placeholder='password'
              type='password'
              name='password'
              required
            />
          </label>
        </section>
        {fetcher.data?.error && (
          <div className='error'>{fetcher.data?.error}</div>
        )}
        <button type='submit'>Log In</button>
      </fetcher.Form>
    </section>
  );
}
