import React from 'react';
import { Form } from 'react-router-dom';

export default function LogoutButton () {
  return (
    <Form method="post" action="/logout">
      <button type="submit">
        Log Out
      </button>
    </Form>
  );
}
