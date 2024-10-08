-- Load the lazy.nvim plugin and all the plugins configurations.

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require 'mikesposito.main.settings.preferences'

require('lazy').setup({
  { import = 'mikesposito.main.configs', enabled = true },
}, {})

require 'mikesposito.main.settings.keymaps'
