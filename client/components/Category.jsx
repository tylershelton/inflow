import React, { useEffect, useState } from 'react';
import eventBus from '../lib/eventBus';

import ContentList from './ContentList';

const Category = ({ catid, title }) => {

  const [contents, setContents] = useState();

  useEffect(() => {
    async function getContents () {
      const data = await fetch(`/categories/${catid}/contents`);
      const contents = await data.json();
      setContents(contents);
    }
    getContents();
  }, []);

  const handleClick = (e) => {
    e.preventDefault();
    eventBus.dispatch('browse', {
      type: 'category',
      url: e.target.href,
    });
  };

  let contentList;
  if (contents) contentList = <ContentList contents = {contents} />;

  return (
    <div>
      <li data-id={catid}><a onClick={handleClick} href={`/categories/${catid}`}>{title}</a></li>
      {contentList}
    </div>
  );
};

export default Category;
