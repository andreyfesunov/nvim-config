return {
	"nvim-telescope/telescope-project.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local telescope = require("telescope")

		telescope.load_extension("project")

		vim.keymap.set("n", "<leader>pl", telescope.extensions.project.project, { desc = "Project list" })
	end,
}
