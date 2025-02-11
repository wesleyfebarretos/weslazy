local nnoremap = require("Weslyn.keymaps_utils").nnoremap

local M = {}

-- Map Oil to <leader>e
nnoremap("<leader>e", function()
    require("oil").toggle_float()
end, { desc = "Open Oil Map" })

-- Map MaximizerToggle (szw/vim-maximizer) to leader-m
nnoremap("<leader>m", ":MaximizerToggle<cr>")

-- Resize split windows to be equal size
nnoremap("<leader>=", "<C-w>=")

-- Center after scrolling
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

-- Remap record macro key to leader q & q to nothing
nnoremap("<leader>q", "q")
nnoremap("q", "<Nop>")

-- Center and highlight after n
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Keep yank text in visual paste mode
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- New Blank lines in normal mode with Enter keymap
nnoremap("<CR>", "o<Esc>")
nnoremap("<A-CR>", "O<Esc>")

-- Map enter insert mode and go to indentation level
-- nnoremap("a", "a<C-f>")
-- nnoremap("i", "i<C-f>")

return M
