--[[
     Fork of Simple LSP setup with auto-configuration for LSPs && extra options
 --]]

return {
    "andreyfesunov/lsp-setup.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        require("lsp-setup").setup({
            default_mappings = false,
            servers = {
                vtsls = {},
                angularls = {},
                phpactor = {},
                lua_ls = {},
                html = {},
                cssls = {},
                rust_analyzer = false,
            },
            mappings = {
                ["<leader>lR"] = {
                    fn = vim.lsp.buf.rename,
                    opts = { desc = "Rename" },
                },
                ["<leader>lr"] = {
                    fn = vim.lsp.buf.references,
                    opts = { desc = "References" },
                },
                ["<leader>lh"] = {
                    fn = vim.lsp.buf.hover,
                    opts = { desc = "Hover" },
                },
                ["<leader>ld"] = {
                    fn = vim.lsp.buf.definition,
                    opts = { desc = "Definition" },
                },
                ["<leader>li"] = {
                    fn = vim.lsp.buf.implementation,
                    opts = { desc = "Implementation" },
                },
                ["<leader>la"] = {
                    fn = vim.lsp.buf.code_action,
                    opts = { desc = "Code Action" },
                },
                ["<leader>lf"] = {
                    fn = vim.lsp.buf.format,
                    opts = { desc = "Formatting" },
                },
            },
            inlay_hints = {
                enabled = true,
            },
        })
    end,
}
