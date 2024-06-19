import React from 'react';
import eventBus from '../lib/eventBus';

const BrowserItem = ({ id, feed_title, title, pubdate, url, archived }) => {
  function handleClick (e) {
    e.preventDefault();
    eventBus.dispatch('openFeedItem', e.target.href);
  }

  return (
    <article>
      <h3><a onClick={handleClick} href={`/feeditems/${id}`}>{title}</a></h3>
      <p>
        {/* Render the feed title if it is present */}
        {feed_title}{feed_title && <br/>}
        <time dateTime={pubdate}>{new Date(pubdate).toDateString()}</time>
      </p>
    </article>
  );
};

export default BrowserItem;
