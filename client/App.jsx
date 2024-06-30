// core
import React, { useEffect, useState } from 'react';
import { createRoot } from 'react-dom/client';

import {
  createBrowserRouter,
  createRoutesFromElements,
  Route,
  RouterProvider,
} from 'react-router-dom';

// internal libraries
import eventBus from './lib/eventBus';

// components
import Article from './components/Article';
import Browser from './components/Browser';
import Sidebar from './components/Sidebar';
import styles from './stylesheets/application.scss'; // webpack will pick this up

const App = () => {
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

  // build out state-based UI elements
  let browser;
  if (browserData) {
    browser = (<Browser
      id = {browserData.id}
      title = {browserData.title}
      groupType = {browserTarget.type}
    />);
  }

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
    <div id="app-container">
      <Sidebar />
      {browser}
      {article}
    </div>
  );
};

const router = createBrowserRouter(
  createRoutesFromElements(
    <Route path="/" element={<App />}>

    </Route>
  )
);

createRoot(document.getElementById('app')).render(
  <React.StrictMode>
    <RouterProvider router={router} />
  </React.StrictMode>
);
