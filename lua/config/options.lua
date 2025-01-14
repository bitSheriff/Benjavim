-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
local g = vim.g

-- line numbers
opt.relativenumber = true

opt.clipboard = "unnamedplus"

opt.mouse = "" -- disable mouse
-- Scrolling
-- opt.so = 999 -- keep cursor in the middle

-- Folding
opt.foldlevel = 99 -- no automatic folding

-- Indenting
opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.autoindent = true
opt.tabstop = 4
opt.softtabstop = 4

opt.conceallevel = 1

-- disable spelling per default
vim.cmd("set nospell")
