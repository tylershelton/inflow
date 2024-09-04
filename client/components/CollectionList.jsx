import React from 'react';

import Collection from './Collection';

export default function CollectionList ({ collections }) {
  const collectionComponents = collections.map((coll, i) => {
    return (<Collection
      key      = {`cat-${i}`}
      coll_id  = {coll.id}
      title    = {coll.title}
      contents = {coll.contents}
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
