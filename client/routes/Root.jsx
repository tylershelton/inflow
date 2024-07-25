// dependencies
import React from 'react';
import { Outlet, useLoaderData } from 'react-router-dom';

import { getCategories } from '../api/categories';

// internal components
import Sidebar from '../components/Sidebar';
import auth from '../api/auth';

export async function loader () {
  const categories = auth.loggedIn
    ? await getCategories()
    : [];
  return { loggedIn: auth.loggedIn, categories };
}

export default function Root () {
  const { categories } = useLoaderData();

  return (
    <>
      <Sidebar categories={categories} />
      <Outlet />
    </>
  );
}
