function Map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

Map("n", "<leader>qq", ":q!<CR>")
Map("n", "<leader>Q", ":qa!<CR>")

Map("n", "gx", ":!open <c-r><c-a><CR>")

Map("n", "<leader>_", "<c-w>s")
Map("n", "<leader>|", "<C-W>v")
Map("n", "<leader>ww", "<C-W>w")
Map("n", "<leader>wd", "<C-W>c")
Map("n", "<leader>s-", ":close<CR>")
Map("n", "<leader>s=", "<C-w>=")

Map("n", "<leader><tab>o", ":tabnew<CR>")
Map("n", "<leader><tab>l", "<cmd>tabnext<cr>")
Map("n", "<leader><tab>h", "<cmd>tabprevious<cr>")
Map("n", "<leader><tab>d", "<cmd>tabclose<cr>")

Map("n", "==", "gg<S-v>G")
Map("n", "J", "mzJ`z")

Map("n", "<leader>cc", ":diffput<CR>") -- put diff from current to other during diff
Map("n", "<leader>ch", ":diffget 1<CR>") -- get diff from left (local) during merge
Map("n", "<leader>cl", ":diffget 3<CR>") -- get diff from right (remote) during merge

Map("n", "<M-o>", ":lua MiniFiles.open()<CR>", { noremap = true, silent = true })

-- keymap.set("n", "<leader>go", function()
-- 	if vim.bo.filetype == "python" then
-- 		vim.api.nvim_command("PyrightOrganizeImports")
-- 	end
-- end)

-- keymap.set("n", "<leader>tc", function()
-- 	if vim.bo.filetype == "python" then
-- 		require("dap-python").test_class()
-- 	end
-- end)

-- keymap.set("n", "<leader>tm", function()
-- 	if vim.bo.filetype == "python" then
-- 		require("dap-python").test_method()
-- 	end
-- end)

-- stylua: ignore start
Map("n", "<leader>bp", "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
Map("n", "<leader>B", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>")
Map("n", "<leader>bm", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>")
Map("n", "<leader>bc", "<cmd>lua require'dap'.clear_breakpoints()<cr>")
Map("n", "<leader>bl", "<cmd>Telescope dap list_breakpoints<cr>")
-- 2 3 4 9 10 11 (or rebind to ipdb style)
Map("n", "<F2>", "<cmd>lua require'dap'.step_back()<cr>")
Map("n", "<F3>", "<cmd>lua require'dap'.step_into()<cr>")
Map("n", "<F4>", "<cmd>lua require'dap'.continue()<cr>")
Map("n", "<F9>", "<cmd>lua require'dap'.step_over()<cr>")
Map("n", "<F10>", "<cmd>lua require'dap'.step_out()<cr>")
-- Map("n", "<leader>dc", "<cmd>DapContinue<CR>", { desc = "Start Debugging" })
Map("n", "<leader>dd", function() require("dap").disconnect() require("dapui").close() end)
Map("n", "<leader>dt", function() require("dap").terminate() require("dapui").close() end)
Map("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>")
Map("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>")
Map("n", "<leader>du", function() require("dap.ui.widgets").hover() end)
Map("n", "<leader>d?", function() local widgets = require("dap.ui.widgets") widgets.centered_float(widgets.scopes) end)
Map("n", "<leader>df", "<cmd>Telescope dap frames<cr>")
Map("n", "<leader>dc", "<cmd>Telescope dap commands<cr>")
-- Run Tests
-- Map("n", "<leader>t", "<cmd>lua require('neotest').run.run()<CR>", { desc = "Run Test" })
-- Map( "n", "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", { desc = "Run Test File" })
-- Map( "n", "<leader>td", "<cmd>lua require('neotest').run.run(vim.fn.getcwd())<CR>", { desc = "Run Current Test Directory" })
-- Map( "n", "<leader>tp", "<cmd>lua require('neotest').output_panel.toggle()<CR>", { desc = "Toggle Test Output Panel" })
-- Map("n", "<leader>tl", "<cmd>lua require('neotest').run.run_last()<CR>", { desc = "Run Last Test" })
-- Map("n", "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<CR>", { desc = "Toggle Test Summary" })
-- Map( "n", "<leader>E", "<cmd>lua require'dap'.set_exception_breakpoints()<CR>", { desc = "Toggle Exception Breakpoint" })
-- Map( "n", "<leader>dr", "<cmd>lua require'dapui'.float_element('repl', { width = 100, height = 40, enter = true })<CR>", { desc = "Show DAP REPL" })
-- Map( "n", "<leader>ds", "<cmd>lua require'dapui'.float_element('scopes', { width = 150, height = 50, enter = true })<CR>", { desc = "Show DAP Scopes" })
-- Map( "n", "<leader>df", "<cmd>lua require'dapui'.float_element('stacks', { width = 150, height = 50, enter = true })<CR>", { desc = "Show DAP Stacks" })
-- Map( "n", "<leader>db", "<cmd>lua require'dapui'.float_element('breakpoints', { enter = true })<CR>", { desc = "Show DAP breakpoints" })

-- stylua: ignore end

Map("n", "<leader>qo", ":copen<CR>")
Map("n", "<leader>qk", ":cfirst<CR>")
Map("n", "<leader>ql", ":cnext<CR>")

Map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
Map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to Left Window" })
Map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to Lower Window" })
Map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to Upper Window" })
Map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to Right Window" })

Map("n", "U", "<C-r>", {})

-- Discovered it when using vim-forgit https://github.com/ray-x/forgit.nvim/issues/1
-- vim.opt.shellcmdflag = "-ic"

-- TODO: change the chars
-- vim.opt.listchars = "tab:>-,eol:$,nbsp:X,trail:#"
-- Map("n", "<leader>ul", ":set list!<cr>")
-- TODO: revert back to original position
-- Map("n", "<leader>yG", ":keepjumps normal! ggyG<cr>", defaults)
-- Map("n", "<leader>dG", ":keepjumps normal! ggdG", defaults)
--
Map("v", "K", ":m '<-2<CR>gv=gv")
Map("v", "J", ":m '>+1<CR>gv=gv")

Map("v", "<", "<gv")
Map("v", ">", ">gv")

Map("c", "<C-j>", 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true })
Map("c", "<C-k>", 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true })

Map("n", "<C-d>", "<C-d>zz")
Map("n", "<C-u>", "<C-u>zz")
Map("n", "<C-b>", "<C-b>zz")
Map("n", "<C-f>", "<C-f>zz")

Map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- Clear search, diff update and redraw
-- map(
--   "n",
--   "<leader>ur",
--   "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
--   { desc = "Redraw / Clear hlsearch / Diff Update" }
-- )
--
-- Add undo break-points
-- map("i", ",", ",<c-g>u")
-- map("i", ".", ".<c-g>u")
-- map("i", ";", ";<c-g>u")
--

--keywordprg
Map("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })

local diagnostic_goto = function(next, severity)
	local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
	severity = severity and vim.diagnostic.severity[severity] or nil
	return function()
		go({ severity = severity })
	end
end
-- map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
-- Map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
-- Map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
Map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
Map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
Map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
Map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- Map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })

vim.cmd("set whichwrap+=<,>,[,],h,l")

vim.keymap.set({ "n", "x", "v" }, "j", "v:count > 7 ? 'gjzz' : 'gjzz'", { expr = true, silent = true })
vim.keymap.set({ "n", "x", "v" }, "k", "v:count > 7 ? 'gkzz' : 'gkzz'", { expr = true, silent = true })

-- vim.g.undotree_SetFocusWhenToggle = 0

-- Map("n", "gf", function()
-- 	if require("obsidian").util.cursor_on_markdown_link() then
-- 		return "<cmd>ObsidianFollowLink<CR>"
-- 	else
-- 		return "gf"
-- 	end
-- end, { noremap = false, expr = true })

vim.keymap.set("c", "<C-a>", "<Home>")
vim.keymap.set("c", "<C-p>", "<Up>")
vim.keymap.set("c", "<C-n>", "<Down>")

Map("n", "gV", "`[V`]")
Map("n", "gl", "`.zz")

Map("n", "<S-l>", ":bnext<cr>")
Map("n", "<S-h>", ":bprevious<cr>")

Map("n", "<leader><Enter>", "!!bash<CR>")

vim.keymap.set("n", ";", ":", { noremap = true })
vim.keymap.set("n", ":", ";", { noremap = true })

-- keymap.set("n", "<leader>ss", ":setlocal spell! spelllang=en_us<CR>", { noremap = true })
-- keymap.set("n", "<leader>sn", "]s", { noremap = true })
-- keymap.set("n", "<leader>sp", "[s", { noremap = true })
-- keymap.set("n", "<leader>sa", "zg", { noremap = true })
-- keymap.set("n", "<leader>s?", "z=", { noremap = true })

vim.cmd("command! W execute 'w !sudo tee % > /dev/null' <bar> edit!")

Map("n", "<Esc>", ":nohls<CR>")

Map("n", "<leader>M", "mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm")

Map("n", "<leader>8", ":%s/")
Map("n", "<leader>*", "yiw :%s/<C-r>0/")
-- Map("n", "<leader>rw", ":%s/\\<<c-r><c-w>\\>/")
-- Map("n", "<leader><leader>8", ":argdo %s/")
-- Map("n", "<leader><leader>*", "yiw :argdo %s/<C-r>0/")
Map("n", "<leader>.8", ":.s/")
Map("n", "<leader>.*", "yiw :.s/<C-r>0/")

Map("n", "<leader>-", ":!")
Map("n", "<leader><leader>k", ":sp | hor resize 10 | term<CR> A")

-- Toggle autocompletion
-- vim.api.nvim_set_keymap("n", "<leader>ua", ":lua ToggleAutocompletion()<CR>", { noremap = true })
-- function ToggleAutocompletion()
-- 	if vim.bo.omnifunc == "omni#complete#TextComplete" then
-- 		vim.bo.omnifunc = ""
-- 		print("Autocompletion disabled")
-- 	else
-- 		vim.bo.omnifunc = "omni#complete#TextComplete"
-- 		print("Autocompletion enabled")
-- 	end
-- end

Map("n", "<leader>oc", "<cmd>lua require('obsidian').util.toggle_checkbox()<CR>", { desc = "Obsidian Check Checkbox" })
Map("n", "<leader>ot", "<cmd>ObsidianTemplate<CR>", { desc = "Insert Obsidian Template" })
Map("n", "<leader>oo", "<cmd>ObsidianOpen<CR>", { desc = "Open in Obsidian App" })
Map("n", "<leader>ob", "<cmd>ObsidianBacklinks<CR>", { desc = "Show ObsidianBacklinks" })
Map("n", "<leader>ol", "<cmd>ObsidianLinks<CR>", { desc = "Show ObsidianLinks" })
Map("n", "<leader>on", "<cmd>ObsidianNew<CR>", { desc = "Create New Note" })
Map("n", "<leader>os", "<cmd>ObsidianSearch<CR>", { desc = "Search Obsidian" })
Map("n", "<leader>oq", "<cmd>ObsidianQuickSwitch<CR>", { desc = "Quick Switch" })

Map("n", "<leader>so", function()
	vim.cmd("so")
end, { desc = "Source current file" })

Map("n", "<leader>mx", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make current file executable" })
--
Map({ "n", "v" }, "G", "G$")
Map({ "n", "v" }, "gg", "gg0")
Map("n", "d,", "d$")
Map("n", "c,", "c$")
Map("n", "y,", "y$")
Map({ "x" }, ",", "$")

Map("n", "<leader>fe", "<cmd>Neotree toggle<cr>")
Map("n", "<leader>vo", ":MaximizerToggle<CR>")

Map("n", "<leader>gb", ":GitBlameToggle<CR>")
Map("n", "<leader>ut", ":TagbarToggle<CR>")
Map("n", "<leader>uc", "<cmd>ChatGPT<cr>")
Map("n", "<leader>uw", "<cmd>lua local wrap_enabled = not vim.wo.wrap vim.wo.wrap = wrap_enabled<CR>")
Map(
	"n",
	"<leader>ud",
	"<cmd>lua if vim.diagnostic.is_enabled() then vim.diagnostic.disable() else vim.diagnostic.enable() end<CR>"
)
Map("n", "<leader>uT", function()
	if vim.b.ts_highlight then
		vim.treesitter.stop()
	else
		vim.treesitter.start()
	end
end, { desc = "Toggle Treesitter Highlight" })

Map("n", "<leader>yF", function()
	local filename = vim.fn.expand("%")
	local lineno = vim.fn.line(".")
	vim.fn.setreg("+", filename .. ":" .. lineno)
end)

Map("n", "<leader>yf", function()
	local filename = vim.fn.expand("%")
	vim.fn.setreg("+", filename)
end)

-- Map("i", "", "<cmd>lua vim.lsp.buf.completion()<CR>")
Map("i", "<C-Y>", "<C-X><C-O>")

-- vim.keymap.set("n", "n", function(nm
-- 	if vim.v.searchforward == 1 then
-- 		return "n"
-- 	else
-- 		return "N"
-- 	end
-- end, { expr = true })
-- vim.keymap.set("n", "N", function()
-- 	if vim.v.searchforward == 1 then
-- 		return "N"
-- 	else
-- 		return "n"
-- 	end
-- end, { expr = true })
