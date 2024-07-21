import React from 'react';

import CategoryList from './CategoryList';
import { Link, useRouteLoaderData } from 'react-router-dom';

const Sidebar = ({ categories }) => {
  const { loggedIn } = useRouteLoaderData('root');
  return (
    <section className='sidebar'>
      <header>
        <h1>Inflow</h1>
        <img src="#" alt="Inflow logo" />
        <section>
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
};

export default Sidebar;
