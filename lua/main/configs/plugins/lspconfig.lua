return {
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    -- Useful status updates for LSP
    'j-hui/fidget.nvim',
    -- Additional lua configuration, makes nvim stuff amazing!
    'folke/neodev.nvim',
    -- Signature help for LSP
    'ray-x/lsp_signature.nvim',
  },
  config = function()
    require('mason').setup()

    -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.g.autocompletion_enabled and require('cmp_nvim_lsp').default_capabilities(capabilities) or {}

    local mason_lspconfig = require 'mason-lspconfig'

    mason_lspconfig.setup {
      ensure_installed = vim.tbl_keys(vim.g.lang_lsp_servers),
    }

    local on_lsp_attach = function(_, bufnr)
      require('lsp_signature').on_attach({
        bind = true,
        hint_enable = false,
        handler_opts = {
          border = 'single',
        },
      }, bufnr)
    end

    mason_lspconfig.setup_handlers {
      function(server_name)
        require('lspconfig')[server_name].setup {
          capabilities = capabilities,
          settings = vim.g.lang_lsp_servers[server_name],
          filetypes = (vim.g.lang_lsp_servers[server_name] or {}).filetypes,
          on_attach = on_lsp_attach,
        }
      end,
    }
  end,
}
