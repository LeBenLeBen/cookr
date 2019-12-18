const path = require('path');

module.exports = {
  test: /\.svg$/,
  include: [
    path.resolve('app/assets/icons'),
    path.resolve('node_modules/ucreate-icons'),
  ],
  use: [
    {
      loader: 'svg-sprite-loader',
      options: {
        extract: true,
        spriteFilename: 'assets/icons.svg',
        esModule: false,
      },
    },
  ],
};
