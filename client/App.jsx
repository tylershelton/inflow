// core
import React, { useEffect, useState } from 'react';
import { createRoot } from 'react-dom/client';

// internal libraries
import eventBus from './lib/eventBus';

// components
import Sidebar from './components/Sidebar';
import Feed from './components/Feed';
import styles from './stylesheets/application.scss'; // webpack will pick this up

const App = () => {
  const [currFeedUrl, setCurrFeedUrl] = useState('');
  const [currFeed, setCurrFeed] = useState();

  useEffect(() => {
    if (!currFeedUrl.length) return;
    async function getFeedItems () {
      const data = await fetch(currFeedUrl);
      const feed = await data.json();
      setCurrFeed(feed);
    }
    getFeedItems();
  }, [currFeedUrl]);

  eventBus.on('browseFeed', (url) => {
    setCurrFeedUrl(url);
  });

  let feed;
  if (currFeed) {
    feed = (<Feed
      id = {currFeed.id}
      title = {currFeed.title}
    />);
  }

  return (
    <div>
      <Sidebar />
      {feed}
    </div>
  );
};

const root = createRoot(document.getElementById('app'));
root.render(<App />);
