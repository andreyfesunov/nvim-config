return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup()

		vim.keymap.set("n", "<leader>t1", ":ToggleTerm 1<CR>", { desc = "View Terminal (1)" })
		vim.keymap.set("n", "<leader>t2", ":ToggleTerm 2<CR>", { desc = "View Terminal (2)" })
	end,
}
