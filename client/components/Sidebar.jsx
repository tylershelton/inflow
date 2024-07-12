import React from 'react';

import CategoryList from './CategoryList';

const Sidebar = ({ categories }) => {
  return (
    <section className='sidebar'>
      <header>
        <h1>Inflow</h1>
        <img src="#" alt="Inflow logo" />
      </header>
      <CategoryList categories={categories} />  
    </section>
  );
};

export default Sidebar;
