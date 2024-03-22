local function get_folder_node(state)
    local tree = state.tree
    local node = tree:get_node()
    local last_id = node:get_id()

    while node do
        local insert_as_local = state.config.insert_as
        local insert_as_global = require("neo-tree").config.window.insert_as
        local use_parent
        if insert_as_local then
            use_parent = insert_as_local == "sibling"
        else
            use_parent = insert_as_global == "sibling"
        end

        local is_open_dir = node.type == "directory" and (node:is_expanded() or node.empty_expanded)
        if use_parent and not is_open_dir then
            return tree:get_node(node:get_parent_id())
        end

        if node.type == "directory" then
            return node
        end

        local parent_id = node:get_parent_id()
        if not parent_id or parent_id == last_id then
            return node
        else
            last_id = parent_id
            node = tree:get_node(parent_id)
        end
    end
end

local function typescriptBarrel(state)
    -- Get Node Path from directory coming from NeoTree
    local node = get_folder_node(state)
    local dir = node:get_id()

    local dirPath = dir
    -- Lista diretórios e arquivos .ts, excluindo o próprio index.ts
    local commandDirs = 'find "' .. dirPath .. '" -mindepth 1 -maxdepth 1 -type d'
    local commandFiles = 'find "' .. dirPath .. '" -mindepth 1 -maxdepth 1 -type f -name "*.ts" ! -name "index.ts"'
    local exports = {}
    
    -- Processa diretórios
    local pDirs = io.popen(commandDirs)

    for subdir in pDirs:lines() do
        local subdirName = subdir:match("^.+/(.+)$") -- Extrai o nome do subdiretório
        local indexPath = subdir .. "/index.ts"
        local f = io.open(indexPath, "r")
        if f then
            io.close(f)
            table.insert(exports, "export * from './" .. subdirName .. "';")
        end
    end
    pDirs:close()

    -- Processa arquivos
    local pFiles = io.popen(commandFiles)
    for file in pFiles:lines() do
        local fileName = file:match("^.+/(.+)$") -- Extrai apenas o nome do arquivo
        table.insert(exports, "export * from './" .. fileName:gsub("%.ts$", "") .. "';")
    end
    pFiles:close()

    if next(exports) ~= nil then
        -- Escreve os exports no index.ts do diretório atual
        local outputPath = dirPath .. "/index.ts"
        local content = table.concat(exports, "\n")
        local outputFile, err = io.open(outputPath, "w")

        if not outputFile then
            print("Erro ao abrir arquivo para escrita: ", err)
            return
        end

        outputFile:write(content)
        outputFile:close()
        -- print("index.ts foi criado com sucesso em: ", dirPath)
    end
end

return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
    keys = {
        {
            "<leader>fw",
            function()
                require("neo-tree.command").execute({ toggle = true, dir = vim.fn.getcwd() })
            end,
            desc = "Working Dir" 
        },
    },
    opts = {
        window = {
            mappings = {
                ["çts"] =  typescriptBarrel
            },
        },
    },
}
