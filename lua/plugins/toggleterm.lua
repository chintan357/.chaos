return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {
		open_mapping = "[[<c-t>]]",
		hide_numbers = true,
		shade_filetypes = {},
		autochdir = true, -- when neovim changes it current directory the terminal will change it's own when next it's opened
		shade_terminals = true,
		start_in_insert = true,
		insert_mappings = true, -- whether or not the open mapping applies in insert mode
		terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
		persist_size = true,
		persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
		close_on_exit = true,
		direction = "horizontal",
		shell = vim.o.shell,
		auto_scroll = true, -- automatically scroll to the bottom on terminal output
		float_opts = {
			-- The border key is *almost* the same as 'nvim_open_win'
			-- see :h nvim_open_win for details on borders however
			border = "single",
			winblend = 3,
		},
		winbar = {
			enabled = false,
			name_formatter = function(term) --  term: Terminal
				return term.name
			end,
		},
	},
}
-- return {'akinsho/toggleterm.nvim', version = "*", config = true}
-- size = 20 | function(term)
--   if term.direction == "horizontal" then
--     return 15
--   elseif term.direction == "vertical" then
--     return vim.o.columns * 0.4
--   end
-- end,
-- direction = 'vertical' | 'horizontal' | 'tab' | 'float',
