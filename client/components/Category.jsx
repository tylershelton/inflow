import React from 'react';
import { NavLink } from 'react-router-dom';

import ContentList from './ContentList';

export default function Category ({ catid, title, contents }) {
  let contentList;
  if (contents) contentList = <ContentList contents={contents} />;

  return (
    <div>
      <li data-id={catid}><NavLink to={`/collections/${catid}`}>{title}</NavLink></li>
      {contentList}
    </div>
  );
}
