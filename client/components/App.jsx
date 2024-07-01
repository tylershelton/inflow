// dependencies
import React, { useEffect, useState } from 'react';
import { Outlet } from 'react-router-dom';

// internal libraries
import eventBus from '../lib/eventBus';

// internal components
import Article from './Article';
import Sidebar from './Sidebar';

export default function App () {
  const [browserTarget, setBrowserTarget] = useState();
  const [browserData, setBrowserData] = useState();

  const [currFeedItemUrl, setCurrFeedItemUrl] = useState();
  const [currFeedItem, setCurrFeedItem] = useState();

  // handle incoming url data intercepted from
  // sidebar links
  eventBus.on('browse', (targetInfo) => {
    setBrowserTarget(targetInfo);
  });

  eventBus.on('openFeedItem', (url) => {
    setCurrFeedItemUrl(url);
  });

  // get data for the article browser from the server
  useEffect(() => {
    if (!browserTarget) return;
    async function getFeedItems () {
      const data = await fetch(browserTarget.url);
      const feed = await data.json();
      setBrowserData(feed);
      // clear state elements that drive the article view
      if (currFeedItemUrl) setCurrFeedItemUrl();
      if (currFeedItem) setCurrFeedItem();
    }
    getFeedItems();
  }, [browserTarget]);

  // get data for the article view from the server
  useEffect(() => {
    if (!currFeedItemUrl) return;
    async function getFeedItem () {
      const data = await fetch(currFeedItemUrl);
      const feeditem = await data.json();
      setCurrFeedItem(feeditem);
    }
    getFeedItem();
  }, [currFeedItemUrl]);

  let article;
  if (currFeedItem) {
    article = (<Article
      title = {currFeedItem.title}
      description = {currFeedItem.description}
      pubdate = {currFeedItem.pubdate}
      url = {currFeedItem.url}
    />);
  }

  return (
    <main id="app">
      <Sidebar />
      <Outlet />
    </main>
  );
}
