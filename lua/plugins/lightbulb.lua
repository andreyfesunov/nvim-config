--[[
    Plugin that adds a light bulb symbol to a symbol that has code actions
--]]

return {
	"kosayoda/nvim-lightbulb",
	config = function()
		require("nvim-lightbulb").setup({
			autocmd = { enabled = true },
		})
	end,
}
