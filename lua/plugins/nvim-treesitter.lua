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
		},
	},
	config = function(_, opts)
		local configs = require("nvim-treesitter.configs")
		configs.setup(opts)
	end,
}
-- { -- Highlight, edit, and navigate code
--   "nvim-treesitter/nvim-treesitter",
--   build = ":TSUpdate",
--   opts = {
--     ensure_installed = { "bash", "c", "html", "lua", "luadoc", "markdown", "vim", "vimdoc" },
--     auto_install = true,
--     highlight = {
--       enable = true,
--       -- additional_vim_regex_highlighting = { 'ruby' },
--     },
--     indent = { enable = true, disable = { "ruby" } },
--   },
--   config = function(_, opts)
--     -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
--
--     -- Prefer git instead of curl in order to improve connectivity in some environments
--     require("nvim-treesitter.install").prefer_git = true
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
