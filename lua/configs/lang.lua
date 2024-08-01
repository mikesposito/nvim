-- Configuration for language servers and tools

return {
  -- LSP
  require 'plugins.lspconfig',

  -- Rust
  require 'plugins.rust-tools',

  -- TypeScript
  require 'plugins.typescript-tools',
}
