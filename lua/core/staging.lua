-- vim.keymap.set("n", "<F2>", "x $ p")
vim.cmd([[xnoremap i$ :<C-u> normal! T$vt$<CR>]])
vim.cmd([[onoremap i$ :normal vi$<CR>]])
vim.cmd([[xnoremap a$ :<C-u> normal!F$vf$<CR>]])
vim.cmd([[onoremap a$ :normal va$<CR>]])

--\| hor resize 10 \| term

-- map("i","llr", "\\left( \\right)<Esc>7hi")

-- TODO: take this
vim.keymap.set("x", "<leader>p", '"_dP')

function M.ghline()
	map("", "<Leader>gO", "<Plug>(gh-repo)", {})
	map("", "<Leader>gL", "<Plug>(gh-line)", {})
end

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

map("n", "N", [[v:searchforward ? 'N' : 'n']], { expr = true, noremap = true, silent = true })
map("n", "n", [[v:searchforward ? 'n' : 'N']], { expr = true, noremap = true, silent = true })

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
