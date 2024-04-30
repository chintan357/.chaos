return {
	-- https://github.com/kylechui/nvim-surround
	"kylechui/nvim-surround",
	version = "*",
	event = "VeryLazy",
	config = function()
		require("nvim-surround").setup({})
	end,
}
