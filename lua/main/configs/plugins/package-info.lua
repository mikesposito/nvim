-- Show information about the NPM packages.

return {
  'vuki656/package-info.nvim',
  dependencies = {
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('package-info').setup()
  end,
}
