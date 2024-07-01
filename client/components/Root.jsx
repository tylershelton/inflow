// dependencies
import React from 'react';
import { Outlet, useLoaderData } from 'react-router-dom';

// internal components
import Sidebar from './Sidebar';

export async function loader () {
  const data = await fetch('/categories');
  const categories = await data.json();
  // populate each category with its feeds/contents
  for (const i in categories) {
    const data = await fetch(`/categories/${categories[i].id}/contents`);
    categories[i].contents = await data.json();
  }
  return categories;
}

export default function Root () {
  const categories = useLoaderData();

  return (
    <>
      <Sidebar categories={categories} />
      <Outlet />
    </>
  );
}
