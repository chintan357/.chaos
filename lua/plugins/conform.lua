return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	lazy = false,
	keys = {
		{
			"<leader>fo",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "n",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = false,
		format_on_save = function(bufnr)
			local disable_filetypes = { c = true, cpp = true }
			return {
				timeout_ms = 500,
				lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
			}
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black" },
			json = { { "prettierd", "prettier" } },
			markdown = { { "prettierd", "prettier" } },
			-- html = { "htmlbeautifier" },
			bash = { "beautysh" },
			-- proto = { "buf" },
			yaml = { "yamlfix" },
			-- toml = { "taplo" },
			sh = { { "shellcheck" } },
			-- You can use a sub-list to tell conform to run *until* a formatter is found.
			javascript = { { "prettierd", "prettier" } },
		},
	},
}
