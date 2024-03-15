local nnoremap = require("Weslyn.keymaps_utils").nnoremap

local M = {}

-- Map Oil to <leader>e
nnoremap("<leader>e", function()
    require("oil").toggle_float()
end, { desc = "Open Oil Map" })

-- Map MaximizerToggle (szw/vim-maximizer) to leader-m
nnoremap("<leader>m", ":MaximizerToggle<cr>", { desc = "Toggle Window Size" })

-- nnoremap("<leader>tb", ":!barrelsby", { desc = "TS Barrel"})
-- nnoremap("<leader>tb", function()
--     vim.cmd("!cd %:p:h && barrelsby")
--     vim.cmd("echo 'Barrels generated in ' . expand('%:p:h')")
-- end, { desc = "Generate TS Barrel"})
-- nnoremap("<leader>tb", function()
--     -- Get the directory of the current file
--     local dir = vim.fn.expand('%:p:h')
--     -- Run barrelsby in that directory
--     vim.cmd('!cd ' .. dir .. ' && barrelsby --location branch --noHeader --delete')
--     print('Barrels generated in ' .. dir)
-- end, { desc = "Generate TS Barrel in the directory of the current file" })

nnoremap("<leader>tb", function()
    -- Get the directory of the current file
    local dir = vim.fn.expand('%:p:h')
    -- Run barrelsby in that directory
    vim.cmd('!cd ' .. dir .. ' && barrelsby --location below --noHeader --delete')
    print('Barrels generated in ' .. dir)

    -- Read the generated barrel file
    local barrel_path = dir .. '/index.ts'
    local barrel_file = io.open(barrel_path, 'r')
    if not barrel_file then
        print('Error: Failed to open generated barrel file')
        return
    end
    local barrel_content = barrel_file:read('*all')
    barrel_file:close()

    -- Perform the replacement
    local replaced_content = barrel_content:gsub('/index', '')  -- Replace '/index' with ''
    
    -- Write back to the barrel file
    local updated_barrel_file = io.open(barrel_path, 'w')
    if not updated_barrel_file then
        print('Error: Failed to update generated barrel file')
        return
    end
    updated_barrel_file:write(replaced_content)
    updated_barrel_file:close()

    print('"/index" replaced with "" in ' .. barrel_path)
end, { desc = "Generate TS Barrel in the directory of the current file" })
return M
