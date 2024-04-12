-- Disable auto format for specific languages
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "typescript", "javascript", "json", "css", "html" },
    callback = function()
        vim.b.autoformat = false
    end,
})
