return {
	-- Setup LSP Saga
	{
		"nvimdev/lspsaga.nvim",
		event = "LspAttach",
		opts = {
			lightbulb = {
				enable = false,
			},
			symbol_in_winbar = {
				enable = true,
			},
			code_action = {
				show_server_name = true,
			},
			-- definition = {
			-- 	keys = {
			-- 		edit = "o",
			-- 	},
			-- },
			-- callhierarchy = {
			-- 	keys = {
			-- 		edit = "o",
			-- 	},
			-- },
			-- Set max height for finder
			finder = {
				max_height = 0.6,
				methods = {
					tyd = "textDocument/typeDefinition",
				},
			},
			-- Disable auto preview and detail in outline
			outline = {
				auto_preview = false,
				detail = false,
			},
		},
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
		keys = {
			{ "glf", "<cmd>Lspsaga finder<CR>", desc = "LSP Finder" },
			{ "gld", "<cmd>Lspsaga goto_definition<CR>", desc = "Go to Definition" },
			{ "glt", "<cmd>Lspsaga goto_type_definition<CR>", desc = "Go to Type Definition" },
			{ "glp", "<cmd>Lspsaga peek_definition<CR>", desc = "Peek Definition" },
			{ "gls", "<cmd>Lspsaga outline<CR>", desc = "Toggle Outline" },
			{ "glh", "<cmd>Lspsaga hover_doc<CR>", desc = "Hover Doc" },
			{ "gli", "<cmd>Lspsaga incoming_calls<CR>", desc = "Incoming Call" },
			{ "glo", "<cmd>Lspsaga outgoing_calls<CR>", desc = "Outgoing Call" },
			{ "gla", "<cmd>Lspsaga code_action<CR>", desc = "Code Action" },
			{ "glr", "<cmd>Lspsaga rename<CR>", desc = "Rename" },

			-- { "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "Jump to Next Diagnostic" },
			-- { "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "Jump to Prev Diagnostic" },
			-- stylua: ignore start
			-- { "]e", function()require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })end, desc = "Jump to Next Error",  },
			-- { "]w", function()require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.WARN })end, desc = "Jump to Next Warning",  },
			-- { "]i", function()require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.INFO })end, desc = "Jump to Next Information",  },
			-- { "]H", function()require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.HINT })end, desc = "Jump to Next Hint",  },
			-- { "[e", function()require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })end, desc = "Jump to Prev Error",  },
			-- { "[w", function()require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.WARN })end, desc = "Jump to Prev Warning",  },
			-- { "[i", function()require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.INFO })end, desc = "Jump to Prev Information",  },
			-- { "[H", function()require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.HINT })end, desc = "Jump to Prev Hint",  },
		},
		config = function(_, opts)
			require("lspsaga").setup(opts)
		end,
	},
}
