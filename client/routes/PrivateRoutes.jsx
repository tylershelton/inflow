import React from 'react';
import {
  Navigate,
  Outlet,
  redirect,
  useLocation,
} from 'react-router-dom';

import auth from '../api/auth';

export function loader ({ request }) {
  if (!auth.loggedIn) {
    console.log('not logged in, denying access to private route.');
    const params = new URLSearchParams();
    params.set('from', new URL(request.url).pathname);
    return redirect('/login?' + params.toString());
  }
  console.log('logged in, allowing access to private route.');
  return null;
}

export default function PrivateRoutes ({ children }) {
  const location = useLocation();

  console.log('entering private route. checking if logged in:', auth.loggedIn);

  return (
    auth.loggedIn 
      ? children
      : <Navigate
        to="/login"
        state={{
          from: location.search
        }}
      />
  );
}
