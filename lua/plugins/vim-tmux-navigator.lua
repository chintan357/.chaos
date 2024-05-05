return {
	-- https://github.com/christoomey/vim-tmux-navigator
	"christoomey/vim-tmux-navigator",
	event = function()
		if vim.fn.exists("$TMUX") == 1 then
			return "VeryLazy"
		end
	end,
}
