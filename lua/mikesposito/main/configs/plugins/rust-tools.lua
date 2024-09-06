HOME_PATH = os.getenv 'HOME' .. '/'
MASON_PATH = HOME_PATH .. '.local/share/nvim/mason/packages/'
local codelldb_path = MASON_PATH .. 'codelldb/extension/adapter/codelldb'
local liblldb_path = MASON_PATH .. 'codelldb/extension/lldb/lib/liblldb.so'

return {
  'simrat39/rust-tools.nvim',
  config = function()
    require('rust-tools').setup {
      dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path),
      },
    }
  end,
}
