return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"nvim-telescope/telescope.nvim",
	},
	opts = {
		graph_style = "unicode",
		integrations = {
			telescope = true,
			diffview = true,
		},
	},
	config = function(_, opts)
		require("neogit").setup(opts)
	end,
}
