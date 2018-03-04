const webpack = require('webpack');
const { environment } = require('@rails/webpacker')

environment.plugins.insert(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    'window.jQuery': 'jquery'
  })
)

module.exports = environment
