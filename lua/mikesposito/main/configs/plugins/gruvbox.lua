return {
  'ellisonleao/gruvbox.nvim',
  config = function()
    require('gruvbox').setup()
    vim.o.background = 'dark'
    vim.cmd 'colorscheme gruvbox'
  end,
}
