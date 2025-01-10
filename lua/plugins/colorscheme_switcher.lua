--[[
    :Themify
--]]

return {
    "lmantw/themify.nvim",
    lazy = false,
    priority = 999,
    config = function()
        require("themify").setup({
            -- Your list of colorschemes.
            "folke/tokyonight.nvim",
            "savq/melange-nvim",
            "olivercederborg/poimandres.nvim",
            -- Built-in colorschemes are also supported.
            -- (Also works with any colorschemes that are installed via other plugin manager, just make sure the colorscheme is loaded before Themify is loaded.)
            "default",
        })
    end,
}
