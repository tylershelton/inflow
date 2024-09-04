// dependencies
import React from 'react';
import { Outlet, useLoaderData } from 'react-router-dom';

import { getCollections } from '../api/categories';

// internal components
import Sidebar from '../components/Sidebar';
import auth from '../api/auth';

export async function loader () {
  const collections = auth.loggedIn
    ? await getCollections()
    : [];
  return { loggedIn: auth.loggedIn, collections: collections };
}

export default function Root () {
  const { collections } = useLoaderData();

  return (
    <>
      <Sidebar collections={collections} />
      <Outlet />
    </>
  );
}
