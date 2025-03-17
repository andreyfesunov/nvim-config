return {
    "nvim-flutter/flutter-tools.nvim",
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = function()
        require("flutter-tools").setup({
            fvm = true,
            -- lsp = {
            --     cmd = { "dart", "language-server", "--protocol=lsp" },
            -- },
        })
    end,
}
