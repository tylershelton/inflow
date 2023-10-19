import React from 'react';

import CategoryList from './CategoryList';

const Sidebar = () => {
  return (
    <header className='debug-box'>
      <h1>Inflow</h1>
      <img src="#" alt="Inflow logo" />
      <CategoryList />  
    </header>
  );
};

export default Sidebar;
