return {
	-- https://github.com/theHamsta/nvim-dap-virtual-text
	"theHamsta/nvim-dap-virtual-text",
	lazy = true,
	config = function()
		require("nvim-dap-virtual-text").setup()
	end,
}
