import React from 'react';

import ContentListItem from './ContentListItem';

const ContentList = ({ contents }) => {
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
};

export default ContentList;
