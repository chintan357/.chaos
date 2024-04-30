local keymap = vim.keymap
local map = vim.keymap.set

local defaults = { noremap = true, silent = true }

function Map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

--  See `:help wincmd` for a list of all window commands

keymap.set("n", "<leader>qq", ":q!<CR>")
keymap.set("n", "<leader>Q", ":qa!<CR>")

keymap.set("n", "gx", ":!open-cli <c-r><c-a><CR>")

keymap.set("n", "<leader>_", "<c-w>s")
keymap.set("n", "<leader>|", "<C-W>v")
keymap.set("n", "<leader>ww", "<C-W>w")
keymap.set("n", "<leader>wd", "<C-W>c")
keymap.set("n", "<leader>s-", ":close<CR>")
keymap.set("n", "<leader>s=", "<C-w>=")

keymap.set("n", "<leader><tab>o", ":tabnew<CR>")
keymap.set("n", "<leader><tab>k", "<cmd>tabfirst<cr>")
keymap.set("n", "<leader><tab>j", "<cmd>tablast<cr>")
keymap.set("n", "<leader><tab>l", "<cmd>tabnext<cr>")
keymap.set("n", "<leader><tab>h", "<cmd>tabprevious<cr>")
keymap.set("n", "<leader><tab>d", "<cmd>tabclose<cr>")

vim.keymap.set("n", "==", "gg<S-v>G")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

keymap.set("n", "<leader>cc", ":diffput<CR>") -- put diff from current to other during diff
keymap.set("n", "<leader>ch", ":diffget 1<CR>") -- get diff from left (local) during merge
keymap.set("n", "<leader>cl", ":diffget 3<CR>") -- get diff from right (remote) during merge

keymap.set("n", "<M-o>", ":lua MiniFiles.open()<CR>", { noremap = true, silent = true })

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

keymap.set("n", "<leader>bp", "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
keymap.set("n", "<leader>B", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>")
keymap.set("n", "<leader>bl", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>")
keymap.set("n", "<leader>cb", "<cmd>lua require'dap'.clear_breakpoints()<cr>")
keymap.set("n", "<leader>ba", "<cmd>Telescope dap list_breakpoints<cr>")
keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>")
keymap.set("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>")
keymap.set("n", "<leader>dk", "<cmd>lua require'dap'.step_into()<cr>")
keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>")
keymap.set("n", "<leader>dd", function()
	require("dap").disconnect()
	require("dapui").close()
end)
keymap.set("n", "<leader>dt", function()
	require("dap").terminate()
	require("dapui").close()
end)
keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>")
keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>")

keymap.set("n", "<leader>di", function()
	require("dap.ui.widgets").hover()
end)
keymap.set("n", "<leader>d?", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.scopes)
end)

keymap.set("n", "<leader>df", "<cmd>Telescope dap frames<cr>")
keymap.set("n", "<leader>dh", "<cmd>Telescope dap commands<cr>")

-- vim.keymap.set("n", "<leader>dc", "<cmd>DapContinue<CR>", { desc = "Start Debugging" })
-- Run Tests
-- vim.keymap.set("n", "<leader>t", "<cmd>lua require('neotest').run.run()<CR>", { desc = "Run Test" })
-- vim.keymap.set(
--   "n",
--   "<leader>tf",
--   "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>",
--   { desc = "Run Test File" }
-- )
-- vim.keymap.set(
--   "n",
--   "<leader>td",
--   "<cmd>lua require('neotest').run.run(vim.fn.getcwd())<CR>",
--   { desc = "Run Current Test Directory" }
-- )
-- vim.keymap.set(
--   "n",
--   "<leader>tp",
--   "<cmd>lua require('neotest').output_panel.toggle()<CR>",
--   { desc = "Toggle Test Output Panel" }
-- )
-- vim.keymap.set("n", "<leader>tl", "<cmd>lua require('neotest').run.run_last()<CR>", { desc = "Run Last Test" })
-- vim.keymap.set("n", "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<CR>", { desc = "Toggle Test Summary" })
--
-- Debug Tests
-- vim.keymap.set(
-- 	"n",
-- 	"<leader>E",
-- 	"<cmd>lua require'dap'.set_exception_breakpoints()<CR>",
-- 	{ desc = "Toggle Exception Breakpoint" }
-- )
-- vim.keymap.set(
-- 	"n",
-- 	"<leader>dr",
-- 	"<cmd>lua require'dapui'.float_element('repl', { width = 100, height = 40, enter = true })<CR>",
-- 	{ desc = "Show DAP REPL" }
-- )
-- vim.keymap.set(
-- 	"n",
-- 	"<leader>ds",
-- 	"<cmd>lua require'dapui'.float_element('scopes', { width = 150, height = 50, enter = true })<CR>",
-- 	{ desc = "Show DAP Scopes" }
-- )
-- vim.keymap.set(
-- 	"n",
-- 	"<leader>df",
-- 	"<cmd>lua require'dapui'.float_element('stacks', { width = 150, height = 50, enter = true })<CR>",
-- 	{ desc = "Show DAP Stacks" }
-- )
-- vim.keymap.set(
-- 	"n",
-- 	"<leader>db",
-- 	"<cmd>lua require'dapui'.float_element('breakpoints', { enter = true })<CR>",
-- 	{ desc = "Show DAP breakpoints" }
-- )

keymap.set("i", "<leader><leader>", "<cmd>lua vim.lsp.buf.completion()<CR>")

keymap.set("n", "<leader>qo", ":copen<CR>") -- open quickfix list
keymap.set("n", "<leader>qk", ":cfirst<CR>")
keymap.set("n", "<leader>ql", ":cnext<CR>")
keymap.set("n", "<leader>qh", ":cprev<CR>")
keymap.set("n", "<leader>qj", ":clast<CR>")
keymap.set("n", "<leader>qd", ":cclose<CR>")

keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
keymap.set("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to Left Window" })
keymap.set("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to Lower Window" })
keymap.set("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to Upper Window" })
keymap.set("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to Right Window" })

map("n", "U", "<C-r>", {})

map("n", "<C-q>", "", defaults)
--
-- Discovered it when using vim-forgit https://github.com/ray-x/forgit.nvim/issues/1
vim.opt.shellcmdflag = "-ic"

-- TODO: change the chars
-- vim.opt.listchars = "tab:>-,eol:$,nbsp:X,trail:#"
-- Map("n", "<leader>ul", ":set list!<cr>")

-- TODO: revert back to original position
-- map("n", "<leader>yG", ":keepjumps normal! ggyG<cr>", defaults)
-- map("n", "<leader>dG", ":keepjumps normal! ggdG", defaults)
--

-- keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
-- keymap.set("v", "J", ":m '>+1<CR>gv=gv", { siletn = true })
Map("v", "<", "<gv")
Map("v", ">", ">gv")

keymap.set("c", "<C-j>", 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true })
keymap.set("c", "<C-k>", 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true })

Map("n", "<C-d>", "<C-d>zz")
Map("n", "<C-u>", "<C-u>zz")

Map("n", "<leader>ut", ":TagbarToggle<CR>")

Map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
--
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
map("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })

local diagnostic_goto = function(next, severity)
	local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
	severity = severity and vim.diagnostic.severity[severity] or nil
	return function()
		go({ severity = severity })
	end
end

-- map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- highlights under cursor
map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })

vim.cmd("set whichwrap+=<,>,[,],h,l")

map({ "n", "x" }, "j", "v:count > 7 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count > 7 ? 'gk' : 'k'", { expr = true, silent = true })

-- vim.g.undotree_SetFocusWhenToggle = 0

-- vim.keymap.set("n", "gf", function()
-- 	if require("obsidian").util.cursor_on_markdown_link() then
-- 		return "<cmd>ObsidianFollowLink<CR>"
-- 	else
-- 		return "gf"
-- 	end
-- end, { noremap = false, expr = true })

keymap.set("n", "<leader>uc", "<cmd>ChatGPT<cr>")

vim.api.nvim_set_keymap(
	"n",
	"<leader>uw",
	"<cmd>lua local wrap_enabled = not vim.wo.wrap vim.wo.wrap = wrap_enabled<CR>",
	{ noremap = true, silent = true }
)

keymap.set("n", "j", "gj", { noremap = true })
keymap.set("n", "k", "gk", { noremap = true })
keymap.set("v", "j", "gj", { noremap = true })
keymap.set("v", "k", "gk", { noremap = true })

keymap.set("c", "<C-a>", "<Home>", { noremap = true })
keymap.set("c", "<C-p>", "<Up>", { noremap = true })
keymap.set("c", "<C-n>", "<Down>", { noremap = true })

keymap.set("n", "gV", "`[V`]", { noremap = true })
keymap.set("n", "gl", "`.zz", { noremap = true })

keymap.set("n", "<S-l>", ":bnext<cr>", { noremap = true })
keymap.set("n", "<S-h>", ":bprevious<cr>", { noremap = true })

keymap.set("n", "<leader><Enter>", "!!bash<CR>", { noremap = true })

keymap.set("n", ";", ":", { noremap = true })
keymap.set("n", ":", ";", { noremap = true })

-- keymap.set("n", "<leader>ss", ":setlocal spell! spelllang=en_us<CR>", { noremap = true })
-- keymap.set("n", "<leader>sn", "]s", { noremap = true })
-- keymap.set("n", "<leader>sp", "[s", { noremap = true })
-- keymap.set("n", "<leader>sa", "zg", { noremap = true })
-- keymap.set("n", "<leader>s?", "z=", { noremap = true })

vim.cmd("command! W execute 'w !sudo tee % > /dev/null' <bar> edit!")

vim.api.nvim_set_keymap("n", "<Esc>", ":nohls<CR>", { noremap = true, silent = true })

vim.opt.wildoptions = { "pum", "tagfile" }
vim.opt.wildignore:append({
	"*.docx",
	"*.jpg",
	"*.png",
	"*.gif",
	"*.pdf",
	"*.pyc",
	"*.flv",
	"*.img",
	"*.xlsx",
	"*~",
	"*.pyc",
	"*/.git/*",
	"*.o",
	"*.obj",
	"*.rbc",
	"__pycache__",
	"*swp",
	"*.class",
	"*.png",
	"*.zip",
	"*/tmp/*",
	"*.o",
	"*.obj",
	"*.so",
	"*\\tmp\\*",
	"*.exe",
})

keymap.set("n", "<leader>m", "mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm", { noremap = true })

vim.keymap.set("n", "<leader>rw", ":%s/\\<<c-r><c-w>\\>/")

vim.keymap.set("i", "<C-Y>", "<C-X><C-O>")

vim.keymap.set("n", "d,", "d$")
vim.keymap.set("n", "c,", "c$")
vim.keymap.set("n", "y,", "y$")
vim.keymap.set("x", ",", "$")

vim.keymap.set("n", "<leader>yF", function()
	local filename = vim.fn.expand("%")
	local lineno = vim.fn.line(".")
	vim.fn.setreg("+", filename .. ":" .. lineno)
end)

vim.keymap.set("n", "<leader>yf", function()
	local filename = vim.fn.expand("%")
	vim.fn.setreg("+", filename)
end)

vim.keymap.set("n", "<leader>8", ":%s/")
vim.keymap.set("n", "<leader>*", "yiw :%s/<C-r>0/")
vim.keymap.set("n", "<leader><leader>8", ":argdo %s/")
vim.keymap.set("n", "<leader><leader>*", "yiw :argdo %s/<C-r>0/")
vim.keymap.set("n", "<leader>.8", ":.s/")
vim.keymap.set("n", "<leader>.*", "yiw :.s/<C-r>0/")
vim.keymap.set("n", "<leader>b", ":w <CR> :!black % <CR>")

vim.keymap.set("n", "<leader>-", ":!")
vim.keymap.set("n", "<leader><leader>k", ":sp | hor resize 10 | term<CR> A")

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

vim.keymap.set(
	"n",
	"<leader>oc",
	"<cmd>lua require('obsidian').util.toggle_checkbox()<CR>",
	{ desc = "Obsidian Check Checkbox" }
)
vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianTemplate<CR>", { desc = "Insert Obsidian Template" })
vim.keymap.set("n", "<leader>oo", "<cmd>ObsidianOpen<CR>", { desc = "Open in Obsidian App" })
vim.keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<CR>", { desc = "Show ObsidianBacklinks" })
vim.keymap.set("n", "<leader>ol", "<cmd>ObsidianLinks<CR>", { desc = "Show ObsidianLinks" })
vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<CR>", { desc = "Create New Note" })
vim.keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<CR>", { desc = "Search Obsidian" })
vim.keymap.set("n", "<leader>oq", "<cmd>ObsidianQuickSwitch<CR>", { desc = "Quick Switch" })
--

vim.keymap.set("n", "<leader>so", function()
	vim.cmd("so")
end, { desc = "Source current file" })

vim.keymap.set("n", "<leader>mx", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make current file executable" })
--
vim.keymap.set("n", "G", "G$")
vim.keymap.set("v", "G", "G$")
vim.keymap.set("n", "gg", "gg0")
vim.keymap.set("v", "gg", "gg0")
vim.keymap.set("n", ",", "$")

keymap.set("n", "<leader>fe", "<cmd>Neotree toggle<cr>")
keymap.set("n", "<leader>vo", ":MaximizerToggle<CR>")
keymap.set("n", "<leader>gb", ":GitBlameToggle<CR>")
vim.api.nvim_set_keymap(
	"n",
	"<leader>ud",
	"<cmd>lua if vim.diagnostic.is_enabled() then vim.diagnostic.disable() else vim.diagnostic.enable() end<CR>",
	{ noremap = true, silent = true }
)
map("n", "<leader>uT", function()
	if vim.b.ts_highlight then
		vim.treesitter.stop()
	else
		vim.treesitter.start()
	end
end, { desc = "Toggle Treesitter Highlight" })
