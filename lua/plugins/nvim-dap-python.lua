return {
	-- https://github.com/mfussenegger/nvim-dap-python
	"mfussenegger/nvim-dap-python",
	ft = "python",
	dependencies = {
		-- https://github.com/mfussenegger/nvim-dap
		"mfussenegger/nvim-dap",
	},
	config = function()
		-- require('dap-python').setup('/usr/bin/python3')
		require("dap-python").setup()
	end,
}
