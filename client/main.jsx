// dependencies
import React from 'react';
import { createRoot } from 'react-dom/client';
import {
  createBrowserRouter,
  createRoutesFromElements,
  Route,
  RouterProvider,
} from 'react-router-dom';

import auth from './api/auth';

import Root, {
  loader as rootLoader,
} from './routes/Root';

import ItemBrowser, {
  action as itemBrowserAction,
  loader as itemBrowserLoader,
} from './components/ItemBrowser';

import Article, {
  loader as articleLoader,
} from './components/Article';

import Login, {
  action as loginAction,
} from './components/Login';

import Signup, {
  action as signupAction,
} from './components/Signup';

import { action as logoutAction } from './components/Sidebar';
import { loader as privateRouteLoader } from './routes/PrivateRoutes';

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
      <Route loader={privateRouteLoader}>
        <Route path="categories/:categoryId"
          element={<ItemBrowser />}
          loader={itemBrowserLoader}
          action={itemBrowserAction}
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
        element={<Login />}
        action={loginAction}
      />
      <Route path="logout"
        action={logoutAction}
      />
      <Route path="signup"
        element={<Signup />}
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
