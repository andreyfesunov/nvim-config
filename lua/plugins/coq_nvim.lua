--[[
    Main Plugin for Snippet Engine - COQ
--]]

return {
	"ms-jpq/coq_nvim",
	branch = "coq",
	init = function()
		vim.g.coq_settings = {
			auto_start = true,
		}

		vim.api.nvim_set_keymap(
			"i",
			"<CR>",
			[[pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"]],
			{ expr = true, silent = true }
		)
	end,
}
