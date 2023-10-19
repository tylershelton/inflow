import React from 'react';
import { createRoot } from 'react-dom/client';

import Sidebar from './components/Sidebar';
import styles from './stylesheets/application.scss'; // webpack will pick this up

const App = () => {
  return (
    <Sidebar />
  );
};

const root = createRoot(document.getElementById('app'));
root.render(<App />);
