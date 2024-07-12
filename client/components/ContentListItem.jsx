import React from 'react';
import { NavLink } from 'react-router-dom';

const ContentListItem = ({ id, title }) => {
  return (
    <li data-id={id}><NavLink to={`/feeds/${id}`}>{title}</NavLink></li>
  );
};

export default ContentListItem;
