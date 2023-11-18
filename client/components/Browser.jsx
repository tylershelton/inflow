import React, { useEffect, useState } from 'react';
import BrowserItem from './BrowserItem';

const Browser = ({ id, groupType, title }) => {
  const [feedItems, setFeedItems] = useState([]);

  useEffect(() => {
    async function getFeedItems () {
      const data = await fetch(`/feeditems/${groupType}/${id}?all=false`);
      const items = await data.json();
      setFeedItems(items);
    }
    getFeedItems();
  }, [id]);

  const handleClick = async (e) => {
    e.preventDefault();
    const data = await fetch(e.target.href);
    const newItems = await data.json();
    setFeedItems([...newItems, ...feedItems]);
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
  
  const apiCategory = groupType === 'feed' ? 'feeds' : 'categories';

  return (
    <section className='browser'>
      <h2>{title}</h2>
      <a onClick={handleClick} href={`/${apiCategory}/${id}/sync`}>Sync</a>
      {feedItemComponents}
    </section>
  );
};

export default Browser;
