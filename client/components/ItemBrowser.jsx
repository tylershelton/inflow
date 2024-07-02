import React, { useState } from 'react';
import BrowserItem from './BrowserItem';
import { Outlet, useLoaderData } from 'react-router-dom';

async function getCategory (id) {
  const data = await fetch(`/categories/${id}`);
  return await data.json();
}

async function getFeedItems (category) {
  console.log('getting feed items for --');
  console.log(category);
  const data = await fetch(`/feeditems/${category.type}/${category.id}?all=false`);
  return await data.json();
}

export async function loader ({ request, params }) {
  const url = new URL(request.url);
  const category = await getCategory(params.categoryId);
  category.type = url.pathname.includes('categories')
    ? 'category'
    : 'feed';
  return { category, items: await getFeedItems(category) };
}

export default function ItemBrowser () {
  const { category, items } = useLoaderData();

  const [syncStatus, setSyncStatus] = useState('Sync');

  const feedItemComponents = items.map((item, i) => {
    return (<BrowserItem key={`browseritem-${i}`} item={item} />);
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
