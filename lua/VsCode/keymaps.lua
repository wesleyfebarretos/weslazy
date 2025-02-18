local nnoremap = require("Weslyn.keymaps_utils").nnoremap
local vnoremap = require("Weslyn.keymaps_utils").vnoremap
local inoremap = require("Weslyn.keymaps_utils").inoremap
local vscode = require("vscode-neovim")

local M = {}

vim.keymap.set({ "i", "n", "v", "x", "s", "o", "c", "t" }, "<C-[>", "<Esc>", { noremap = true, silent = true })

nnoremap("p", "pgvy", { desc = "paste without override current registrie" })
nnoremap("P", "Pgvy", { desc = "paste without override current registrie" })

return M
