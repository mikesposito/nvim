return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  setup = function()
    require('nvim-autopairs').setup()
  end,
}
