import React from 'react';
import eventBus from '../lib/eventBus';

const ContentListItem = ({ id, title }) => {
  function handleClick (e) {
    e.preventDefault();
    eventBus.dispatch('browseFeed', e.target.href);
  }

  return (
    <li data-id={id}><a onClick={handleClick} href={`/feeds/${id}`}>{title}</a></li>
  );
};

export default ContentListItem;
