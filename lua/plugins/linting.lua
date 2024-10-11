return {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		local lint = require("lint")
		local common_setup = { "eslint_d" }

		lint.linters_by_ft = {
			javascript = common_setup,
			typescript = common_setup,
			javascriptreact = common_setup,
			typescriptreact = common_setup,
			svelte = common_setup,
			python = { "pylint" },
			php = { "phpstan" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
