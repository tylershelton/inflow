import React, { useEffect, useState } from 'react';
import FeedItem from './FeedItem';

const Feed = ({ id, title }) => {
  const [feedItems, setFeedItems] = useState([]);

  useEffect(() => {
    async function getFeedItems () {
      const data = await fetch(`/feeditems/feed/${id}?all=false`);
      const items = await data.json();
      setFeedItems(items);
    }
    getFeedItems();
  }, [id]);

  const feedItemComponents = feedItems.map((item, i) => {
    return (<FeedItem
      key = {`feeditem-${i}`}
      id = {item.id}
      title = {item.title}
      archived = {item.archived}
      pubdate = {item.pubdate}
      url = {item.url}
    />);
  });
  
  return (
    <section className='feedBrowser debug-box'>
      <h2>{title}</h2>
      {feedItemComponents}
    </section>
  );
};

export default Feed;
