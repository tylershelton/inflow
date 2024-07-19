import React from 'react';
import { Form, redirect } from 'react-router-dom';

export async function action ({ request }) {
  const formData = await request.formData();

  const response = await fetch('/auth/login', {
    method: 'post',
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: new URLSearchParams(formData).toString(),
  });

  if (response.ok) {
    // const user = await response.json();
    localStorage.setItem('loggedIn', true);
    return redirect('/');
  } else {
    return redirect('/login');
  }
}

export default function Login () {
  return (
    <section>
      <h2>Sign In</h2>
      <Form method='post' id='login-form'>
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
        <button type='submit'>Sign In</button>
      </Form>
    </section>
  );
}
