import React from 'react';
import {
  Link,
  useLocation,
  useRouteLoaderData,
} from 'react-router-dom';

// import auth from '../api/auth';
import CategoryList from './CategoryList';
import Login from './Login';
import LogoutButton from './LogoutButton';
import Signup from './Signup';

export default function Sidebar ({ categories }) {
  const { loggedIn } = useRouteLoaderData('root');
  const location = useLocation();

  let form;
  switch (location.pathname) {
  case '/login':
    form = <Login />;
    break;
  case '/signup':
    form = <Signup />;
    break;
  default:
    form = null;
  }

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
        {form}
      </header>
      { loggedIn
        ? <CategoryList categories={categories} />  
        : null
      }
    </section>
  );
}
