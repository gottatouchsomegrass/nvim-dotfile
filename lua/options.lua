-- custom/options.lua

local opt = vim.opt

-- =========================
-- Core UI
-- =========================
opt.laststatus = 3        -- global statusline
opt.showmode = false      -- hide -- INSERT --
opt.cursorline = true     -- highlight current line
opt.signcolumn = "yes"    -- always show sign column
opt.wrap = false          -- no line wrap

-- =========================
-- Line Numbers
-- =========================
opt.number = true
opt.numberwidth = 2

-- =========================
-- Scrolling
-- =========================
opt.sidescroll = 1
opt.sidescrolloff = 5

-- =========================
-- Splits (IMPORTANT FIX)
-- =========================
opt.splitright = true     -- vertical splits go right
opt.splitbelow = true     -- horizontal splits go below

-- =========================
-- Tabs & Indentation
-- =========================
opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4

-- =========================
-- Visual Tweaks
-- =========================
opt.fillchars = { eob = " " }  -- remove ~ on empty lines
opt.termguicolors = true

-- =========================
-- Clipboard
-- =========================
opt.clipboard = "unnamedplus"

-- =========================
-- Undo
-- =========================
opt.undofile = true
