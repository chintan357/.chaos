return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	opts = {
		panel = {
			enabled = false,
		},
		suggestion = {
			enabled = false,
		},
	},
	config = function()
		require("copilot").setup({})
	end,
	-- opts = { suggestion = { auto_trigger = true, debounce = 150 }}
}
