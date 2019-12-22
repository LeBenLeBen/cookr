process.env.NODE_ENV = process.env.NODE_ENV || 'development';

const environment = require('./environment');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');

environment.loaders.get('sass').use[0] = {
  loader: MiniCssExtractPlugin.loader,
  options: {
    hmr: true,
  },
};

environment.plugins.get('MiniCssExtract').options.filename = 'css/[name].css';

module.exports = environment.toWebpackConfig();
