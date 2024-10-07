return {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = false,
    ft = "markdown",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require('obsidian').setup({
            workspaces = {
                {
                    name = "Common",
                    path = "~/Obsidian/afesunov",
                },
            },
            daily_notes = {
                folder = "daily_notes"
            },
            completion = {
                nvim_cmp = true,
                min_chars = 0,
            },
            mappings = {
                ["gf"] = {
                    action = function()
                        return require('obsidian').util.gf_passthrough()
                    end,
                    opts = { noremap = false, expr = true, buffer = true },
                }
            }
        })

        local keymap = vim.keymap

        keymap.set("n", "<leader>of", "<cmd>ObsidianQuickSwitch<cr>", { desc = "Obsidian Find" })
        keymap.set("n", "<leader>oc", "<cmd>ObsidianToggleCheckbox<cr>", { desc = "Obsidian Toggle Checkbox" })
    end
}
