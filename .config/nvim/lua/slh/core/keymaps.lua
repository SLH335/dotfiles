vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local set = vim.keymap.set -- for conciseness

-- Easier window navigation
set('n', '<c-j>', '<c-w><c-j>')
set('n', '<c-k>', '<c-w><c-k>')
set('n', '<c-l>', '<c-w><c-l>')
set('n', '<c-h>', '<c-w><c-h>')

-- Window management
set('n', '<leader>wv', '<C-w>v', { desc = 'Split [W]indow [V]ertically' })
set('n', '<leader>wh', '<C-w>s', { desc = 'Split [W]indow [H]orizontally' })
set('n', '<leader>we', '<C-w>=', { desc = 'Make splits [E]qual size' })
set('n', '<leader>wq', '<C-w>q', { desc = '[Q]uit current split' })

-- Set highlight on search, but clear when pressing <Esc> in normal mode
vim.opt.hlsearch = true
set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Yank to system clipboard
set({ 'n', 'v' }, '<leader>y', '"+y', { desc = 'Yank to system clipboard' })
set({ 'n', 'v' }, '<leader>Y', '"+Y', { desc = 'Yank line(s) to system clipboard' })

-- Center view after some moves
set('n', '<C-d>', '<C-d>zz')
set('n', '<C-u>', '<C-u>zz')
set('n', 'n', 'nzzzv')
set('n', 'N', 'Nzzzv')

-- Append current line to previous line
set('n', 'J', 'mzJ`z')

-- Move selected lines
set('v', 'J', ":m '>+1<CR>gv=gv")
set('v', 'K', ":m '<-2<CR>gv=gv")

-- Keep yanked content when overwriting with <leader>p
set('x', '<leader>p', '"_dP')
-- Keep yanked content when deleting with <leader>d
set({ 'n', 'v' }, '<leader>d', '"_d')
set('v', '<leader>d', '"_d')

-- Goto diagnostics
set('n', ']d', vim.diagnostic.goto_next)
set('n', '[d', vim.diagnostic.goto_prev)
set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
