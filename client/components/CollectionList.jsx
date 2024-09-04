import React from 'react';

import Category from './Category';

export default function CollectionList ({ collections }) {
  const collectionComponents = collections.map((cat, i) => {
    return (<Category
      key      = {`cat-${i}`}
      catid    = {cat.id}
      title    = {cat.title}
      contents = {cat.contents}
    />);
  });

  return (
    <nav>
      <h2>Collections</h2>
      <ul>
        {collectionComponents}
      </ul>
    </nav>
  );
}
