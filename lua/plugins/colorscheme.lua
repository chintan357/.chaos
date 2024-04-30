return {
	"olimorris/onedarkpro.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		styles = {
			comments = "italic",
			keywords = "bold,italic",
			conditionals = "italic",
			Directory = { bold = true },
			ErrorMsg = { italic = true, bold = true },
			functions = "italic",
		},
		options = {
			cursorline = true,
			transparency = true,
			terminal_colors = true,
			-- lualine_transparency = false, -- Center bar transparency?
			highlight_inactive_windows = false, -- When the window is out of focus, change the normal background?
		},
	},
	config = function(_, opts)
		require("onedarkpro").setup(opts)
		vim.cmd("colorscheme onedark")
	end,
}

-- return {
--   'altercation/vim-colors-solarized',
--   lazy = false,
--   priority = 1000,
--   config = function(_, opts)
--     vim.cmd("colorscheme solarized")
--     vim.cmd("set background=dark")
--   end
--
-- }

-- return {
--   'morhetz/gruvbox',
--   lazy = false,
--   priority = 1000,
--   config = function(_, opts)
--     vim.cmd("colorscheme gruvbox")
--   end
--
-- }
