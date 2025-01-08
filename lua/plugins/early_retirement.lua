--[[
    Optimize LSP work (remove buffers after 20 minutes)
--]]

return {
    "chrisgrieser/nvim-early-retirement",
    config = true,
    event = "VeryLazy",
}
