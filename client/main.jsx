// dependencies
import React from 'react';
import { createRoot } from 'react-dom/client';
import {
  createBrowserRouter,
  createRoutesFromElements,
  Outlet,
  Route,
  RouterProvider,
} from 'react-router-dom';

import App from './components/App';

import ItemBrowser, {
  loader as itemBrowserLoader,
} from './components/ItemBrowser';

import styles from './stylesheets/application.scss'; // webpack will pick this up

const router = createBrowserRouter(
  createRoutesFromElements(
    <Route path="/" element={<App />}>
      <Route path="categories/:categoryId"
        element={<ItemBrowser />}
        loader={itemBrowserLoader}
      >
      </Route>
    </Route>
  )
);

createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <RouterProvider router={router} />
  </React.StrictMode>
);
