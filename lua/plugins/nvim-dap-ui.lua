return {
	-- https://github.com/rcarriga/nvim-dap-ui
	"rcarriga/nvim-dap-ui",
	event = "VeryLazy",
	dependencies = {
		-- https://github.com/mfussenegger/nvim-dap
		"mfussenegger/nvim-dap",
		-- https://github.com/theHamsta/nvim-dap-virtual-text
		"theHamsta/nvim-dap-virtual-text",
		-- https://github.com/nvim-telescope/telescope-dap.nvim
		"nvim-telescope/telescope-dap.nvim",
		"nvim-neotest/nvim-nio",
		"LiadOz/nvim-dap-repl-highlights",
	},
	opts = {
		controls = {
			element = "repl",
			enabled = true,
			icons = {
				disconnect = "",
				pause = "",
				play = "",
				run_last = "",
				step_back = "",
				step_into = "",
				step_out = "",
				step_over = "",
				terminate = "",
			},
		},
		element_mappings = {},
		expand_lines = true,
		floating = {
			border = "single",
			mappings = {
				close = { "q", "<Esc>" },
			},
		},
		force_buffers = true,
		icons = {
			collapsed = "",
			current_frame = "",
			expanded = "",
		},
		layouts = {
			{
				elements = {
					{
						id = "scopes",
						size = 0.50,
					},
					{
						id = "stacks",
						size = 0.30,
					},
					{
						id = "watches",
						size = 0.10,
					},
					{
						id = "breakpoints",
						size = 0.10,
					},
				},
				size = 40,
				position = "left", -- Can be "left" or "right"
			},
			{
				elements = {
					"repl",
					"console",
				},
				size = 10,
				position = "bottom", -- Can be "bottom" or "top"
			},
		},
		mappings = {
			edit = "e",
			expand = { "<CR>", "<2-LeftMouse>" },
			open = "o",
			remove = "d",
			repl = "r",
			toggle = "t",
		},
		render = {
			indent = 1,
			max_value_lines = 100,
		},
	},
	config = function(_, opts)
		local dap, dapui = require("dap"), require("dapui")

		-- stylua: ignore start
		require("dapui").setup(opts)
		Map("n", "<leader>du", function() require("dapui").toggle() end)
		Map("n", "<leader>dd", function() require("dap").disconnect() require("dapui").close() end)
		Map("n", "<leader>dt", function() require("dap").terminate() require("dapui").close() end)

		Map("n", "<leader>df", "<cmd>Telescope dap frames<cr>")
		Map("n", "<leader>dc", "<cmd>Telescope dap commands<cr>")
		Map("n", "<leader>bl", "<cmd>Telescope dap list_breakpoints<cr>")

		-- Map("n", "<leader>dw", "<Cmd>lua require('dapui').float_element('watches')<CR>")
		-- Map( "n", "<leader>di", "<Cmd>lua require('dapui').float_element('stacks')<CR>" )
		Map("n", "<leader>do", "<Cmd>lua require('dapui').float_element('scopes')<CR>")
		Map({ "v", "n" }, "<M-k>", "<Cmd>lua require('dapui').eval()<CR>")
		Map( "n", "<leader>dr", "<cmd>lua require'dapui'.float_element('repl', { width = 100, height = 40, enter = true })<CR>", { desc = "Show DAP REPL" })
		Map( "n", "<leader>ds", "<cmd>lua require'dapui'.float_element('scopes', { width = 150, height = 50, enter = true })<CR>", { desc = "Show DAP Scopes" })
		Map( "n", "<leader>dS", "<cmd>lua require'dapui'.float_element('stacks', { width = 150, height = 50, enter = true })<CR>", { desc = "Show DAP Stacks" })
		-- Map( "n", "<leader>db", "<cmd>lua require'dapui'.float_element('breakpoints', { enter = true })<CR>", { desc = "Show DAP breakpoints" })
		-- vim.keymap.set("n", "<Leader>df", function() local widgets = require("dap.ui.widgets") widgets.centered_float(widgets.frames) end)

		vim.keymap.set({ "n", "v" }, "<Leader>dh", function() require("dap.ui.widgets").hover() end)
		vim.keymap.set({ "n", "v" }, "<Leader>dp", function() require("dap.ui.widgets").preview() end)
		vim.keymap.set("n", "<Leader>d?", function() local widgets = require("dap.ui.widgets") widgets.centered_float(widgets.scopes) end)

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		-- require("dapui").float_element(<element ID>, <optional settings>)
		-- width: number Width of the window
		-- height: number Height of the window
		-- enter: boolean Enter the floating window
		-- position: string Position of floating window. center or nil
		--
		-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
		-- dap.configurations.xxxxxxxxxx = {
		--   {
		--   },
		-- }
	end,
}
