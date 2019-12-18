const path = require('path');
const webpack = require('webpack');
const SpriteLoaderPlugin = require('svg-sprite-loader/plugin');

const { environment } = require('@rails/webpacker');
const { VueLoaderPlugin } = require('vue-loader');
const vue = require('./loaders/vue');
const svgIcons = require('./loaders/svg-icons');
const erb = require('./loaders/erb');

environment.config.set('resolve.alias', {
  vue: 'vue/dist/vue.esm.js',
});

// Customize file-loader to ignore SVG files which are handled by svg-sprite-loader
const fileLoader = environment.loaders.get('file');
fileLoader.exclude = [
  path.resolve('app/assets/icons'),
  path.resolve('node_modules/ucreate-icons'),
];

environment.loaders.append('erb', erb);
environment.loaders.append('vue', vue);
environment.loaders.append('svg-icons', svgIcons);

// Extract icons in a dedicated SVG file
const extractIcons = new SpriteLoaderPlugin();
environment.plugins.insert('SpriteLoaderPlugin', extractIcons);

environment.plugins.append('VueLoaderPlugin', new VueLoaderPlugin());

module.exports = environment;
