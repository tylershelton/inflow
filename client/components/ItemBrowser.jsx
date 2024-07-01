import React, { useEffect, useState } from 'react';
import BrowserItem from './BrowserItem';
import { useLoaderData } from 'react-router-dom';

export async function loader ({ request }) {
  const url = new URL(request.url);
  const data = await fetch(url);
  const category = await data.json();
  category.type = url.pathname.includes('categories')
    ? 'category'
    : 'feed';
  return { category };
}

export default function ItemBrowser () {
  const { category } = useLoaderData();

  const [feedItems, setFeedItems] = useState([]);
  const [syncStatus, setSyncStatus] = useState('Sync');

  useEffect(() => {
    async function getFeedItems () {
      const data = await fetch(`/feeditems/${category.type}/${category.id}?all=false`);
      const items = await data.json();
      setFeedItems(items);
    }
    getFeedItems();
  }, [category.id]);

  const handleClick = async (e) => {
    e.preventDefault();
    setSyncStatus('Syncing...');
    const data = await fetch(e.target.href);
    const newItems = await data.json();
    setFeedItems(newItems);
    setSyncStatus('Sync');
  };

  const feedItemComponents = feedItems.map((item, i) => {
    return (<BrowserItem
      key = {`feeditem-${i}`}
      id = {item.id}
      feed_title= {item.feed_title}
      title = {item.title}
      archived = {item.archived}
      pubdate = {item.pubdate}
      url = {item.url}
    />);
  });
  
  const apiCategory = category.type === 'category' ? 'categories' : 'feeds';

  return (
    <section className='itemBrowser'>
      <h2>{category.title}</h2>
      <a onClick={handleClick} href={`/${apiCategory}/${category.id}/sync`}>{syncStatus}</a>
      {feedItemComponents}
    </section>
  );
}
