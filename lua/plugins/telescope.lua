return {
    "nvim-telescope/telescope.nvim",
    opts = {
        defaults = {
            -- https://www.reddit.com/r/neovim/comments/r22xrq/comment/hm2dv20/
            layout_strategy = "vertical",
            layout_config = {
                height = 0.95,
                -- preview_width = 0.65,
                -- https://www.reddit.com/r/neovim/comments/yrqm9f/comment/ivv8hoa/
                -- width = function(_, cols, _)
                --   if cols > 200 then
                --     return 170
                --   else
                --     return math.floor(cols * 0.87)
                --   end
                -- end,
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
                    },
                })
            end,
            desc = "Find Files",
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
