import React from 'react';
import { NavLink } from 'react-router-dom';

export default function BrowserItem ({ entity, item }) {

  const apiEntity = entity.type === 'collection' ? 'collections' : 'feeds';

  return (
    <article>
      <h3><NavLink to={`/${apiEntity}/${entity.id}/item/${item.id}`}>{item.title}</NavLink></h3>
      <p>
        {/* Render the feed title if it is present */}
        {item.feed_title}{item.feed_title && <br/>}
        <time dateTime={item.pubdate}>{new Date(item.pubdate).toDateString()}</time>
      </p>
    </article>
  );
}
