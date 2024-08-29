# nvim 

My personal nvim configuration files.

## Quickstart

### Prerequisites

### Installation

## Configuration 

The main editor preferences can be found in `lua/preferences`:
- `lua/preferences/general.lua`: General editor preferences
- `lua/preferences/keymaps.lua`: Key assignments

## What's included? 
 
### Default keymaps 

#### Code navigation 

| Key | Action |
|-----|--------|
| `gd` | Goto definition      |
| `gr` | Goto references      |
| `gi` | Goto implementation  |
| `gD` | Goto type definition |

#### Code documentation 

| Key | Action |
|-----|--------|
| `Ds` | Document signature   |
| `Dy` | Document symbols     |
| `gD` | Document hover       |


#### Code actions shortcuts 

| Key | Action |
|-----|--------|
| `<space>ca` | Show available code actions  |
| `<space>cr` | Rename code                  |
| `<space>cs` | Swap code                    |

#### Debug 

| Key | Action |
|-----|--------|
| `<space>dt` | Toggle Debug UI              |
| `<space>do` | Open diagnostic              |
| `<space>dl` | Diagnostic list              |
| `<space>d[` | Next diagnostic message      |
| `<space>d]` | Previous diagnostic message  |
| `<space>dc` | Start/Continue Debug         |
| `<space>db` | Toggle bearkpoint            |
| `<space>dsi` | Step into                   |
| `<space>dso` | Step over                   |
| `<space>dsO` | Step out                    |

#### Editor window

| Key | Action |
|-----|--------|
| `<space>e` | Toggle file explorer column |

#### Git 

| Key | Action |
|-----|--------|
| `<space>gp` | Git pull |
| `<space>gP` | Git push |
| `<space>gg` | Open lazygit |
| `<space>gd` | Show diff since index |
| `<space>gD` | Show diff since last commit |
| `<space>ghs` | Stage hunk |
| `<space>ghr` | Reset hunk |
| `<space>ghS` | Stage buffer |
| `<space>ghR` | Reset buffer |
| `<space>ghu` | Undo stage |
| `<space>ghp` | Preview hunk |
| `<space>ghb` | Show line blame |
| `<space>gtb` | Toggle blame |
| `<space>gtd` | Toggle show deleted |

## What's included?
Configurations are divided in categories, and each of these categories includes one or more plugins
- Code Assistance
    - `copilot`
        - The GitHub AI code assistance plugin
    - `autopairs`
        - Close brackets and quotes automatically
- Debugging
    - `delve`
- Filesystem search
    - `fzf`
    - `telescope`
- Git
    - `diffview`
        - Neat diffs
    - `gitsigns`
        - Versioning icons on the editor side
    - `vim-fugitive`
    - `octo`
        - Github reviews made nice
- Language servers
- Theme
- Window
