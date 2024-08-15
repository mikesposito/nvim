-- Configuration for language servers and tools

return {
  -- LSP
  require 'main.configs.plugins.lspconfig',

  -- Rust
  require 'main.configs.plugins.rust-tools',

  -- TypeScript
  require 'main.configs.plugins.typescript-tools',
}
