import React from 'react';
import { NavLink } from 'react-router-dom';

import ContentList from './ContentList';

export default function Collection ({ coll_id, title, contents }) {
  let contentList;
  if (contents) contentList = <ContentList contents={contents} />;

  return (
    <div>
      <li data-id={coll_id}><NavLink to={`/collections/${coll_id}`}>{title}</NavLink></li>
      {contentList}
    </div>
  );
}
