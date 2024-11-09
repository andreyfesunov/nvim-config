return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("oil").setup({
            lsp_file_methods = {
                timeout_ms = 15000,
            },
            keymaps = {
                ["<C-c>"] = "actions.close",
                ["<C-p>"] = "actions.preview",
                ["<CR>"] = "actions.select",
                ["_"] = "actions.open_cwd",
                ["-"] = "actions.parent",
                ["gs"] = "actions.change_sort",
                ["g?"] = "actions.show_help",
                ["C-r"] = "actions.refresh",
            },
            use_default_keymaps = false,
            view_options = {
                show_hidden = true
            }
        })

        vim.keymap.set("n", "<leader>e", "<cmd>Oil<cr>", { desc = "Open File explorer" })
    end,
}
