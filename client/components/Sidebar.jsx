import React from 'react';

import CategoryList from './CategoryList';
import {
  Link,
  redirect,
  useFetcher,
  useRouteLoaderData,
} from 'react-router-dom';

import auth from '../api/auth';

export async function action () {
  await auth.logout();
  return redirect('/');
}

export default function Sidebar ({ categories }) {
  const { loggedIn } = useRouteLoaderData('root');
  const fetcher = useFetcher();

  return (
    <section className='sidebar'>
      <header>
        <h1>Inflow</h1>
        <img src="#" alt="Inflow logo" />
        <section>
          {loggedIn ?
            <fetcher.Form method="post" action="/logout">
              <button type="submit">
                Log Out
              </button>
            </fetcher.Form>
            :
            <>
              <Link to="login">Log In</Link><br/>
              <Link to="signup">Sign Up</Link>
            </>
          }
        </section>
      </header>
      { loggedIn
        ? <CategoryList categories={categories} />  
        : null
      }
    </section>
  );
}
