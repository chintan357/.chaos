return {
	-- https://github.com/stevearc/aerial.nvim
	"stevearc/aerial.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	event = "VeryLazy",
	keys = {
		{ "<leader>ua", "<cmd>AerialToggle<cr>", desc = "AerialToggle" },
	},
	config = function()
		local status_ok, aerial = pcall(require, "aerial")
		if not status_ok then
			return
		end

		aerial.setup({
			on_attach = function(bufnr)
				vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
				vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
			end,
		})

		local tele_status_ok, telescope = pcall(require, "telescope")
		if not tele_status_ok then
			return
		end

		vim.keymap.set("n", "<leader>ta", "<cmd>Telescope aerial<CR>", {
			desc = "Telescope Aerial",
		})

		-- With ! cursor stays in current window
		-- vim.keymap.set("n", "<leader>ua", "<cmd>AerialToggle!<CR>")

		telescope.load_extension("aerial")
	end,
}
