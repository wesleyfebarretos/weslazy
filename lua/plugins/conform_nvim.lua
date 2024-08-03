return {
    "stevearc/conform.nvim",
    require("conform").setup({
        format_on_save = function(bufnr)
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                return
            end
            return { timeout_ms = 3000, lsp_fallback = true }
        end,
        formatters_by_ft = {
            go = { "goimports", "gofumpt", "goimports-reviser" },
        },
    }),
}
