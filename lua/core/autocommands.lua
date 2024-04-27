local function augroup(name)
	return vim.api.nvim_create_augroup("captain_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = augroup("highlight_yank"),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
	group = augroup("checktime"),
	callback = function()
		if vim.o.buftype ~= "nofile" then
			vim.cmd("checktime")
		end
	end,
})

vim.api.nvim_create_autocmd({ "VimResized" }, {
	group = augroup("resize_splits"),
	callback = function()
		local current_tab = vim.fn.tabpagenr()
		vim.cmd("tabdo wincmd =")
		vim.cmd("tabnext " .. current_tab)
	end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
	group = augroup("last_loc"),
	callback = function(event)
		local exclude = { "gitcommit" }
		local buf = event.buf
		if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
			return
		end
		vim.b[buf].lazyvim_last_loc = true
		local mark = vim.api.nvim_buf_get_mark(buf, '"')
		local lcount = vim.api.nvim_buf_line_count(buf)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = augroup("close_with_q"),
	pattern = {
		"PlenaryTestPopup",
		"help",
		"lspinfo",
		"notify",
		"qf",
		"query",
		"spectre_panel",
		"startuptime",
		"tsplayground",
		"neotest-output",
		"checkhealth",
		"neotest-summary",
		"neotest-output-panel",
		"ChatGPT",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = augroup("man_unlisted"),
	pattern = { "man" },
	callback = function(event)
		vim.bo[event.buf].buflisted = false
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = augroup("wrap_spell"),
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	group = augroup("json_conceal"),
	pattern = { "json", "jsonc", "json5" },
	callback = function()
		vim.opt_local.conceallevel = 0
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	group = augroup("auto_create_dir"),
	callback = function(event)
		if event.match:match("^%w%w+:[\\/][\\/]") then
			return
		end
		local file = vim.uv.fs_realpath(event.match) or event.match
		vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
	end,
})

vim.cmd([[

"inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"
"inoremap <expr> <c-n> pumvisible() ? "\<lt>c-n>" : "\<lt>c-n>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>"
"inoremap <expr> <m-;> pumvisible() ? "\<lt>c-n>" : "\<lt>c-x>\<lt>c-o>\<lt>c-n>\<lt>c-p>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>"

augroup remember_folds
  autocmd!
  autocmd BufWinLeave ?* mkview
  autocmd BufWinEnter ?* silent! loadview
augroup END

"augroup JumpCursorOnEdit
"  au!
"  autocmd BufReadPost *
"        \ if expand("<afile>:p:h") !=? $TEMP |
"        \   if line("'\"") > 1 && line("'\"") <= line("$") |
"        \     let JumpCursorOnEdit_foo = line("'\"") |
"        \     let b:doopenfold = 1 |
"        \     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
"        \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
"        \        let b:doopenfold = 2 |
"        \     endif |
"        \     exe JumpCursorOnEdit_foo |
"        \   endif |
"        \ endif
"  autocmd BufWinEnter *
"        \ if exists("b:doopenfold") |
"        \   exe "normal zv" |
"        \   if(b:doopenfold > 1) |
"        \       exe  "+".1 |
"        \   endif |
"        \   unlet b:doopenfold |
"        \ endif
"augroup END

autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

nnoremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

let g:lasttab = 1
noremap Tr :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


set switchbuf=useopen,usetab,newtab

"set viewoptions-=options
"set viewoptions=unix,slash

"command! Bclose call <SID>BufcloseCloseIt()
"function! <SID>BufcloseCloseIt()

"let l:currentBufNum = bufnr("%")
"let l:alternateBufNum = bufnr("#")
"
"if buflisted(l:alternateBufNum)
"  buffer #
"else
"  bnext
"endif
"
"if bufnr("%") == l:currentBufNum
"  new
"  endif
"  if buflisted(l:currentBufNum)
"    execute("bdelete! ".l:currentBufNum)
"  endif
"endfunction


"for char in [ '_', '.', ':', ',', ';', '<bar>', '/', '<bslash>', '*', '+', '%', '`' ]
"  execute 'xnoremap i' . char . ' :<C-u>normal! T' . char . 'vt' . char . '<CR>'
"  execute 'onoremap i' . char . ' :normal vi' . char . '<CR>'
"  execute 'xnoremap a' . char . ' :<C-u>normal! F' . char . 'vf' . char . '<CR>'
"  execute 'onoremap a' . char . ' :normal va' . char . '<CR>'
"endfor

command! W w !sudo tee % > /dev/null

]])
