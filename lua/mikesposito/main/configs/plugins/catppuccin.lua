local P = require 'mikesposito.preferences.general'

return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      flavour = P.THEME_FLAVOUR,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        notify = true,
        barbar = true,
        barbecue = {
          dim_dirname = true,
          bold_basename = true,
          dim_context = false,
          alt_background = false,
        },
        dap_ui = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { 'italic' },
            hints = { 'italic' },
            warnings = { 'italic' },
            information = { 'italic' },
            ok = { 'italic' },
          },
          underlines = {
            errors = { 'underline' },
            hints = { 'underline' },
            warnings = { 'underline' },
            information = { 'underline' },
            ok = { 'underline' },
          },
          inlay_hints = {
            background = true,
          },
        },
        which_key = true,
        lsp_trouble = true,
      },
    }
    vim.cmd 'colorscheme catppuccin'
  end,
}
