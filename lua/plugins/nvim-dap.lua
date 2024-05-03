return {
	"mfussenegger/nvim-dap",
	dependencies = {
		{
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			config = function(_, opts)
				local dapui = require("dapui")
				dapui.setup(opts)
			end,
		},
		{
			"jay-babu/mason-nvim-dap.nvim",
			dependencies = "mason.nvim",
			cmd = { "DapInstall", "DapUninstall" },
			opts = {
				automatic_installation = true,
				handlers = {},
				ensure_installed = {},
			},
		},
		{ "jbyuki/one-small-step-for-vimkind", module = "osv" },
	},
	config = function()
		-- stylua: ignore start
		function Map(mode, lhs, rhs, opts)
			local options = { noremap = true, silent = true }
			if opts then
				options = vim.tbl_extend("force", options, opts)
			end
			vim.keymap.set(mode, lhs, rhs, options)
		end


		vim.keymap.set("n", "<Leader>bp", function() require("dap").toggle_breakpoint() end)
		vim.keymap.set("n", "<Leader>bm", function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end)
		vim.keymap.set("n", "<Leader>B", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end)
		vim.keymap.set("n", "<Leader>E", function() require("dap").set_exception_breakpoints() end)
		vim.keymap.set("n", "<Leader>bc", function() require("dap").clear_breakpoints() end)

		vim.keymap.set("n", "di", function() require("dap").continue() end)
		vim.keymap.set("n", "<F10>", function() require("dap").step_over() end)
		vim.keymap.set("n", "<F11>", function() require("dap").step_into() end)
		vim.keymap.set("n", "<F12>", function() require("dap").step_out() end)

		vim.keymap.set("n", "<Leader>dl", function() require("dap").run_last() end)
		vim.keymap.set({ "n", "v" }, "<Leader>dh", function() require("dap.ui.widgets").hover() end)
		vim.keymap.set({ "n", "v" }, "<Leader>dp", function() require("dap.ui.widgets").preview() end)
		vim.keymap.set("n", "<Leader>d?", function() local widgets = require("dap.ui.widgets") widgets.centered_float(widgets.scopes) end)

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

		vim.cmd([[
		nnoremap <silent> <leader>dm :lua require('dap-python').test_method()<CR>
		nnoremap <silent> <leader>dC :lua require('dap-python').test_class()<CR>
		vnoremap <silent> <leader>ds <ESC>:lua require('dap-python').debug_selection()<CR>
		]])
		--
		-- stylua: ignore start
		-- vim.keymap.set("n", "<Leader>df", function() local widgets = require("dap.ui.widgets") widgets.centered_float(widgets.frames) end)
		-- vim.keymap.set("n", "<Leader>dr", function() require("dap").repl.toggle() end)

		-- Run Tests
		-- Map("n", "<leader>t", "<cmd>lua require('neotest').run.run()<CR>", { desc = "Run Test" })
		-- Map( "n", "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", { desc = "Run Test File" })
		-- Map( "n", "<leader>td", "<cmd>lua require('neotest').run.run(vim.fn.getcwd())<CR>", { desc = "Run Current Test Directory" })
		-- Map( "n", "<leader>tp", "<cmd>lua require('neotest').output_panel.toggle()<CR>", { desc = "Toggle Test Output Panel" })
		-- Map("n", "<leader>tl", "<cmd>lua require('neotest').run.run_last()<CR>", { desc = "Run Last Test" })
		-- Map("n", "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<CR>", { desc = "Toggle Test Summary" })
		-- keymap.set("n", "<leader>go", function()
		-- 	if vim.bo.filetype == "python" then
		-- 		vim.api.nvim_command("PyrightOrganizeImports")
		-- 	end
		-- end)

		-- keymap.set("n", "<leader>tc", function()
		-- 	if vim.bo.filetype == "python" then
		-- 		require("dap-python").test_class()
		-- 	end
		-- end)

		-- keymap.set("n", "<leader>tm", function()
		-- 	if vim.bo.filetype == "python" then
		-- 		require("dap-python").test_method()
		-- 	end
		-- end)
	end,
}
