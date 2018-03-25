const webpack = require('webpack');
const SpriteLoaderPlugin = require('svg-sprite-loader/plugin');

const { environment } = require('@rails/webpacker')
const erb =  require('./loaders/erb')

// Extract icons in a dedicated SVG file
const extractIcons = new SpriteLoaderPlugin();

environment.loaders.insert(
  'SvgSpriteLoader',
  {
    test: /\.svg$/,
    use: [
      {
        loader: 'svg-sprite-loader',
        options: {
          extract: true,
          spriteFilename: 'assets/icons.svg',
          esModule: false,
        }
      },
      {
        loader: 'svgo-loader',
        options: {
          plugins: [
            {
              removeAttrs: {
                attrs: '(fill|stroke)'
              },
            },
            {
              convertPathData: false,
            }
          ],
        }
      },
    ],
  }
);

environment.plugins.insert(
  'SpriteLoaderPlugin',
  extractIcons
);

environment.plugins.insert(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    'window.jQuery': 'jquery'
  })
)

environment.loaders.append('erb', erb)

module.exports = environment
