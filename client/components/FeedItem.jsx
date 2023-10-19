import React from 'react';
import eventBus from '../lib/eventBus';

const FeedItem = ({ id, title, pubdate, url, archived }) => {
  function handleClick (e) {
    e.preventDefault();
    eventBus.dispatch('openFeedItem', e.target.href);
  }

  return (
    <article>
      <h3><a onClick={handleClick} href={`/feeditems/${id}`}>{title}</a></h3>
      <time dateTime={pubdate}>{new Date(pubdate).toDateString()}</time>
    </article>
  );
};

export default FeedItem;
