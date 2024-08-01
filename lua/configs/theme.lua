-- Configuration for colorschemes and themes

return {
  {
    'projekt0n/github-nvim-theme',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('github-theme').setup({
        -- ...
      })

      vim.cmd('colorscheme github_dark_default')
    end,
  },

  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {},
  --   config = function ()
  --     vim.cmd('colorscheme tokyonight-night')
  --   end
  -- },

  {
    'nvim-tree/nvim-web-devicons',
    lazy = false,
    config = function ()
      require('nvim-web-devicons').setup()
    end
  },
}

