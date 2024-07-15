import React from 'react';
import { Form, redirect } from 'react-router-dom';

export async function action ({ request }) {
  const formData = await request.formData();
  console.log(formData);
  const response = await fetch('/auth/login', {
    method: 'post',
    body: formData,
  });
  console.log(response);
  return redirect('/');
}

export default function Login () {
  return (
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
  );
}
