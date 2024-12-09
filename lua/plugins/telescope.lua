return {
    "nvim-telescope/telescope.nvim",
    opts = {
        defaults = {
            layout_strategy = "vertical",
            sorting_strategy = "ascending",
            layout_config = {
                width = 100000,
                height = 100000,
                prompt_position = "top",
                -- width = function(, cols, _)
                --     if cols > 200 then
                --         return 170
                --     else
                --         return math.floor(cols * 0.87)
                --     end
                -- end,
            },
        },
        extensions = {
            fzf = {
                fuzzy = true, -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true, -- override the file sorter
                case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                -- the default case_mode is "smart_case"
            },
        },
    },
    dependencies = {
        {
            "agoodshort/telescope-git-submodules.nvim",
            dependencies = "akinsho/toggleterm.nvim",
        },
    },
    keys = {
        -- disable the keymap to grep files
        { "<leader>/", false },
        -- disable telescope find files default key
        { "<leader><space>", false },
        -- change a keymap
        --{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
        {
            "<c-p>",
            function()
                require("telescope.builtin").find_files({
                    hidden = true,
                    no_ignore = true,
                    file_ignore_patterns = {
                        "node_modules/.*",
                        "yarn.lock",
                        "package-lock.json",
                        "lazy-lock.json",
                        "init.sql",
                        "target/.*",
                        ".git/.*",
                        "dist",
                        "tmp",
                    },
                })
            end,
            desc = "Find Files",
        },
        {
            "<c-f>",
            function()
                require("telescope.builtin").live_grep({
                    root = false,
                    hidden = true,
                    no_ignore = true,
                    file_ignore_patterns = {
                        "node_modules/.*",
                        "yarn.lock",
                        "package-lock.json",
                        "lazy-lock.json",
                        "init.sql",
                        "target/.*",
                        ".git/.*",
                        "dist",
                        "tmp",
                    },
                })
            end,
            desc = "Grep (cwd)",
        },
        -- add a keymap to browse plugin files
        {
            "<leader>fp",
            function()
                require("telescope.builtin").find_files({
                    cwd = require("lazy.core.config").options.root,
                    hidden = true,
                })
            end,
            desc = "Find Plugin File",
        },
    },
}
