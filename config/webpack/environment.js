const { environment } = require('@rails/webpacker')

const webpack = require('webpack')
environment.Plugins.prepend(
  'Provide',
  new webpack.ProVidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    Popper: 'popper.js'
  })
  )

module.exports = environment
