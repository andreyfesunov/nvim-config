return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            extensions = {
                {
                    sections = {
                        lualine_a = {
                            function()
                                local buf_name = vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())
                                local adapter_url, path = require("oil.util").parse_url(buf_name)
                                assert(adapter_url ~= nil and path ~= nil, "invalid oil url")

                                local adapter_name = require("oil.config").adapters[adapter_url]

                                return ("%s: %s"):format(adapter_name:upper(), vim.fn.fnamemodify(path, ":~"))
                            end,
                        },
                        lualine_b = {
                            "branch",

                            ---default
                            "oil_git_signs_diff",

                            ---include working tree info only
                            -- { "oil_git_signs_diff", diff = { index = {} } },

                            ---include index info only
                            -- { "oil_git_signs_diff", diff = { working_tree = {} }},

                            ---include only added & modified
                            -- {
                            --     "oil_git_signs_diff",
                            --     diff = {
                            --         index = { "added", "modified" },
                            --         working_tree = { "added", "modified" },
                            --     },
                            -- },
                        },
                        lualine_x = {},
                        lualine_y = { "progress" },
                        lualine_z = { "location" },
                    },
                    filetypes = { "oil" },
                },

            },
        })
    end,
}
