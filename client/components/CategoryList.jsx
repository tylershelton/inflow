import React from 'react';

import Category from './Category';

export default function CategoryList ({ categories }) {
  const categoryComponents = categories.map((cat, i) => {
    return (<Category
      key   = {`cat-${i}`}
      catid = {cat.id}
      title = {cat.title}
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
}
