import React from 'react';
import { Form, redirect } from 'react-router-dom';

import auth from '../api/auth';

export async function action ({ request }) {
  try {
    await auth.login(request);
    return auth.loggedIn ? redirect('/') : null;
  }
  catch (err) {
    return err;
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
