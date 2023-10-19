import React, { useEffect, useState } from 'react';

import Category from './Category';


const CategoryList = () => {
  const [categories, setCategories] = useState([]);
  
  useEffect(() => {
    async function fetchCategories () {
      const data = await fetch('/categories');
      const categories = await data.json();
      setCategories(categories);
    }
    fetchCategories();
  }, []);

  const categoryComponents = categories.map((cat, i) => {
    return (<Category
      key   = {`cat-${i}`}
      catid = {cat.id}
      name  = {cat.name}
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
