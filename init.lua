-- Author: @mikesposito

-- Load nvim preferences
require('settings.preferences')

-- Load lazy.nvim plugin and all the plugins configurations
require('main.lazy')

-- Load keymaps
-- Needs to be loaded after the plugins configurations
require('settings.keymaps')
