return {
  'pmizio/typescript-tools.nvim',
  config = function()
    vim.lsp.config.tsserver.setup {}
  end,
}
