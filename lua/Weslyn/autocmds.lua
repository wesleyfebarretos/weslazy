-- Disable auto format for specific languages
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "typescript", "javascript" },
    callback = function()
        vim.b.autoformat = false
    end,
})
