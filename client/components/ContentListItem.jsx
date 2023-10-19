import React from 'react';

const ContentListItem = ({ id, title }) => {
  return (
    <li data-id={id}>{title}</li>
  );
};

export default ContentListItem;
