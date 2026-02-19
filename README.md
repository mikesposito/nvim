# nvim 

My personal Neovim configuration files.

![screenshot](./.github/assets/screenshot.png)

## Table of Contents

- [Quickstart](#quickstart)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Configuration](#configuration)
  - [Preferences](#preferences)
- [Plugins](#plugins)
  - [AI / Code Assistance](#ai--code-assistance)
  - [Completion](#completion)
  - [LSP](#lsp)
  - [Syntax & Treesitter](#syntax--treesitter)
  - [Debugging](#debugging)
  - [Diagnostics](#diagnostics)
  - [Git](#git)
  - [File Navigation](#file-navigation)
  - [UI / Window Management](#ui--window-management)
  - [Terminal](#terminal)
  - [Tmux Integration](#tmux-integration)
  - [Editing](#editing)
  - [Formatting](#formatting)
  - [Markdown](#markdown)
  - [Highlighting](#highlighting)
  - [Theme](#theme)
  - [Utilities](#utilities)
- [Language Servers (Mason)](#language-servers-mason)
  - [Adding or Customizing LSP Servers](#adding-or-customizing-lsp-servers)
- [Keymaps](#keymaps)
  - [Navigation](#navigation)
  - [Window splitting](#window-splitting)
  - [Pane / Tmux navigation](#pane--tmux-navigation)
  - [Code navigation](#code-navigation)
  - [Code documentation](#code-documentation)
  - [Code actions](#code-actions)
  - [Debug & Diagnostics](#debug--diagnostics)
  - [Troubles](#troubles)
  - [Window management](#window-management)
  - [Search](#search)
  - [Formatting](#formatting-1)
  - [Diff](#diff)
  - [Git](#git-1)
  - [GitHub](#github)
  - [Tab management](#tab-management)
  - [Completion](#completion-1)
  - [Treesitter](#treesitter)

## Quickstart

### Prerequisites

- [Neovim](https://neovim.io/)
- [Lazygit](https://github.com/jesseduffield/lazygit) - The only graphical git interface you'll ever need
- [Ripgrep](https://github.com/BurntSushi/ripgrep?tab=readme-ov-file#installation) - For fast search
- [gh](https://cli.github.com/) - For nice GitHub integrations (e.g. PR list, issue list, reviews, etc)
  - (Optional) [gh-dash](https://github.com/dlvhdr/gh-dash?tab=readme-ov-file#-installation) - For a nice cli dashboard with PRs, issues, reviews, etc
- (Optional) [Fzf](https://github.com/junegunn/fzf?tab=readme-ov-file#installation) - For ludicrous fast fuzzy search

### Installation

1. Backup your current nvim configuration files

```bash
mv ~/.config/nvim ~/.config/nvim.bak
```

2. Clone this repository

```bash
git clone https://github.com/mikesposito/nvim ~/.config/nvim
```

3. Open nvim and wait for the plugins to be installed

```bash
nvim
```

## Configuration 

### Preferences

The default editor preferences can be found here:
- `lua/mikesposito/setup/init.lua`: Configuration file loaded on startup
- `lua/mikesposito/setup/preferences.lua`: General editor preferences
- `lua/mikesposito/setup/keymaps.lua`: Key bindings 

You can add any custom configuration in the `lua/mikesposito/setup` folder, so you can keep pulling updates from this repository (hopefully) without conflicts.

## Plugins

### AI / Code Assistance

| Plugin | Description |
|--------|-------------|
| [copilot.vim](https://github.com/github/copilot.vim) | GitHub Copilot AI pair programming assistant |
| [gp.nvim](https://github.com/robitx/gp.nvim) | ChatGPT-style AI assistant for code generation and chat |

### Completion

| Plugin | Description |
|--------|-------------|
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Autocompletion framework with multiple source support |
| [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) | LSP source for nvim-cmp |
| [cmp-path](https://github.com/hrsh7th/cmp-path) | Path completion source for nvim-cmp |
| [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) | LuaSnip snippet source for nvim-cmp |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Fast snippet engine written in Lua |
| [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) | Collection of snippets for various languages |

### LSP

| Plugin | Description |
|--------|-------------|
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | Quickstart configurations for the Neovim LSP client |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | Portable package manager for LSP servers, DAP servers, linters, and formatters |
| [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) | Bridge between mason.nvim and nvim-lspconfig |
| [fidget.nvim](https://github.com/j-hui/fidget.nvim) | LSP progress notifications |
| [neodev.nvim](https://github.com/folke/neodev.nvim) | Enhanced Lua development for Neovim config |
| [lsp_signature.nvim](https://github.com/ray-x/lsp_signature.nvim) | Function signature hints as you type |
| [nvim-navic](https://github.com/SmiteshP/nvim-navic) | Breadcrumb navigation using LSP symbols |

### Syntax & Treesitter

| Plugin | Description |
|--------|-------------|
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Advanced syntax highlighting and code parsing |
| [nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects) | Syntax-aware text objects for functions, classes, and parameters |
| [nvim-tree-docs](https://github.com/nvim-treesitter/nvim-tree-docs) | Documentation comments generation |

### Debugging

| Plugin | Description |
|--------|-------------|
| [nvim-dap](https://github.com/mfussenegger/nvim-dap) | Debug Adapter Protocol client |
| [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) | UI for nvim-dap debugger |
| [nvim-dap-go](https://github.com/leoluz/nvim-dap-go) | Go debugging extension with Delve integration |
| [mason-nvim-dap.nvim](https://github.com/jay-babu/mason-nvim-dap.nvim) | Bridge between mason.nvim and nvim-dap |

### Diagnostics

| Plugin | Description |
|--------|-------------|
| [trouble.nvim](https://github.com/folke/trouble.nvim) | Pretty diagnostics, references, and quickfix list viewer |

### Git

| Plugin | Description |
|--------|-------------|
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git signs in the gutter for added/changed/deleted lines |
| [vim-fugitive](https://github.com/tpope/vim-fugitive) | Comprehensive Git wrapper |
| [diffview.nvim](https://github.com/sindrets/diffview.nvim) | Tabpage interface for viewing git diffs and file history |
| [gitlinker.nvim](https://github.com/ruifm/gitlinker.nvim) | Generate shareable permalinks to files |
| [octo.nvim](https://github.com/pwntester/octo.nvim) | GitHub issues and pull requests management |
| [pipeline.nvim](https://github.com/topaxi/pipeline.nvim) | View and interact with GitHub/GitLab CI/CD pipelines |

### File Navigation

| Plugin | Description |
|--------|-------------|
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Highly extendable fuzzy finder |
| [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) | FZF-native sorter for telescope |
| [fzf](https://github.com/junegunn/fzf) | Command-line fuzzy finder |
| [fzf.vim](https://github.com/junegunn/fzf.vim) | Vim integration for fzf |
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | Modern file explorer tree |
| [aerial.nvim](https://github.com/stevearc/aerial.nvim) | Code outline window for navigating symbols |

### UI / Window Management

| Plugin | Description |
|--------|-------------|
| [barbar.nvim](https://github.com/romgrk/barbar.nvim) | Tabline showing buffers as tabs |
| [barbecue.nvim](https://github.com/utilyre/barbecue.nvim) | VS Code-like winbar with breadcrumbs |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Fast and configurable statusline |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Displays available keybindings in a popup |
| [mini.starter](https://github.com/echasnovski/mini.starter) | Fast and flexible start screen |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | Indentation guides as vertical lines |
| [mini.indentscope](https://github.com/echasnovski/mini.indentscope) | Animated current scope indicator |
| [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) | File type icons |
| [nui.nvim](https://github.com/MunifTanjim/nui.nvim) | UI component library |

### Terminal

| Plugin | Description |
|--------|-------------|
| [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) | Persist and toggle multiple terminals |
| [vim-floaterm](https://github.com/voldikss/vim-floaterm) | Floating terminal window manager |

### Tmux Integration

| Plugin | Description |
|--------|-------------|
| [nvim-tmux-navigation](https://github.com/alexghergh/nvim-tmux-navigation) | Seamless navigation between Neovim splits and tmux panes |

### Editing

| Plugin | Description |
|--------|-------------|
| [Comment.nvim](https://github.com/numToStr/Comment.nvim) | Smart commenting plugin |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Auto-insert matching brackets and quotes |
| [local-highlight.nvim](https://github.com/tzachar/local-highlight.nvim) | Highlights word under cursor |
| [vim-sleuth](https://github.com/tpope/vim-sleuth) | Automatically detects indentation settings |

### Formatting

| Plugin | Description |
|--------|-------------|
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Lightweight formatter supporting multiple formatters per filetype |

### Markdown

| Plugin | Description |
|--------|-------------|
| [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) | Live markdown preview in browser |
| [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) | Renders markdown directly in buffer |

### Highlighting

| Plugin | Description |
|--------|-------------|
| [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | Highlights TODO, FIXME, BUG, and other comment keywords |

### Theme

| Plugin | Description |
|--------|-------------|
| [gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim) | Gruvbox colorscheme for Neovim |

### Utilities

| Plugin | Description |
|--------|-------------|
| [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) | Lua utility functions library |
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Modern plugin manager with lazy-loading |
| [image.nvim](https://github.com/3rd/image.nvim) | Image preview support |

## Language Servers (Mason)

LSP servers are automatically installed and managed via [Mason](https://github.com/williamboman/mason.nvim). The following language servers are configured by default:

| LSP Server | Languages | Description |
|------------|-----------|-------------|
| `rust_analyzer` | Rust | Full-featured Rust language support with Clippy integration |
| `taplo` | TOML | TOML file support and validation |
| `ts_ls` | TypeScript, JavaScript | TypeScript/JavaScript language server |
| `eslint` | TypeScript, JavaScript | JavaScript/TypeScript linting |
| `clangd` | C, C++ | C/C++ language server from LLVM |
| `html` | HTML, Twig, Handlebars | HTML language features |
| `solidity_ls_nomicfoundation` | Solidity | Solidity smart contract development |
| `lua_ls` | Lua | Lua language server (great for Neovim config) |
| `vimls` | Vim | Vim script language support |

### Adding or Customizing LSP Servers

To add new LSP servers or customize existing ones, edit the `P.LSP` table in `lua/mikesposito/setup/preferences.lua`:

```lua
P.LSP = {
  -- Add a new server
  pyright = {
    filetypes = { 'python' },
  },
  -- Customize an existing server
  rust_analyzer = {
    filetypes = { 'rust' },
    settings = {
      ['rust-analyzer'] = {
        checkOnSave = {
          command = 'clippy',
        },
      },
    },
  },
}
```

You can find available LSP servers in the [Mason registry](https://mason-registry.dev/registry/list).

## Keymaps

`<leader>` is mapped to `<space>`.

### Navigation

| Key | Action |
|-----|--------|
| `j` | Move down (respects wrapped lines) |
| `k` | Move up (respects wrapped lines) |
| `<C-d>` | Scroll down and center screen |
| `<C-u>` | Scroll up and center screen |
| `<leader>q` | Save and quit |

### Window splitting

| Key | Action |
|-----|--------|
| `<C-->` | Split window horizontally |
| `<C-\>` | Split window vertically |

### Pane / Tmux navigation

| Key | Action |
|-----|--------|
| `<C-h>` | Move to left pane |
| `<C-l>` | Move to right pane |
| `<C-j>` | Move to bottom pane |
| `<C-k>` | Move to top pane |

### Code navigation

| Key | Action |
|-----|--------|
| `gd` | Goto definition |
| `gr` | Goto references |
| `gi` | Goto implementation |
| `gD` | Goto type definition |

### Code documentation

| Key | Action |
|-----|--------|
| `Ds` | Document signature |
| `Dy` | Document symbols |
| `Dh` | Documentation hover |

### Code actions

| Key | Action |
|-----|--------|
| `<leader>ca` | Show available code actions |
| `<leader>cr` | Rename symbol |
| `<leader>csn` | Swap parameter with next |
| `<leader>csp` | Swap parameter with previous |

### Debug & Diagnostics

| Key | Action |
|-----|--------|
| `<leader>dt` | Toggle Debug UI |
| `<leader>dc` | Start / Continue debug session |
| `<leader>db` | Toggle breakpoint |
| `<leader>dsi` | Step into |
| `<leader>dso` | Step over |
| `<leader>dsO` | Step out |
| `<leader>do` | Open floating diagnostic |
| `<leader>dl` | Open diagnostics list |
| `<leader>d[` | Go to previous diagnostic |
| `<leader>d]` | Go to next diagnostic |

### Troubles

| Key | Action |
|-----|--------|
| `<leader>T` | Open Trouble panel |

### Window management

| Key | Action |
|-----|--------|
| `<leader>we` | Open file explorer (Neo-tree) |
| `<leader>ws` | Toggle symbols outline (Aerial) |
| `<leader>wt` | Toggle floating terminal |
| `<C-n>` | Exit terminal insert mode |

### Search

| Key | Action |
|-----|--------|
| `<leader>sf` | Find files |
| `<leader>s/` | Search in current buffer |
| `<leader>ss` | Select Telescope picker |
| `<leader>sh` | Search help tags |
| `<leader>sw` | Search word under cursor |
| `<leader>sg` | Search by grep |
| `<leader>sG` | Grep in git root |
| `<leader>sd` | Search diagnostics |
| `<leader>sr` | Resume last search |
| `<leader>s?` | Recently opened files |
| `<leader>s<space>` | Open buffers |

### Formatting

| Key | Action |
|-----|--------|
| `<leader>f` | Format current buffer |

### Diff

| Key | Action |
|-----|--------|
| `<leader>D` | Open Diffview |

### Git

| Key | Action |
|-----|--------|
| `<leader>gp` | Git pull |
| `<leader>gP` | Git push |
| `<leader>gg` | Open Lazygit |
| `<leader>gd` | Diff against last commit |
| `<leader>gD` | Diff against index |
| `<leader>gy` | Copy git permalink |
| `<leader>ghs` | Stage hunk |
| `<leader>ghr` | Reset hunk |
| `<leader>ghS` | Stage buffer |
| `<leader>ghR` | Reset buffer |
| `<leader>ghu` | Undo stage hunk |
| `<leader>ghp` | Preview hunk |
| `<leader>ghb` | Show line blame |
| `<leader>gtb` | Toggle line blame |
| `<leader>gtd` | Toggle show deleted |

### GitHub

| Key | Action |
|-----|--------|
| `<leader>Gpl` | List PRs |
| `<leader>Gps` | Show PR |
| `<leader>Gpc` | PR changes |
| `<leader>Gil` | List issues |
| `<leader>Grs` | Start review |
| `<leader>Grr` | Resume review |
| `<leader>Gd` | Open GitHub dashboard (gh-dash) |
| `<leader>Ga` | Open GitHub Actions (Pipeline) |
| `<leader>opl` | List PRs |
| `<leader>ops` | Show PR |
| `<leader>opc` | PR changes |
| `<leader>opd` | PR diff |
| `<leader>opr` | Reload PR |
| `<leader>opa` | PR checks |
| `<leader>opu` | Copy PR URL |
| `<leader>ors` | Start review |
| `<leader>orx` | Close review |
| `<leader>orr` | Resume review |
| `<leader>orS` | Submit review |
| `<leader>oil` | List issues |
| `<leader>ois` | Show issue |
| `<leader>oic` | Create issue |
| `<leader>oix` | Close issue |
| `<leader>oie` | Edit issue |

### Tab management

Requires `WINDOW_TABS_ENABLED = true` in preferences.

| Key | Action |
|-----|--------|
| `th` | Previous tab |
| `tl` | Next tab |
| `t<` | Move tab left |
| `t>` | Move tab right |
| `t1` – `t9` | Go to tab 1–9 |
| `t0` | Go to last tab |
| `tp` | Pin tab |
| `tx` | Close tab |

### Completion

These keys are active inside the completion menu (insert mode).

| Key | Action |
|-----|--------|
| `<C-n>` | Select next item |
| `<C-p>` | Select previous item |
| `<C-d>` | Scroll docs up |
| `<C-f>` | Scroll docs down |
| `<C-Space>` | Trigger completion |
| `<CR>` | Confirm selection |
| `<Tab>` | Next item / expand snippet |
| `<S-Tab>` | Previous item / jump snippet back |

### Treesitter

#### Incremental selection

| Key | Action |
|-----|--------|
| `<C-Space>` | Start / increment selection to node |
| `<C-s>` | Increment selection to scope |
| `<M-Space>` | Decrement selection |

#### Text objects

| Key | Selects |
|-----|---------|
| `aa` | Around parameter |
| `ia` | Inner parameter |
| `af` | Around function |
| `if` | Inner function |
| `ac` | Around class |
| `ic` | Inner class |

#### Motions

| Key | Action |
|-----|--------|
| `]m` | Next function start |
| `]]` | Next class start |
| `]M` | Next function end |
| `][` | Next class end |
| `[m` | Previous function start |
| `[[` | Previous class start |
| `[M` | Previous function end |
| `[]` | Previous class end |

