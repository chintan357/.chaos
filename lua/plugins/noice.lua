return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		routes = {
			{
				view = "mini",
				filter = { event = "msg_showmode" },
			},
			{
				filter = {
					event = "msg_show",
					kind = "",
					find = "written",
				},
				opts = { skip = true },
			},
		},
		views = {
			cmdline_popup = {
				position = {
					row = 5,
					col = "50%",
				},
				size = {
					width = 60,
					height = "auto",
				},
			},
			popupmenu = {
				relative = "editor",
				position = {
					row = 8,
					col = "50%",
				},
				size = {
					width = 60,
					height = 10,
				},
				border = {
					style = "rounded",
					padding = { 0, 1 },
				},
				win_options = {
					winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
				},
			},
		},
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		presets = {
			bottom_search = true,
			command_palette = true,
			long_message_to_split = false,
			inc_rename = true,
			lsp_doc_border = false,
		},
	},
	-- stylua: ignore
	keys = {
		-- { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
		{ "<leader>nl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
		{ "<leader>nh", function() require("noice").cmd("history") end, desc = "Noice History" },
		{ "<leader>na", function() require("noice").cmd("all") end, desc = "Noice All" },
		{ "<leader>nd", function() require("noice").cmd("dismiss") end, desc = "Dismiss All" },
		{ "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll Forward", mode = {"i", "n", "s"} },
		{ "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll Backward", mode = {"i", "n", "s"}},
	},
}
