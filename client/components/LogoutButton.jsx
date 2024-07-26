import React from 'react';
import { useFetcher } from 'react-router-dom';

export default function LogoutButton () {
  const fetcher = useFetcher();

  return (
    <fetcher.Form method="post" action="/logout">
      <button type="submit">
        Log Out
      </button>
    </fetcher.Form>
  );
}