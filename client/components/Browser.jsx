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
  
  return (
    <section className='feedBrowser'>
      <h2>{title}</h2>
      {feedItemComponents}
    </section>
  );
};

export default Browser;
