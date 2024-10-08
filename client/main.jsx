// dependencies
import React from 'react';
import { createRoot } from 'react-dom/client';
import {
  createBrowserRouter,
  createRoutesFromElements,
  Route,
  RouterProvider,
} from 'react-router-dom';

// internal imports
import auth from './api/auth';

import Root, {
  loader as rootLoader,
} from './routes/Root';

import ErrorDisplay from './components/ErrorDisplay';

import ItemBrowser, {
  action as itemBrowserAction,
  loader as itemBrowserLoader,
} from './components/ItemBrowser';

import Article, {
  loader as articleLoader,
} from './components/Article';

import {
  action as loginAction,
  loader as loginLoader,
} from './components/Login';

import {
  action as signupAction,
} from './components/Signup';

import {
  action as logoutAction
} from './routes/Logout';

import styles from './stylesheets/application.scss'; // webpack will pick this up

// once on load, check with the server whether any session cookie we may have
// is still valid
await auth.check();

const router = createBrowserRouter(
  createRoutesFromElements(
    <Route path="/"
      id='root'
      element={<Root />}
      loader={rootLoader}
    >
      <Route errorElement={<ErrorDisplay />}>
        <Route path="collections/:collectionId"
          loader={itemBrowserLoader}
          action={itemBrowserAction}
          element={<ItemBrowser />}
        >
          <Route path="item/:itemId"
            element={<Article />}
            loader={articleLoader}
          />
        </Route>
        <Route path="feeds/:feedId"
          element={<ItemBrowser />}
          loader={itemBrowserLoader}
          action={itemBrowserAction}
        >
          <Route path="item/:itemId"
            element={<Article />}
            loader={articleLoader}
          />
        </Route>
        <Route path="logout"
          action={logoutAction}
        />
      </Route>
      <Route path="login"
        action={loginAction}
        loader={loginLoader}
      />
      <Route path="signup"
        action={signupAction}
      />
    </Route>
  )
);

createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <RouterProvider router={router} />
  </React.StrictMode>
);
