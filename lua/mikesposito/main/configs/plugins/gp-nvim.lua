local P = require 'mikesposito.setup.preferences'

return {
  "robitx/gp.nvim",
  config = function()
    require("gp").setup(P.GP_CONFIG)
  end,
}
