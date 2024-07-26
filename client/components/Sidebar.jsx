import React from 'react';
import {
  Link,
  redirect,
  useFetcher,
  useRouteLoaderData,
} from 'react-router-dom';

import auth from '../api/auth';
import CategoryList from './CategoryList';
import LogoutButton from './LogoutButton';

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
            <LogoutButton />
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
