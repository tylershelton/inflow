import React from 'react';
import { Form } from 'react-router-dom';

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
