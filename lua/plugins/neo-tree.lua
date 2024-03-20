-- local function get_folder_node(state)
--     local tree = state.tree
--     local node = tree:get_node()
--     local last_id = node:get_id()
--
--     while node do
--         local insert_as_local = state.config.insert_as
--         local insert_as_global = require("neo-tree").config.window.insert_as
--         local use_parent
--         if insert_as_local then
--             use_parent = insert_as_local == "sibling"
--         else
--             use_parent = insert_as_global == "sibling"
--         end
--
--         local is_open_dir = node.type == "directory" and (node:is_expanded() or node.empty_expanded)
--         if use_parent and not is_open_dir then
--             return tree:get_node(node:get_parent_id())
--         end
--
--         if node.type == "directory" then
--             return node
--         end
--
--         local parent_id = node:get_parent_id()
--         if not parent_id or parent_id == last_id then
--             return node
--         else
--             last_id = parent_id
--             node = tree:get_node(parent_id)
--         end
--     end
-- end
--
-- return {
--     "nvim-neo-tree/neo-tree.nvim",
--     -- branch = "v3.x",
--     -- dependencies = {
--     --     "nvim-lua/plenary.nvim",
--     --     "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
--     --     "MunifTanjim/nui.nvim",
--     -- },
--     config = function()
--         require("neo-tree").setup({
--             filesystem = {
--                 window = {
--                     mappings = {
--                         ["çts"] = function(state)
--                             local node = get_folder_node(state)
--                             local dir = node:get_id()
--
--                             print(dir)
--                         end,
--                     },
--                 },
--             },
--         })
--     end,
-- }
return {}
