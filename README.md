# nvim 

My personal Neovim configuration files.

![screenshot](./.github/assets/screenshot.png)

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

