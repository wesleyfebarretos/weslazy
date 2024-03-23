-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Set vim line numbers background
vim.api.nvim_set_hl(0, "LineNr", { fg = "white", bg = "none" })

-- This file is automatically loaded by plugins.core
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Enable LazyVim auto format
vim.g.autoformat = false

-- LazyVim root dir detection
-- Each entry can be:
-- * the name of a detector function like `lsp` or `cwd`
-- * a pattern or array of patterns like `.git` or `lua`.
-- * a function with signature `function(buf) -> string|string[]`
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }

local opt = vim.opt

opt.autowrite = true -- Enable auto write

if not vim.env.SSH_TTY then
  -- only set clipboard if not in ssh, to make sure the OSC 52
  -- integration works automatically. Requires Neovim >= 0.10.0
  opt.clipboard = "unnamedplus" -- Sync with system clipboard
end

-- Enable relative line numbers
opt.nu = true
opt.rnu = true

-- Config Spacing tabs
opt.shiftwidth = 4 -- Size of an indent
opt.tabstop = 4 -- Number of spaces tabs count for
opt.softtabstop = 4
opt.expandtab = true -- Use spaces instead of tabs

-- Enable smart indenting
opt.smartindent = true -- Insert indents automatically

-- Enable incremental searching
opt.hlsearch = true
opt.incsearch = true

 -- Enable highlighting of the current line
opt.cursorline = true

-- Confirm to save changes before exiting modified buffer
opt.confirm = true

-- Disable some invisible characters (tabs...
opt.list = false 

-- Don't ignore case with capitals
opt.smartcase = true

-- True color support
opt.termguicolors = true

-- Enable the sign column to prevent the screen from jumping
opt.signcolumn = "yes"

-- Number of lines that you see when scroll down/up
opt.scrolloff = 8

-- Set completeopt to have a better completion experience
opt.completeopt = { "menuone", "noselect" }

-- Enable persistent undo history
opt.undofile = true

-- Enable access to system clipboard
--opt.clipboard = "unnamed, unnamedplus"

-- Place a column line
opt.colorcolumn = "80"

--Enable fold & unfold lines
opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
opt.foldmethod = 'expr'

opt.foldcolumn = '1'
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true

opt.number = true
opt.relativenumber = true
opt.swapfile = false
opt.wrap = false
opt.updatetime = 50


