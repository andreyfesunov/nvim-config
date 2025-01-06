--[[
    Main Plugin for Snippet Engine - COQ
--]]

return {
    "ms-jpq/coq_nvim",
    branch = "coq",
    init = function()
        vim.g.coq_settings = {
            auto_start = true,
            keymap = {
                jump_to_mark = "null"
            }
        }
    end,
}
