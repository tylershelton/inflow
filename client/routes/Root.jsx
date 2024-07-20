// dependencies
import React from 'react';
import { Outlet, useLoaderData } from 'react-router-dom';

import { getCategories } from '../api/categories';

// internal components
import Sidebar from '../components/Sidebar';
import auth from '../utils/auth';

export async function loader () {
  const loggedIn = await auth.check();
  const categories = loggedIn
    ? await getCategories()
    : [];
  return { loggedIn, categories };
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
