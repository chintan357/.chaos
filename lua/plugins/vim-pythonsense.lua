return {
	"jeetsukumaran/vim-pythonsense",
	init = function()
		vim.cmd([[
      let g:is_pythonsense_suppress_motion_keymaps = 1
      "let g:is_pythonsense_alternate_motion_keymaps = 1
    ]])
	end,
	config = function()
		vim.cmd([[
      nnoremap <silent> <leader>py :Pythonsense<CR>
    ]])
	end,
}
