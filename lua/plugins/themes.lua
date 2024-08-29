return {
    {
        "rebelot/kanagawa.nvim",
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        opts = function()
            return {
                transparent = true
            }
        end,
        config = function()
            -- load the colorscheme here
            -- vim.cmd([[colorscheme kanagawa-dragon]])
        end,
    },
    {
        "tokyonight.nvim",
        opts = {
            transparent = true,
            styles = {
                sidebars = "transparent",
                floats = "transparent",
            },
        },
    },
    {
        "craftzdog/solarized-osaka.nvim",
        lazy = true,
        priority = 1000,
        opts = function()
            return {
                transparent = true,
            }
        end
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000
    }
}
