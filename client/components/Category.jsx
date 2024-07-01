import React, { useEffect, useState } from 'react';
import { NavLink } from 'react-router-dom';

import ContentList from './ContentList';

export default function Category ({ catid, title }) {

  const [contents, setContents] = useState();

  useEffect(() => {
    async function getContents () {
      const data = await fetch(`/categories/${catid}/contents`);
      const contents = await data.json();
      setContents(contents);
    }
    getContents();
  }, []);

  let contentList;
  if (contents) contentList = <ContentList contents = {contents} />;

  return (
    <div>
      <li data-id={catid}><NavLink to={`/categories/${catid}`}>{title}</NavLink></li>
      {contentList}
    </div>
  );
}
