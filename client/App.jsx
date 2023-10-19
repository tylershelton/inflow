// core
import React, { useEffect, useState } from 'react';
import { createRoot } from 'react-dom/client';

// internal libraries
import eventBus from './lib/eventBus';

// components
import Article from './components/Article';
import Feed from './components/Feed';
import Sidebar from './components/Sidebar';
import styles from './stylesheets/application.scss'; // webpack will pick this up

const App = () => {
  const [currFeedUrl, setCurrFeedUrl] = useState();
  const [currFeed, setCurrFeed] = useState();

  const [currFeedItemUrl, setCurrFeedItemUrl] = useState();
  const [currFeedItem, setCurrFeedItem] = useState();

  // handle incoming url data intercepted from
  // sidebar links
  eventBus.on('browseFeed', (url) => {
    setCurrFeedUrl(url);
  });

  eventBus.on('openFeedItem', (url) => {
    setCurrFeedItemUrl(url);
  });

  // get data for the feed browser from the server
  useEffect(() => {
    if (!currFeedUrl) return;
    async function getFeedItems () {
      const data = await fetch(currFeedUrl);
      const feed = await data.json();
      setCurrFeed(feed);
    }
    getFeedItems();
  }, [currFeedUrl]);

  // get data for the article view from the server
  useEffect(() => {
    if (!currFeedUrl) return;
    async function getFeedItem () {
      const data = await fetch(currFeedItemUrl);
      const feeditem = await data.json();
      setCurrFeedItem(feeditem);
    }
    getFeedItem();
  }, [currFeedItemUrl]);

  // build out state-based UI elements
  let feed;
  if (currFeed) {
    feed = (<Feed
      id = {currFeed.id}
      title = {currFeed.title}
    />);
  }

  let article;
  if (currFeedItem) {
    console.log(currFeedItem);
    article = (<Article
      title = {currFeedItem.title}
      description = {currFeedItem.description}
      pubdate = {currFeedItem.pubdate}
      url = {currFeedItem.url}
    />);
  }

  return (
    <div>
      <Sidebar />
      {feed}
      {article}
    </div>
  );
};

const root = createRoot(document.getElementById('app'));
root.render(<App />);
