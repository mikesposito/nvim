return {
  'stevearc/conform.nvim',
  event = {
    'BufWritePre',
    'BufNewFile',
  },
  config = function()
    local conform = require('conform')
    conform.setup({
      formatters_by_filetype = {
        python = {
          function()
            return {
              exe = 'black',
              args = { '-q', '-' },
              stdin = true,
            }
          end,
        },
        lua = {
          function()
            return {
              exe = 'stylua',
              args = { '-' },
              stdin = true,
            }
          end,
        },
        javascript = {
          function()
            return {
              exe = 'prettier',
              args = { '--stdin-filepath', vim.api.nvim_buf_get_name(0) },
              stdin = true,
            }
          end,
        },
        --      typescript = {
        --        function()
        --          return {
        --            exe = 'eslint',
        --            args = { vim.api.nvim_buf_get_name(0) },
        --            stdin = true,
        --          }
        --        end,
        --      },
        --      json = {
        --        function()
        --          return {
        --            exe = 'jq',
        --            args = { '.' },
        --            stdin = true,
        --          }
        --        end,
        --      },
        yaml = {
          function()
            return {
              exe = 'yq',
              args = { '-y', '.' },
              stdin = true,
            }
          end,
        },
        markdown = {
          function()
            return {
              exe = 'pandoc',
              args = { '-f', 'markdown', '-t', 'markdown' },
              stdin = true,
            }
          end,
        },
        go = {
          function()
            return {
              exe = 'gofmt',
              args = {},
              stdin = true,
            }
          end,
        },
        rust = {
          function()
            return {
              exe = 'rustfmt',
              args = { '--emit=stdout' },
              stdin = true,
            }
          end,
        },
        sh = {
          function()
            return {
              exe = 'shfmt',
              args = { '-i', '2' },
              stdin = true,
            }
          end,
        },
        dockerfile = {
          function()
            return {
              exe = 'dockerfilelint',
              args = { '-' },
              stdin = true,
            }
          end,
        },
        html = {
          function()
            return {
              exe = 'prettier',
              args = { '--stdin-filepath', vim.api.nvim_buf_get_name(0) },
              stdin = true,
            }
          end,
        },
        css = {
          function()
            return {
              exe = 'prettier',
              args = { '--stdin-filepath', vim.api.nvim_buf_get_name(0) },
              stdin = true,
            }
          end,
        },
      },
      format_on_save = {
        lsp_fallback = false,
        async = false,
        timeout_ms = 500
      }
    })
  end,
}
