return {
  'pmizio/typescript-tools.nvim',
  config = function()
    require('lspconfig').tsserver.setup {}
  end,
}
