return {
	"jpalardy/vim-slime",
	init = function()
		vim.g.slime_target = "tmux"
		vim.cmd([[
        let g:slime_default_config = {"socket_name": "default", "target_pane": "1"}
        ]])
		vim.g.slime_no_mappings = 1
		vim.g.slime_paste_file = "/home/chintan357/.slime_paste"
		vim.g.slime_bracketed_paste = 1
		vim.g.slime_dont_ask_default = 1
		vim.g.slime_cell_delimiter = "#%%"
		-- let g:slime_python_ipython = 1
	end,
	config = function()
		vim.cmd([[
        nmap <leader>sc <Plug>SlimeSendCell
        ]])
		-- vim.keymap.set("n", "<leader>sm", "<Plug>SlimeMotionSend<cr>", { remap = true, silent = false })
		-- vim.keymap.set("n", "<leader>ss", "<Plug>SlimeLineSend<cr>", { remap = true, silent = false })
		vim.keymap.set("x", "<leader>s", "<Plug>SlimeRegionSend<cr>", { remap = true, silent = false })
		-- vim.keymap.set("n", "<leader>sc", "<Plug>SlimeConfig<cr>", { remap = true, silent = false })
		vim.keymap.set("n", "<leader>sp", "<Plug>SlimeParagraphSend<cr>", { noremap = true, silent = true })
	end,
}
