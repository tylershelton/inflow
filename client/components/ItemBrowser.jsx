import React, { useState } from 'react';
import BrowserItem from './BrowserItem';
import { Outlet, useLoaderData } from 'react-router-dom';

export async function loader ({ request }) {
  const url = new URL(request.url);
  const data = await fetch(url);
  const category = await data.json();
  category.type = url.pathname.includes('categories')
    ? 'category'
    : 'feed';
  const feeditemurl = `/feeditems/${category.type}/${category.id}`;
  const itemdata = await fetch(feeditemurl);
  const items = await itemdata.json();
  return { category, items };
}

export default function ItemBrowser () {
  const { category, items } = useLoaderData();
  console.log(items);

  // const [feedItems, setFeedItems] = useState([]);
  const [syncStatus, setSyncStatus] = useState('Sync');

  // const handleClick = async (e) => {
  //   e.preventDefault();
  //   setSyncStatus('Syncing...');
  //   const data = await fetch(e.target.href);
  //   const newItems = await data.json();
  //   setFeedItems(newItems);
  //   setSyncStatus('Sync');
  // };

  const feedItemComponents = items.map((item, i) => {
    return (<BrowserItem item={item} />);
  });
  
  const apiCategory = category.type === 'category' ? 'categories' : 'feeds';

  return (
    <>
      <section className='itemBrowser'>
        <h2>{category.title}</h2>
        <a href={`/${apiCategory}/${category.id}/sync`}>{syncStatus}</a>
        {feedItemComponents}
      </section>
      <Outlet />
    </>
  );
}
