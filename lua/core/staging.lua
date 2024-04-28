-- vim.keymap.set("n", "<F2>", "x $ p")
vim.cmd([[xnoremap i$ :<C-u> normal! T$vt$<CR>]])
vim.cmd([[onoremap i$ :normal vi$<CR>]])
vim.cmd([[xnoremap a$ :<C-u> normal!F$vf$<CR>]])
vim.cmd([[onoremap a$ :normal va$<CR>]])

-- run black on quit, only on python files
vim.cmd([[autocmd FileType python    nnoremap ZZ  :w <CR> :! black % <CR>  :exit <CR> ]])
--

vim.keymap.set("n", "<leader>2", ":%s/")
vim.keymap.set("n", "<leader>*", "yiw :%s/<C-r>0/")
vim.keymap.set("n", "<leader><leader>²", ":argdo %s/")
vim.keymap.set("n", "<leader><leader>*", "yiw :argdo %s/<C-r>0/")
vim.keymap.set("n", "<leader>.*", ":.s/")
vim.keymap.set("n", "<leader>..*", "yiw :.s/<C-r>0/")
vim.keymap.set("n", "<leader>.e", "yiw :.,$s/")
vim.keymap.set("n", "<leader>..e", "yiw :.,$s/<C-r>0/")
vim.keymap.set("n", "<leader>b", ":w <CR> :!black % <CR>")

vim.cmd([[autocmd BufWritePre * :%s/\s\+$//e]])

vim.keymap.set("n", "<leader>_", ":!")
vim.keymap.set("n", ";", "/def ")
-- opens up a terminal
vim.keymap.set("n", "<leader><leader>k", ":sp | hor resize 10 | term<CR> A")
vim.keymap.set("n", "<leader><leader>i", ":sp | hor resize 10 | term ipython <CR> A")
vim.keymap.set("n", "<leader><leader>r", ":sp | hor resize 10 | term R <CR> A")

-- vim.keymap.set("n","<F4>", ":w <CR> [[wf_lyw :sp | hor resize 10 | term pytest % -k <C-r>0<CR>")
remap("n", "<F4>", ":w <CR> [[wf_lyw :sp | hor resize 10 | term pytest % -k <C-r>0<CR>")
-- vim.keymap.set("n","<F4>", ":w <CR> [[wf_lyw ")
-- vim.keymap.set("n","<leader>gd",":vs <CR>:<C-U>TmuxNavigatePrevious<cr>ZZ")
-- vim.cmd[[noremap <leader><leader>]]
remap("n", "<leader><leader>gd", "gpd <CR> |:sleep 200m <CR> :vs % <CR> <C-o> gP")
remap("n", "<leader><leader><leader>gd", "gpd <CR> |:sleep 1 <CR> :vs % <CR> <C-o> gP")
-- for vim-slime
-- vim.keymap.set("x", "<F9>", "<Plug>SlimeRegionSend")
-- vim.keymap.set("n", "<F9>", "<Plug>SlimeParagraphSend")
vim.keymap.set("n", "<F9>", "<S-v> <Plug>SlimeRegionSend j")
vim.keymap.set("n", "<F7>", "<S-v> <Plug>SlimeParagraphSend")
vim.g.slime_python_ipython = 1
-- vim.keymap.set("n","<leader><leader>gd","gd :vs <CR> <C-o>")
--\| hor resize 10 \| term
-- deoplete auto completion for latex
function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
-- can remove and copy lines adding a leader in order to paste with ctrl v
map("n", "<leader>y", '"+y')
map("v", "<leader>y", '"+y')
map("n", "<leader>y", '"+Y')
map("i", "<C-v>", "<C-r>+")
map("n", "<leader>f", ":MaximizerToggle!<CR>")

vim.g.tmux_navigator_no_mappings = 1

map("i", "jk", "<Esc>")
-- map("i","llr", "\\left( \\right)<Esc>7hi")
map("n", "<C-j>", "10j")
map("n", "<C-h>", "10h")
map("n", "<C-l>", "10l")
map("n", "<C-k>", "10k")

vim.keymap.set("n", "G", "G$")
vim.keymap.set("v", "G", "G$")
vim.keymap.set("n", "gg", "gg0")
vim.keymap.set("v", "gg", "gg0")
vim.keymap.set("n", ",", "$")

vim.keymap.set("n", "d,", "d$")
vim.keymap.set("n", "c,", "c$")
vim.keymap.set("n", "c,", "c$")
vim.keymap.set("n", "y,", "y$")
vim.keymap.set("x", ",", "$")
vim.keymap.set("x", "<leader>p", '"_dP')
vim.g.tmux_resizer_no_mappings = 1

-- Find and replace word under cursor
-- Using the `:` format for a vim command allows it to be finished by the user
vim.keymap.set("n", "<leader>s", ":%s/\\<<c-r><c-w>\\>/")

vim.keymap.set("n", "<leader>u", function()
	vim.cmd("cprevious")
end)
vim.keymap.set("n", "<leader>o", function()
	vim.cmd("cnext")
end)
vim.keymap.set("n", "<leader>n", function()
	vim.diagnostic.goto_next()
end)
vim.keymap.set("n", "<leader>p", function()
	vim.diagnostic.goto_prev()
end)
vim.keymap.set("i", "<C-Y>", "<C-X><C-O>")

-- Copy filename:lineno to system clipboard
vim.keymap.set("n", "<leader>C", function()
	local filename = vim.fn.expand("%")
	local lineno = vim.fn.line(".")
	-- `+` is the clipboard "selection register"
	vim.fn.setreg("+", filename .. ":" .. lineno)
end)

vim.keymap.set("n", "<leader>c", function()
	local filename = vim.fn.expand("%")
	-- `+` is the clipboard "selection register"
	vim.fn.setreg("+", filename)
end)

vim.keymap.set("n", "<leader>f", function()
	vim.opt.foldmethod = "syntax"
end)

local TMUX = vim.env.TMUX
if TMUX ~= "" then
	vim.g.slime_default_config = {
		socket_name = vim.fn.split(TMUX, ",")[1],
		target_pane = ":.2",
	}
	vim.g.slime_target = "tmux"
	vim.g.slime_no_mappings = 1
	vim.keymap.set({ "x" }, "<c-s><c-s>", "<Plug>SlimeRegionSend")
	vim.keymap.set({ "n" }, "<c-s><c-s>", "<Plug>SlimeParagraphSend")
	vim.keymap.set({ "n" }, "<c-s>v", "<Plug>SlimeConfigSend")
end

function M.ghline()
	map("", "<Leader>gO", "<Plug>(gh-repo)", {})
	map("", "<Leader>gL", "<Plug>(gh-line)", {})
end

function M.gitgutter()
	cmd([[
        hi! link GitGutterAdd Constant
        hi! link GitGutterChange Type
        hi! link GitGutterDelete Identifier
        hi! link GitGutterAddLineNr GitGutterAdd
        hi! link GitGutterChangeLineNr GitGutterChange
        hi! link GitGutterDeleteLineNr GitGutterDelete
        hi! link GitGutterChangeDeleteLineNr GitGutterChangeDeleteLine
        hi! link GitGutterAddIntraLine DiffText
        hi! link GitGutterDeleteIntraLine DiffText
    ]])
	if g.colors_name == "one" then
		cmd("hi! GitGutterChangeDeleteLine guifg=#be5046")
	end
	map("n", "<Leader>hp", "<Plug>(GitGutterPreviewHunk)", {})
	map("n", "<Leader>hs", "<Plug>(GitGutterStageHunk)", {})
	map("n", "<Leader>hu", "<Plug>(GitGutterUndoHunk)", {})
	map("n", "[c", "<Plug>(GitGutterPrevHunk)", {})
	map("n", "]c", "<Plug>(GitGutterNextHunk)", {})
	map("o", "ih", "<Plug>(GitGutterTextObjectInnerPending)", {})
	map("o", "ah", "<Plug>(GitGutterTextObjectOuterPending)", {})
	map("x", "ih", "<Plug>(GitGutterTextObjectInnerVisual)", {})
	map("x", "ah", "<Plug>(GitGutterTextObjectOuterVisual)", {})
end

-- fugitive
vim.keymap.set({ "n" }, "gw", function()
	vim.cmd("Gwrite")
end)
vim.keymap.set({ "n" }, "gs", function()
	vim.cmd("G status")
end)
vim.keymap.set({ "n" }, "gc", function()
	vim.cmd("G commit -v")
end)
vim.keymap.set({ "n" }, "gp", function()
	vim.cmd("G push")
end)
vim.keymap.set({ "n" }, "gfp", function()
	vim.cmd("G push -f")
end)
vim.keymap.set({ "n" }, "gy", function()
	vim.cmd("GBrowse!")
end)
vim.keymap.set({ "v" }, "gy", function()
	vim.cmd("'<'>GBrowse!")
end)

vim.keymap.set("n", "<leader>a", function()
	vim.cmd("Rg")
end)
vim.keymap.set("n", "<leader>e", function()
	vim.cmd("RgIgnoreFilename")
end)
vim.keymap.set("n", "<leader>b", function()
	vim.cmd("Buffers")
end)
vim.keymap.set("n", "<C-N>", function()
	vim.cmd("Lines")
end)
vim.keymap.set("n", "<C-P>", function()
	vim.cmd("Files")
end)

map("n", "N", [[v:searchforward ? 'N' : 'n']], { expr = true, noremap = true, silent = true })
map("n", "n", [[v:searchforward ? 'n' : 'N']], { expr = true, noremap = true, silent = true })

-- map({ "n", "v" }, "<C-c><C-c>", "<Plug>SlimeParagraphSend", { noremap = true, silent = true, desc = "Send to REPL" })
-- map({ "n", "v" }, "<C-c><C-v>", "<Plug>SlimeConfig", { noremap = true, silent = true, desc = "Config Slime" })

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

-- Make n always go down and N always go up in a file
vim.keymap.set("n", "n", function()
	if vim.v.searchforward == 1 then
		return "n"
	else
		return "N"
	end
end, { expr = true })
vim.keymap.set("n", "N", function()
	if vim.v.searchforward == 1 then
		return "N"
	else
		return "n"
	end
end, { expr = true })
vim.opt.guicursor = nil

vim.o.errorformat = vim.o.errorformat .. ",%f:%l"
vim.opt.grepprg = "rg --vimgrep --no-heading"
vim.opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"

local currentmode = {
	n = "N",
	no = "N·Op Pending",
	v = "V",
	V = "VLine",
	[""] = "VBlock",
	s = "Select",
	S = "S·Line",
	x19 = "S·Block",
	i = "I",
	R = "R",
	Rv = "VReplace",
	c = "Command",
	cv = "Vim Ex",
	ce = "Ex",
	r = "Prompt",
	rm = "More",
	["r?"] = "Confirm",
	["!"] = "Shell",
	t = "Terminal",
}

local function status_diagnostic()
	-- local info = vim.b.coc_diagnostic_info
	if not info or #info == 0 then
		return ""
	end
	local msgs = {}
	if info.error then
		table.insert(msgs, "E" .. info.error)
	end
	if info.warning then
		table.insert(msgs, "W" .. info.warning)
	end
	if info.information then
		table.insert(msgs, "I" .. info.information)
	end
	if #msgs == 0 then
		return "[✓]"
	end
	return "[" .. table.concat(msgs) .. "]"
end

BuildStatusline = function()
	local vim_mode = currentmode[vim.fn.mode()] or "?"
	local codeowner = vim.fn["codeowners#who"](vim.api.nvim_buf_get_name(0))
	local relative_path = vim.fn.expand("%:~:.")
	local parts = {
		"[",
		vim_mode,
		"]",
		status_diagnostic(),
		" ",
		"%<", -- truncate here if too long
		relative_path, -- filename
		" ",
		"%h", -- help text indicator
		"%m", -- modifiable flag
		"%r", -- read only flag
		"[",
		codeowner,
		"]",
		"%=", -- alignment break
		"%y", -- filetype
		"%14.(", -- start of group (which must be minimum of 14 characters)
		"[",
		"%l", -- line number
		"/",
		"%L", -- number of lines in buffer
		":",
		"%v", -- "virtual" column number (number of visual chars from left)
		"]",
		"%)", -- end of group
		" ",
		"%P", -- percent of the way through file
	}
	return table.concat(parts)
end

vim.opt.statusline = "%!v:lua.BuildStatusline()"
