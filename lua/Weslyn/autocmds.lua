-- Disable auto format for specific languages
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "typescript", "javascript", "json", "css", "html", "scss" },
    callback = function()
        vim.b.autoformat = false
    end,
})

local group = vim.api.nvim_create_augroup("__env", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = ".env",
    group = group,
    callback = function(args)
        vim.diagnostic.disable(args.buf)
    end,
})
