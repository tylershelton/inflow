import React from 'react';
import {
  Outlet,
  redirect,
  useRouteLoaderData
} from 'react-router-dom';

import auth from '../api/auth';

export async function loader ({ request }) {
  if (!auth.loggedIn) {
    console.log('not logged in, denying access to private route.');
    const params = new URLSearchParams();
    params.set('from', new URL(request.url).pathname);
    return redirect('/login?' + params.toString());
  }
  console.log('logged in, allowing access to private route.');
  return null;
}

export default function PrivateRoutes () {
  return (
    auth.loggedIn ? <Outlet /> : null
  );
}
