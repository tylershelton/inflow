const path = require('path');
const conf = require('./server/config');
const HtmlWebpackPlugin = require('html-webpack-plugin');

module.exports = {
  mode: process.env.NODE_ENV,
  // This property defines where the application starts
  entry: './client/App.jsx',

  // Define the filepath and file name used for deploying
  // the bundled file
  output: {
    path: path.join(__dirname, 'build'),
    filename: 'bundle.js',
  },

  // Setup loaders
  module: {
    rules: [
      {
        test: /\.(js|jsx)$/,
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader'
        },
      },
      {
        test: /\.scss$/,
        exclude: /node_modules/,
        use: ['style-loader', 'css-loader', 'sass-loader'],
      }
    ],
  },
  
  resolve: {
    extensions: ['.jsx', '.js', '...'],
  },

  plugins: [
    new HtmlWebpackPlugin({
      template: './client/index.html'
    }),
  ],

  devServer: {
    host: '0.0.0.0',
    port: process.env.PORT || 8080,
    hot: true,
    proxy: { '/': `http://localhost:${conf.EXPRESS.PORT}` },
    static: {
      directory: path.join(__dirname, 'build'),
    },
  },

  watchOptions: {
    poll: 1000,
  },

  devtool: 'eval-source-map',
};
