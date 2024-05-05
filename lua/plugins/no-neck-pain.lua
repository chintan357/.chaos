return {
	{
		"shortcuts/no-neck-pain.nvim",
		cmd = "NoNeckPain",
		opts = {
			width = 120,
			integrations = {
				NeoTree = {
					position = "left",
					reopen = true,
				},
			},
		},
		keys = {
			{
				"<leader>cz",
				"<cmd>NoNeckPain<cr>",
				desc = "NoNeckPain - Distraction Free Mode",
			},
			{
				"<leader>cZ",
				":NoNeckPainResize ",
				desc = "NoNeckPain - Resize the window",
			},
		},
	},
}
