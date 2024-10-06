local opt = vim.opt -- for conciseness

-- Enable relative line numbers
opt.number = true
opt.relativenumber = true

opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
opt.showmode = false

-- Sync clipboard between OS and Neovim
--opt.clipboard = 'unnamedplus'

-- Enable break indent
opt.breakindent = true

-- Save undo history
opt.undofile = true

-- Search settings
opt.ignorecase = true -- case-insensitve searching
opt.smartcase = true -- assume case-sensitive if mixed case in search

-- Always enable sign column
opt.signcolumn = "yes"

-- Decrease update time
opt.updatetime = 50

-- Display certain whitespace characters
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live while typing
opt.inccommand = "split"

-- Show which line the cursor is on
opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor
opt.scrolloff = 10

-- Indentation options
opt.tabstop = 4 -- 4 spaces for tabs
opt.softtabstop = 4
opt.shiftwidth = 4 -- 4 spaces for indent width
opt.expandtab = true -- expand tabs to spaces
--opt.autoindent = true  -- copy indent from current line when starting new one
opt.smartindent = true -- smart autoindent
opt.colorcolumn = "100" -- highlight column at 100 chars

-- Set highlight on search, but clear when pressing <Esc> in normal mode
opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- Do not continue comments to the next line with 'o'
opt.formatoptions:remove("o")
