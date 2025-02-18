-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.g.vscode then
    require("VsCode")
else
    require("Weslyn")
end
