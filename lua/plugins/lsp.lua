return {
    {
        "mason-org/mason.nvim",
        version = "^1.0.0",
        opts = function(_, opts)
            vim.list_extend(opts.ensure_installed, {
                "luacheck",
                "shellcheck",
                "shfmt",
                "tailwindcss-language-server",
                "vtsls",
                "css-lsp",
                "goimports",
                "goimports",
                "gopls",
            })
        end,
    },
    { "mason-org/mason-lspconfig.nvim", version = "^1.0.0" },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "mason-org/mason.nvim",
            "mason-org/mason-lspconfig.nvim",
        },
        opts = {
            inlay_hints = { enabled = false },
            servers = {
                tailwindcss = {
                    root_dir = function(...)
                        return require("lspconfig").util.root_pattern(".git")(...)
                    end,
                },
            },
        },
    },
}
