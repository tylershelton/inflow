import React, { useEffect, useState } from 'react';

import CategoryList from './CategoryList';
import { Link } from 'react-router-dom';

const Sidebar = ({ categories }) => {
  const [ loggedIn, setLoggedIn ] = useState(() => {
    const val = localStorage.getItem('isAuthenticated');
    return val !== null ? JSON.parse(val) : false;
  });

  useEffect(() => {
    localStorage.isAuthenticated = JSON.stringify(loggedIn);
  }, [loggedIn]);

  return (
    <section className='sidebar'>
      <header>
        <h1>Inflow</h1>
        <img src="#" alt="Inflow logo" />
        <section>
          {loggedIn
            ? <Link to="logout">Sign Out</Link>
            : <>
              <Link to="login">Sign In</Link><br/>
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
