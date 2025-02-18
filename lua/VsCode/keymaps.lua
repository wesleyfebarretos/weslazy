local nnoremap = require("Weslyn.keymaps_utils").nnoremap
local vnoremap = require("Weslyn.keymaps_utils").vnoremap
local inoremap = require("Weslyn.keymaps_utils").inoremap
local vscode = require("vscode-neovim")

local M = {}

vim.keymap.set({ "i", "n", "v", "x", "s", "o", "c", "t" }, "<C-[>", "<Esc>", { noremap = true, silent = true })

nnoremap("p", '"0p', { desc = "paste without override current registrie" })
nnoremap("P", '"0P', { desc = "paste without override current registrie" })
vnoremap("p", '"0p', { desc = "paste without override current registrie" })
vnoremap("P", '"0P', { desc = "paste without override current registrie" })
nnoremap("n", "nzz", { desc = "jump to next and center screen" })
nnoremap("N", "Nzz", { desc = "jump to next and center screen" })

return M
