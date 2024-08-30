-- Disable auto format for specific languages
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "typescript", "javascript", "json", "css", "html", "scss" },
    callback = function()
        vim.b.autoformat = false
    end,
})

local group = vim.api.nvim_create_augroup("__env", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = ".env*",
    group = group,
    callback = function(args)
        vim.diagnostic.disable(args.buf)
    end,
})

-- Define default comment to dotenv file type
vim.api.nvim_create_autocmd("FileType", {
    pattern = "dotenv",
    callback = function()
        vim.bo.commentstring = "#%s"
    end,
})

-- Create an autocommand group to manage Makefile settings
vim.api.nvim_create_augroup('MakefileSettings', { clear = true })

-- Define an autocommand for Makefiles to set noexpandtab
vim.api.nvim_create_autocmd('BufEnter', {
    group = 'MakefileSettings',
    pattern = { 'make', 'makefile', 'Makefile' },
    callback = function()
        print("Makefile detected")
        vim.cmd('setlocal noexpandtab')
    end
})
