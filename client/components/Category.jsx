import React, { useEffect, useState } from 'react';
import ContentList from './ContentList';

const Category = ({ catid, name }) => {

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
      <li>{name}</li>
      {contentList}
    </div>
  );
};

export default Category;
