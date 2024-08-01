local eslint_prettier = {
  'eslint',
  'prettier',
  stop_after_first = true,
}

return {
  'stevearc/conform.nvim',
  lazy = true,
  event = {
    'BufWritePre',
    'BufNewFile',
  },
  config = function()
    local conform = require 'conform'
    conform.setup {
      notify_on_error = true,
      notify_no_formatters = true,
      formatters_by_ft = {
        lua = { 'stylua' },
        javascript = eslint_prettier,
        typescript = eslint_prettier,
        json = eslint_prettier,
        yaml = eslint_prettier,
        rust = { 'rustfmt' },
      },
      format_on_save = {
        lsp_fallback = false,
        async = false,
        timeout_ms = 500,
      },
    }
  end,
}
