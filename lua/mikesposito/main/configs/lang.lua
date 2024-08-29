-- Configuration for language servers and tools

return {
  -- LSP
  require 'mikesposito.main.configs.plugins.lspconfig',

  -- Rust
  require 'mikesposito.main.configs.plugins.rust-tools',

  -- TypeScript
  require 'mikesposito.main.configs.plugins.typescript-tools',

  -- Yarn tools
  require 'mikesposito.main.configs.plugins.package-info',
}
