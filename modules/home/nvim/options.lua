vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.clipboard = 'unnamedplus'
vim.o.cursorline = true;
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = 'number'
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.updatetime = 300
vim.o.termguicolors = true
vim.o.mouse = 'a'
vim.keymap.set('n', '<leader>r', ':RunCode<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rf', ':RunFile<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rft', ':RunFile tab<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rp', ':RunProject<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rc', ':RunClose<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>crf', ':CRFiletype<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>crp', ':CRProjects<CR>', { noremap = true, silent = false })
vim.keymap.set("n", "<leader>pv", vim.cmd.Oil)
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find Files"})
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find Buffers"})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Find Help Tags"})
vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, { desc = "Find Symbols"})
vim.keymap.set('n', '<leader>fi', '<cmd>AdvancedGitSearch<CR>', { desc = "AdvancedGitSearch"})
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = "Find Old Files"})
vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = "Find Word under Cursor"})
vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = "Search Git Commits"})
vim.keymap.set('n', '<leader>gb', builtin.git_bcommits, { desc = "Search Git Commits for Buffer"})
vim.keymap.set('n', '<leader>gb', builtin.diagnostics, {desc = "Search for errors and warnings"})
--vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true, silent = false })
--vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true, silent = false })
--vim.keymap.set('n', 'n', 'nzzzv', { noremap = true, silent = false })
--vim.keymap.set('n', 'N', 'Nzzzv', { noremap = true, silent = false })
