-- Code Tree Support / Syntax Highlighting
return {
	-- https://github.com/nvim-treesitter/nvim-treesitter
	"nvim-treesitter/nvim-treesitter",
	event = "VeryLazy",
	dependencies = {
		-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	build = ":TSUpdate",
	opts = {
		highlight = {
			enable = true,
		},
		indent = { enable = true },
		auto_install = true, -- automatically install syntax support when entering new file type buffer
		ensure_installed = {
			"lua",
			"python",
			"yaml",
			"markdown",
			"markdown_inline",
			"json",
			"bash",
			"vimdoc",
			"vim",
			"luadoc",
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.install").prefer_git = true
		local configs = require("nvim-treesitter.configs")
		configs.setup(opts)
	end,
}
--       -- additional_vim_regex_highlighting = { 'ruby' },
--     },
--     indent = { enable = true, disable = { "ruby" } },
--   },
--   config = function(_, opts)
--     -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
--
--     ---@diagnostic disable-next-line: missing-fields
--     require("nvim-treesitter.configs").setup(opts)
--
--     -- There are additional nvim-treesitter modules that you can use to interact
--     -- with nvim-treesitter. You should go explore a few and see what interests you:
--     --
--     --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
--     --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
--     --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
--   end,
-- },
