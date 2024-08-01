local nmap = function(key, cmd, opts)
  vim.keymap.set('n', key, cmd, opts)
  require('which-key').register {
    [key] = { name = opts.desc or cmd, _ = 'which_key_ignore' },
  }
end

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
nmap('k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
nmap('j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
nmap('[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
nmap(']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
nmap('<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
nmap('<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Better pagination
nmap('<C-d>', '<C-d>zz', { noremap = true, silent = true })
nmap('<C-u>', '<C-u>zz', { noremap = true, silent = true })

-- LazyGit on Floating terminal
nmap('<leader>gg', ':FloatermNew lazygit<cr>', { desc = 'Open lazygit' })

-- Telescope keymaps
nmap('<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
nmap('<leader>s/', function()
  require('telescope.builtin').live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end, { desc = '[S]earch [/] in Open Files' })
nmap('<leader>ss', require('telescope.builtin').builtin, { desc = '[S]earch [S]elect Telescope' })
nmap('<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
nmap('<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
nmap('<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
nmap('<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
nmap('<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
nmap('<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
nmap('<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
nmap('<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
nmap('<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
nmap('<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

-- Formatting
nmap('<leader>f', function()
  require('conform').format {
    lsp_fallback = false,
    async = false,
    timeout_ms = 5000,
  }
end, { desc = 'Format current buffer' })
