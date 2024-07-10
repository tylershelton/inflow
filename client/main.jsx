// dependencies
import React from 'react';
import { createRoot } from 'react-dom/client';
import {
  createBrowserRouter,
  createRoutesFromElements,
  Route,
  RouterProvider,
} from 'react-router-dom';

import Root, {
  loader as rootLoader,
} from './components/Root';

import ItemBrowser, {
  loader as itemBrowserLoader,
} from './components/ItemBrowser';

import Article, {
  loader as articleLoader,
} from './components/Article';

import styles from './stylesheets/application.scss'; // webpack will pick this up

const router = createBrowserRouter(
  createRoutesFromElements(
    <Route path="/"
      element={<Root />}
      loader={rootLoader}
    >
      <Route path="categories/:categoryId"
        element={<ItemBrowser />}
        loader={itemBrowserLoader}
      >
        <Route path="item/:itemId"
          element={<Article />}
          loader={articleLoader}
        />
      </Route>
      <Route path="feeds/:feedId"
        element={<ItemBrowser />}
        loader={itemBrowserLoader}
      >
        <Route path="item/:itemId"
          element={<Article />}
          loader={articleLoader}
        />
      </Route>
    </Route>
  )
);

createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <RouterProvider router={router} />
  </React.StrictMode>
);
