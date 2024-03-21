local nnoremap = require("Weslyn.keymaps_utils").nnoremap
local harpoon_mark = require("harpoon.mark")

local M = {}

-- Map Oil to <leader>e
nnoremap("<leader>e", function()
    require("oil").toggle_float()
end, { desc = "Open Oil Map" })

-- Map MaximizerToggle (szw/vim-maximizer) to leader-m
nnoremap("<leader>m", ":MaximizerToggle<cr>")

-- Resize split windows to be equal size
nnoremap("<leader>=", "<C-w>=")

return M
