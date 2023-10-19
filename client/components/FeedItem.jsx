import React from 'react';

const FeedItem = ({ id, title, pubdate, url, archived }) => {
  return (
    <article>
      <h3>{title}</h3>
      <time dateTime={pubdate}>{new Date(pubdate).toDateString()}</time>
    </article>
  );
};

export default FeedItem;
