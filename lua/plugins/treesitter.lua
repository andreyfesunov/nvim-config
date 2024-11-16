return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "typescript",
                "html",
                "css",
                "scss",
                "lua",
                "go",
                "tsx",
                "javascript",
                "c",
                "cpp",
                "cmake",
                "angular",
            },

            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
            },
        })
    end,
}
