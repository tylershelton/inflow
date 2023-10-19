import React from 'react';

import CategoryList from './CategoryList';

const Sidebar = () => {
  return (
    <section className='sidebar'>
      <header>
        <h1>Inflow</h1>
        <img src="#" alt="Inflow logo" />
      </header>
      <CategoryList />  
    </section>
  );
};

export default Sidebar;
