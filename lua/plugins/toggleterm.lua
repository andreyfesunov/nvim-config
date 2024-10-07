return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup()

		vim.keymap.set(
			"n",
			"<leader>th",
			":ToggleTerm direction=horizontal<CR>",
			{ desc = "View Terminal (Horizontal)" }
		)
	end,
}
