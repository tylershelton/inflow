import React, { useEffect, useState } from 'react';

import Category from './Category';


const CategoryList = () => {
  const [categories, setCategories] = useState(['Sports', 'News']);
  
  useEffect(() => getCategories(), []);
  
  const getCategories = async () => {
    const data = await fetch('/categories');
    const categories = await data.json();
    setCategories(categories.map(cat => cat.name));
  };

  const categoryComponents = categories.map((name, i) => {
    return (<Category
      key  = {`cat-${i}`}
      name = {name}
    />);
  });

  return (
    <nav>
      <h2>Categories</h2>
      <ul>
        {categoryComponents}
      </ul>
    </nav>
  );
};

export default CategoryList;
