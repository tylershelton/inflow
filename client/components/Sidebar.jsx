import React from 'react';

import CategoryList from './CategoryList';
import { Link } from 'react-router-dom';

const Sidebar = ({ categories }) => {
  return (
    <section className='sidebar'>
      <header>
        <h1>Inflow</h1>
        <img src="#" alt="Inflow logo" />
        <Link to="login">Log In</Link>
      </header>
      <CategoryList categories={categories} />  
    </section>
  );
};

export default Sidebar;
