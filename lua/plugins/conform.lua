return {
    "stevearc/conform.nvim",
    opts = {},
    config = function()
        local conform = require("conform")
        local common_setup = { "prettier", stop_after_first = true }

        conform.setup({
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "isort", "black" },
                csharp = { "csharpier" },
                html = common_setup,
                css = common_setup,
                scss = common_setup,
                json = common_setup,
                yaml = common_setup,
                graphql = common_setup,
                svelte = common_setup,
                javascript = common_setup,
                typescript = common_setup,
            },
            format_on_save = {
                timeout_ms = 2500,
                async = false,
                lsp_format = "fallback",
            },
        })
    end,
}
