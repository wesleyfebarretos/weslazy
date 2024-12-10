return {
    {
        "williamboman/mason.nvim",
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
    {
        "neovim/nvim-lspconfig",
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
