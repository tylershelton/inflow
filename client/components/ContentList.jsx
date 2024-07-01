import React from 'react';

import ContentListItem from './ContentListItem';

export default function ContentList ({ contents }) {
  const contentListItems = contents.map((item, i) => {
    return (<ContentListItem
      key = {`contentlistitem-${i}`}
      id = {item.id}
      title = {item.title}
    />);
  });

  return (
    <ul>
      {contentListItems}
    </ul>
  );
}
