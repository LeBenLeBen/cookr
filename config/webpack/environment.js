const path = require('path');
const webpack = require('webpack');
const SpriteLoaderPlugin = require('svg-sprite-loader/plugin');

const { environment } = require('@rails/webpacker');
const svgIcons = require('./loaders/svg-icons');
const erb = require('./loaders/erb');
const vue = require('./loaders/vue');

environment.config.set('resolve.alias', {
  vue: 'vue/dist/vue.esm.js',
});

// Customize file-loader to ignore SVG files which are handled by svg-sprite-loader
const fileLoader = environment.loaders.get('file');
fileLoader.exclude = [
  path.resolve('app/assets/icons'),
  path.resolve('node_modules/ucreate-icons'),
];

// Extract icons in a dedicated SVG file
const extractIcons = new SpriteLoaderPlugin();
environment.plugins.insert(
  'SpriteLoaderPlugin',
  extractIcons
);

environment.loaders.insert('svg-icns', svgIcons);
environment.loaders.append('erb', erb);
environment.loaders.append('vue', vue);

module.exports = environment
