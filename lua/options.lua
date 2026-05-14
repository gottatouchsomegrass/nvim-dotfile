require "nvchad.options"

local opt = vim.opt

-- UI
opt.laststatus = 3
opt.showmode = false
opt.cursorline = true
opt.signcolumn = "yes"
opt.wrap = false
opt.termguicolors = true

-- Numbers
opt.number = true
opt.relativenumber = true
opt.numberwidth = 4

-- Scrolling
opt.scrolloff = 8
opt.sidescrolloff = 5

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Tabs
opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Visual
opt.fillchars = { eob = " " }

-- Clipboard
opt.clipboard = "unnamedplus"

-- Undo
opt.undofile = true
