local nnoremap = require("Weslyn.keymaps_utils").nnoremap
local vnoremap = require("Weslyn.keymaps_utils").vnoremap
local inoremap = require("Weslyn.keymaps_utils").inoremap
local vscode = require("vscode")

local M = {}

vim.keymap.set({ "i", "n", "v", "x", "s", "o", "c", "t" }, "<C-[>", "<Esc>", { noremap = true, silent = true })

vnoremap("p", '"_dP', { desc = "paste without override current registrie" })
nnoremap("n", "nzz", { desc = "jump to next and center screen" })
nnoremap("N", "Nzz", { desc = "jump to next and center screen" })

nnoremap("<leader>,", function()
    vscode.call("workbench.action.showEditorsInGroup")
end, { desc = "search in open buffers" })

nnoremap("<leader>[e", function()
    vscode.call("editor.action.marker.prev")
end, { desc = "go to previous  diagnostic" })

nnoremap("<leader>]e", function()
    vscode.call("editor.action.marker.next")
end, { desc = "go to next diagnostic" })

nnoremap("<leader>co", function()
    vscode.call("editor.action.organizeImports")
end, { desc = "organize imports" })

nnoremap("<leader>ss", function()
    vscode.call("workbench.action.gotoSymbol")
end, { desc = "find symbol" })

nnoremap("<leader>cf", function()
    vscode.call("editor.action.formatDocument")
end, { desc = "find symbol" })

nnoremap("<leader>bo", function()
    vscode.call("workbench.action.closeOtherEditors")
end, { desc = "close other buffers" })

nnoremap("<leader>e", function()
    vscode.call("workbench.action.toggleSidebarVisibility")
end, { desc = "toggle side bar visibility" })

nnoremap("<C-h>", function()
    vscode.call("workbench.action.focusLeftGroup")
end, { desc = "go to left screen" })

nnoremap("<C-l>", function()
    vscode.call("workbench.action.focusRightGroup")
end, { desc = "go to right screen" })

nnoremap("<C-h>", function()
    vscode.call("workbench.action.focusAboveGroup")
end, { desc = "go to above screen" })

nnoremap("<C-h>", function()
    vscode.call("workbench.action.focusBelowGroup")
end, { desc = "go to below screen" })

nnoremap("gr", function()
    vscode.call("editor.action.goToReferences")
end, { desc = "go to references" })

nnoremap("gd", function()
    vscode.call("editor.action.goToDeclaration")
end, { desc = "go to declaration" })

vnoremap("<leader>d", '"_d', { desc = "delete without override" })
nnoremap("<leader>d", '"_dd', { desc = "delete without override" })
nnoremap("<CR>", "o<Esc>", { desc = "Enter blank line down" })
nnoremap("<A-CR>", "O<Esc>", { desc = "Enter blank line above" })
nnoremap("<C-u>", "10k", { desc = "Scroll up" })
nnoremap("<C-d>", "10j", { desc = "Scroll down" })
nnoremap("<C-n>", function()
    vscode.call("editor.action.addSelectionToNextFindMatch")
end, { desc = "add cursor to next find match" })
vnoremap("<C-n>", function()
    vscode.call("editor.action.addSelectionToNextFindMatch")
end, { desc = "add cursor to next find match" })

inoremap("<C-k>", function()
    vscode.call("selectPrevSuggestion")
end, { desc = "Prev Suggestion" })
inoremap("<C-j>", function()
    vscode.call("selectNextSuggestion")
end, { desc = "Next Suggestion" })

return M
