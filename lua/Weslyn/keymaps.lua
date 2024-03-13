local nnoremap = require("Weslyn.keymaps_utils").nnoremap

local M = {}

-- Map Oil to <leader>e
nnoremap("<leader>e", function()
  require("oil").toggle_float()
end,  { desc = "Open Oil Map" })

return M
