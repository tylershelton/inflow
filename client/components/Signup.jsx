import React from 'react';
import {
  Form,
  json,
  redirect,
  useActionData
} from 'react-router-dom';

import apiFetch from '../api/apiFetch';

export async function action ({ request }) {
  const formData = await request.formData();

  const errors = {};
  if (formData.get('password') !== formData.get('passwordConfirm')) {
    errors.password = 'Passwords do not match.';
  }
  
  if (Object.keys(errors).length > 0) {
    return json({ errors }, { status: 400 });
  }

  const response = await apiFetch('/api/auth/signup', {
    method: 'post',
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: new URLSearchParams(formData).toString(),
  });

  if (response.ok) {
    return redirect('/login');
  } else {
    return json({ errors }, { status: response.status });
  }
}

export default function Signup () {
  const actionData = useActionData();

  return (
    <section>
      <h2>Sign Up</h2>
      <Form method='post' id='signup-form' action='/signup'>
        <section>
          <label htmlFor='username'>
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
          <label htmlFor='password'>
            Password
            <input
              placeholder='password'
              type='password'
              name='password'
              required
            />
          </label>
        </section>
        <section>
          <label htmlFor='passwordConfirm'>
            Confirm Password
            <input
              placeholder='password'
              type='password'
              name='passwordConfirm'
              required
            />
          </label>
          {actionData?.errors?.password && (
            <div className='error'>{actionData.errors.password}</div>
          )}
        </section>
        <button type='submit'>Sign In</button>
      </Form>
    </section>
  );
}
