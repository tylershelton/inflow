import React from 'react';

import CategoryList from './CategoryList';
import { Link } from 'react-router-dom';

const Sidebar = ({ categories }) => {
  return (
    <section className='sidebar'>
      <header>
        <h1>Inflow</h1>
        <img src="#" alt="Inflow logo" />
        <section>
          <Link to="signup">Sign Up</Link><br/>
          <Link to="login">Sign In</Link>
        </section>
      </header>
      <CategoryList categories={categories} />  
    </section>
  );
};

export default Sidebar;
