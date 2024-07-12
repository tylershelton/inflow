import React from 'react';
import { NavLink } from 'react-router-dom';

export default function BrowserItem ({ category, item }) {

  const apiCategory = category.type === 'category' ? 'categories' : 'feeds';

  return (
    <article>
      <h3><NavLink to={`/${apiCategory}/${category.id}/item/${item.id}`}>{item.title}</NavLink></h3>
      <p>
        {/* Render the feed title if it is present */}
        {item.feed_title}{item.feed_title && <br/>}
        <time dateTime={item.pubdate}>{new Date(item.pubdate).toDateString()}</time>
      </p>
    </article>
  );
}
