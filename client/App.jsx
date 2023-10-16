import React, { useState } from 'react';
import { createRoot } from 'react-dom/client';

const App = () => {
  return <p>Is this thing on?</p>;
};

const root = createRoot(document.getElementById('app'));
root.render(<App />);