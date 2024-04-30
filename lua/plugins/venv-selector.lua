return {
	"linux-cultist/venv-selector.nvim",
	cmd = "VenvSelect",
	dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
	event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
	opts = function(_, opts)
		opts.dap_enabled = true
		return vim.tbl_deep_extend("force", opts, {
			name = {
				"venv",
				".venv",
				"env",
				".env",
			},
		})
	end,
	-- opts = {
	--   -- name = "venv",
	--   -- auto_refresh = false
	-- },
	keys = {
		-- Keymap to open VenvSelector to pick a venv.
		{ "<leader>vs", "<cmd>VenvSelect<cr>" },
		-- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
		{ "<leader>vc", "<cmd>VenvSelectCached<cr>" },
	},
}
