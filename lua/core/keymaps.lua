-- local builtin = require("telescope.builtin")
--
local keymap = vim.keymap
local map = vim.keymap.set
local set = vim.opt

local defaults = { noremap = true, silent = true }
local term_opts = { silent = true }

function Map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

-- map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
-- map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })
-- map("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
-- map("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })
-- keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
-- keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
-- keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
-- keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
--  See `:help wincmd` for a list of all window commands

keymap.set("n", "<leader>qq", ":q!<CR>") -- quit without saving
keymap.set("n", "<leader>Q", ":qa!<CR>") -- quit without saving

keymap.set("n", "gx", ":!open-cli <c-r><c-a><CR>") -- open URL under cursor

keymap.set("n", "<leader>s-", ":close<CR>")
keymap.set("n", "<leader>s=", "<C-w>=")
keymap.set("n", "<leader>ww", "<C-W>p")
keymap.set("n", "<leader>wd", "<C-W>c")
keymap.set("n", "<leader>_", "<c-w>s")
keymap.set("n", "<leader>|", "<C-W>v")

keymap.set("n", "<leader><tab>o", ":tabnew<CR>")
keymap.set("n", "<leader><tab>j", "<cmd>tablast<cr>")
keymap.set("n", "<leader><tab>k", "<cmd>tabfirst<cr>")
keymap.set("n", "<leader><tab>l", "<cmd>tabnext<cr>")
keymap.set("n", "<leader><tab>d", "<cmd>tabclose<cr>")
keymap.set("n", "<leader><tab>h", "<cmd>tabprevious<cr>")

-- Diff keymaps
keymap.set("n", "<leader>cc", ":diffput<CR>") -- put diff from current to other during diff
keymap.set("n", "<leader>ch", ":diffget 1<CR>") -- get diff from left (local) during merge
keymap.set("n", "<leader>cl", ":diffget 3<CR>") -- get diff from right (remote) during merge
keymap.set("n", "<leader>cn", "]c") -- next diff hunk
keymap.set("n", "<leader>cp", "[c") -- previous diff hunk

-- Vim-maximizer
keymap.set("n", "<leader>vo", ":MaximizerToggle<CR>")

-- Nvim-tree
keymap.set("n", "<M-o>", ":lua MiniFiles.open()<CR>", { noremap = true, silent = true })

-- Git-blame
keymap.set("n", "<leader>gb", ":GitBlameToggle<CR>") -- toggle git blame

-- Harpoon
keymap.set("n", "<leader>hp", function()
	require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
end)
keymap.set("n", "<leader>ha", function()
	require("harpoon"):list():add()
end)
keymap.set("n", "<leader>1", function()
	require("harpoon"):list():select(1)
end)
keymap.set("n", "<leader>2", function()
	require("harpoon"):list():select(2)
end)
keymap.set("n", "<leader>3", function()
	require("harpoon"):list():select(3)
end)
keymap.set("n", "<leader>4", function()
	require("harpoon"):list():select(4)
end)
keymap.set("n", "<C-S-P>", function()
	require("harpoon"):list():prev()
end)
keymap.set("n", "<C-S-N>", function()
	require("harpoon"):list():next()
end)

-- Vim REST Console
-- keymap.set("n", "<leader>xr", ":call VrcQuery()<CR>") -- Run REST query

-- LSP
-- keymap.set('n', '<leader>gf', '<cmd>lua vim.lsp.buf.format({async = true})<CR>')
-- keymap.set("v", "<leader>gf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>")
-- keymap.set('n', '<leader>gl', '<cmd>lua vim.diagnostic.open_float()<CR>')
-- keymap.set('n', '<leader>gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
-- keymap.set('n', '<leader>gn', '<cmd>lua vim.diagnostic.goto_next()<CR>')
-- keymap.set('n', '<leader>tr', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
-- keymap.set('i', '<C-Space>', '<cmd>lua vim.lsp.buf.completion()<CR>')

keymap.set("n", "<leader>go", function()
	if vim.bo.filetype == "python" then
		vim.api.nvim_command("PyrightOrganizeImports")
	end
end)

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

vim.api.nvim_set_keymap(
	"n",
	"<leader>ud",
	"<cmd>lua if vim.diagnostic.is_enabled() then vim.diagnostic.disable() else vim.diagnostic.enable() end<CR>",
	{ noremap = true, silent = true }
)

-- Debugging
keymap.set("n", "<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
keymap.set("n", "<leader>bc", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>")
keymap.set("n", "<leader>bl", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>")
keymap.set("n", "<leader>br", "<cmd>lua require'dap'.clear_breakpoints()<cr>")
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

-- keymap.set("n", "<leader>de", function()
-- 	require("telescope.builtin").diagnostics({ default_text = ":E:" })
-- end)

-- Quickfix keymaps
keymap.set("n", "<leader>qo", ":copen<CR>") -- open quickfix list
keymap.set("n", "<leader>qk", ":cfirst<CR>") -- jump to first quickfix list item
keymap.set("n", "<leader>ql", ":cnext<CR>") -- jump to next quickfix list item
keymap.set("n", "<leader>qh", ":cprev<CR>") -- jump to prev quickfix list item
keymap.set("n", "<leader>qj", ":clast<CR>") -- jump to last quickfix list item
keymap.set("n", "<leader>qd", ":cclose<CR>") -- close quickfix list

-- Trouble
vim.keymap.set("n", "<leader>tu", function()
	require("trouble").toggle()
end)
vim.keymap.set("n", "<leader>tw", function()
	require("trouble").toggle("workspace_diagnostics")
end)
vim.keymap.set("n", "<leader>td", function()
	require("trouble").toggle("document_diagnostics")
end)
vim.keymap.set("n", "<leader>tq", function()
	require("trouble").toggle("quickfix")
end)
vim.keymap.set("n", "<leader>tl", function()
	require("trouble").toggle("loclist")
end)
vim.keymap.set("n", "<leader>tr", function()
	require("trouble").toggle("lsp_references")
end)

-- local lazyterm = function() LazyVim.terminal(nil, { cwd = LazyVim.root() }) end
-- map("n", "<leader>ft", lazyterm, { desc = "Terminal (Root Dir)" })
-- map("n", "<leader>fT", function() LazyVim.terminal() end, { desc = "Terminal (cwd)" })
-- Terminal Mappings
-- map('n', '', ':ToggleTerm<CR>', { noremap = true })  -- open
keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
keymap.set("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to Left Window" })
keymap.set("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to Lower Window" })
keymap.set("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to Upper Window" })
keymap.set("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to Right Window" })
keymap.set("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
-- vim.keymap.set("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })

vim.api.nvim_set_keymap("n", "<C-w>", ":bd<CR>", { silent = true })

-- Insert empty line without entering insert mode
map("n", "<leader>go", ':<C-u>call append(line("."), repeat([""], v:count1))<CR>', defaults)
map("n", "<leader>gO", ':<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>', defaults)
--
--
-- map c and d to black hole registers ( could be done for visual mode too)
map("n", "d", '"_d', {})
map("n", "c", '"_c', {})
-- map('n', 'r', 'd', {})
--
map("n", "U", "<C-r>", {})

-- Unmap Ctrl + q
-- map("n", "<C-q>", "", defaults)
--
-- Discovered it when using vim-forgit
-- https://github.com/ray-x/forgit.nvim/issues/1
set.shellcmdflag = "-ic"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Remove trailing space
-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
-- 	pattern = { "*" },
-- 	command = [[%s/\s\+$//e]],
-- })

-- set.list = "tab:>-,eol:$,nbsp:X,trail:#"
-- map("v", "<leader>h", ":set list!<cr>")

map("n", "<leader>yG", ":keepjumps normal! ggyG<cr>", defaults)
map("n", "<leader>dG", ":keepjumps normal! ggdG", defaults)
--

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
--
keymap.set("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap.set("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
-- keymap("v", "<A-j>", ":m .+1<CR>==", opts)
-- keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)
keymap.set("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap.set("x", "K", ":move '<-2<CR>gv-gv", opts)
-- keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
--
keymap.set("c", "<C-j>", 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true })
keymap.set("c", "<C-k>", 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true })

Map("n", "<C-d>", "<C-d>zz")
Map("n", "<C-u>", "<C-u>zz")

map("n", "<leader>z", ":TagbarToggle<CR>") -- open/close
--
--
-- buffers
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
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
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")
--

--keywordprg
-- map("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })
--
-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
-- map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
-- map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
-- map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
-- map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
-- map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
-- map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
--
-- diagnostic
local diagnostic_goto = function(next, severity)
	local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
	severity = severity and vim.diagnostic.severity[severity] or nil
	return function()
		go({ severity = severity })
	end
end
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- tabs
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })

-- toggle options
map("n", "<leader>uT", function()
	if vim.b.ts_highlight then
		vim.treesitter.stop()
	else
		vim.treesitter.start()
	end
end, { desc = "Toggle Treesitter Highlight" })
--

-- highlights under cursor
map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })

vim.cmd("set whichwrap+=<,>,[,],h,l")

map({ "n", "x" }, "j", "v:count > 7 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count > 7 ? 'gk' : 'k'", { expr = true, silent = true })

--
-- auto add closing {, [, (, ', ", <
-- map('i', '{<cr>', '{<cr>}<ESC>kA<CR>', {})
-- closing_pairs = {'}', ')', ']', '"', "'", '>'}
-- opening_pairs = {'{', '(', '[', '"', "'", '<'}
-- for key, chr in pairs(opening_pairs)
-- do
--   map('i', chr, chr..closing_pairs[key]..'<esc>i', {})
-- end
--
vim.g.undotree_SetFocusWhenToggle = 0

-- Map("n", "n", "nzzzv")
-- what does zv does in above case?
-- Map("n", "N", "Nzzzv")
--
--
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
