const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');

module.exports = {
  // This property defines where the application starts
  entry: './client/app.jsx',

  // Define the filepath and file name used for deploying
  // the bundled file
  output: {
    path: path.join(__dirname, '/dist'),
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
    ],
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: './client/index.html'
    }),
  ],
  devServer: {
    static: {
      directory: path.join(__dirname, '/dist'),
    },
  },
  devtool: 'eval-source-map',
};