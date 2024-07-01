// dependencies
import React, { useEffect, useState } from 'react';
import { Outlet, useLoaderData } from 'react-router-dom';

// internal libraries
// import eventBus from '../lib/eventBus';

// internal components
// import Article from './Article';
import Sidebar from './Sidebar';

export async function loader () {
  return fetch('/categories');
}

export default function Root () {
  const categories = useLoaderData();
  
  // const [currFeedItemUrl, setCurrFeedItemUrl] = useState();
  // const [currFeedItem, setCurrFeedItem] = useState();

  // eventBus.on('openFeedItem', (url) => {
  //   setCurrFeedItemUrl(url);
  // });

  // get data for the article view from the server
  // useEffect(() => {
  //   if (!currFeedItemUrl) return;
  //   async function getFeedItem () {
  //     const data = await fetch(currFeedItemUrl);
  //     const feeditem = await data.json();
  //     setCurrFeedItem(feeditem);
  //   }
  //   getFeedItem();
  // }, [currFeedItemUrl]);

  // let article;
  // if (currFeedItem) {
  //   article = (<Article
  //     title = {currFeedItem.title}
  //     description = {currFeedItem.description}
  //     pubdate = {currFeedItem.pubdate}
  //     url = {currFeedItem.url}
  //   />);
  // }

  return (
    <>
      <Sidebar categories={categories} />
      <Outlet />
    </>
  );
}
