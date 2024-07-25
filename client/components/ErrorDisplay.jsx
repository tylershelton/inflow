import React from 'react';
import {
  isRouteErrorResponse,
  Navigate,
  useLocation,
  useRouteError
} from 'react-router-dom';

export default function ErrorDisplay () {
  const error = useRouteError();
  
  if (isRouteErrorResponse(error) && error.status === 401) {
    const location = useLocation();

    const params = new URLSearchParams();
    params.append('from', location.pathname);

    return <Navigate to={'/login?' + params.toString()} />;
  }

  console.error(error);
  return (
    <section>
      <h1>Dang.</h1>
      <p>Something went very wrong.</p>
      <p>
        {error.statusText || error.message}
      </p>
    </section>
  );
}
