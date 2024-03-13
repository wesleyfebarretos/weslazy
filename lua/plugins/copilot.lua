return {
    {
        "zbirenbaum/copilot-cmp",
        enabled = false,
        event = { "BufEnter" },
        dependencies = { "zbirenbaum/copilot.lua" },
        config = function()
            require("copilot_cmp").setup()
        end,
    },
}
