--[[
    Plugin that adds as virtual text:

    ⊛ - go-to-definition is available
    ↱ - reference list available / number of references
--]]

return {
    "roobert/action-hints.nvim",
    config = function()
        require("action-hints").setup({
            template = {
                definition = { text = " ⊛", color = "#add8e6" },
                references = { text = " ↱%s", color = "#ff6666" },
            },
            use_virtual_text = true,
        })
    end,
}
