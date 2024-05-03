--\| hor resize 10 \| term

-- function M.ghline()
-- 	map("", "<Leader>gO", "<Plug>(gh-repo)", {})
-- 	map("", "<Leader>gL", "<Plug>(gh-line)", {})
-- end

-- vim.keymap.set("n", "<leader>a", function()
-- 	vim.cmd("Rg")
-- end)
-- vim.keymap.set("n", "<leader>e", function()
-- 	vim.cmd("RgIgnoreFilename")
-- end)
-- vim.keymap.set("n", "<leader>b", function()
-- 	vim.cmd("Buffers")
-- end)
-- vim.keymap.set("n", "<C-N>", function()
-- 	vim.cmd("Lines")
-- end)
-- vim.keymap.set("n", "<C-P>", function()
-- 	vim.cmd("Files")
-- end)

-- fzf.vim configuration {{{
vim.api.nvim_create_user_command("RgIgnoreFilename", function(opts)
	local spec = vim.fn["fzf#vim#with_preview"]()
	spec.options = { "--delimiter", ":", "--nth", 4, unpack(spec.options) }
	vim.fn["fzf#vim#grep"](
		"rg --column --line-number --no-heading --color=always --smart-case -- " .. vim.fn.shellescape(opts.args),
		spec,
		opts.bang and 1 or 0
	)
end, { nargs = "*", bang = true })
vim.api.nvim_create_user_command("RgIgnoreTests", function(opts)
	local spec = vim.fn["fzf#vim#with_preview"]()
	spec.options = { "--delimiter", ":", "--nth", 4, unpack(spec.options) }
	vim.fn["fzf#vim#grep"](
		"rg --column --line-number --no-heading --color=always --smart-case --glob !test/ --glob !spec/ -- "
			.. vim.fn.shellescape(opts.args),
		spec,
		opts.bang and 1 or 0
	)
end, { nargs = "*", bang = true })
