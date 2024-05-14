function Map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

Map("n", "<leader>q", ":bd<CR>")
Map("n", "<leader>Q", ":q!<CR>")
-- Map("n", "<leader>qQ", ":qa!<CR>")

Map("n", "gx", ":!open <c-r><c-a><CR>")

Map("n", "<leader>_", "<c-w>s")
Map("n", "<leader>|", "<C-W>v")
Map("n", "<leader>ww", "<C-W>w")
Map("n", "<leader>wd", "<C-W>c")
Map("n", "<leader>s-", ":close<CR>")
Map("n", "<leader>s=", "<C-w>=")

Map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

Map("n", "<leader><tab>o", ":tabnew<CR>")
Map("n", "<leader><tab>l", "<cmd>tabnext<cr>")
Map("n", "<leader><tab>h", "<cmd>tabprevious<cr>")
Map("n", "<leader><tab>d", "<cmd>tabclose<cr>")

Map("n", "==", "gg<S-v>G")
Map("n", "J", "mzJ`z")

Map("n", "<leader>cp", ":diffput<CR>") -- put diff from current to other during diff
Map("n", "<leader>ch", ":diffget 1<CR>") -- get diff from left (local) during merge
Map("n", "<leader>cl", ":diffget 3<CR>") -- get diff from right (remote) during merge

Map("n", "<M-o>", function()
	require("oil").toggle_float()
end)
Map("n", "<leader>qo", ":copen<CR>")

local opts = { buffer = 0 }
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)

vim.keymap.set("c", "<C-a>", "<Home>")
vim.keymap.set("c", "<C-p>", "<Up>")
vim.keymap.set("c", "<C-n>", "<Down>")

Map("n", "U", "<C-r>", {})

Map("v", "K", ":m '<-2<CR>gv=gv")
Map("v", "J", ":m '>+1<CR>gv=gv")

Map("v", "<", "<gv")
Map("v", ">", ">gv")

Map("n", "<C-d>", "<C-d>zz")
Map("n", "<C-u>", "<C-u>zz")

-- Map("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })

local diagnostic_goto = function(next, severity)
	local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
	severity = severity and vim.diagnostic.severity[severity] or nil
	return function()
		go({ severity = severity })
	end
end
Map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
-- [e is also mapped inside vim-unimpaired
Map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
Map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
Map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })
Map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })

vim.cmd("set whichwrap+=<,>,[,],h,l")

Map("n", "gV", "`[V`]")
Map("n", "gl", "`.zz")

Map("n", "<S-l>", ":bnext<cr>")
Map("n", "<S-h>", ":bprevious<cr>")

Map("n", "<leader><Enter>", "!!bash<CR>")

vim.keymap.set("n", ";", ":", { noremap = true })
vim.keymap.set("n", ":", ";", { noremap = true })

vim.cmd("command! W execute 'w !sudo tee % > /dev/null' <bar> edit!")

Map("n", "<Esc>", ":nohls<CR>")

Map("n", "<leader>M", "mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm")

Map("n", "<leader>8", ":%s/")
Map("n", "<leader>*", "yiw :%s/<C-r>0/")
Map("n", "<leader>c8", ":.s/")
Map("n", "<leader>c*", "yiw :.s/<C-r>0/")
-- Map("n", "<leader>rw", ":%s/\\<<c-r><c-w>\\>/")
-- Map("n", "<leader><leader>8", ":argdo %s/")
-- Map("n", "<leader><leader>*", "yiw :argdo %s/<C-r>0/")

Map("n", "<leader>-", ":!")
Map("n", "<leader><leader>k", ":sp | hor resize 10 | term<CR> A")

Map("n", "<leader>so", function()
	vim.cmd("so")
end, { desc = "Source current file" })

Map("n", "<leader>mx", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make current file executable" })

Map({ "n", "v" }, "gg", "gg0")
Map({ "n", "v" }, "G", "G$")
Map("n", "d,", "d$")
Map("n", "c,", "c$")
Map("n", "y,", "y$")
Map({ "x", "v" }, ",", "$")

-- stylua: ignore start
Map("n", "<leader>fe", "<cmd>Neotree toggle<cr>")
Map("n", "<leader>vo", ":MaximizerToggle<CR>")
Map("n", "<leader>gb", ":GitBlameToggle<CR>")

Map("n", "<leader>uc", "<cmd>ChatGPT<cr>")
Map("n", "<leader>uC", function() require("CopilotChat").toggle() end)

Map( "n", "yod", "<cmd>lua if vim.diagnostic.is_enabled() then vim.diagnostic.disable() else vim.diagnostic.enable() end<CR>")
Map("n", "yot", ":TagbarToggle<CR>")
Map("n", "yoT", function() if vim.b.ts_highlight then vim.treesitter.stop() else vim.treesitter.start() end end, { desc = "Toggle Treesitter Highlight" })

Map("n", "<leader>yF", function() local filename = vim.fn.expand("%") local lineno = vim.fn.line(".") vim.fn.setreg("+", filename .. ":" .. lineno) end)
Map("n", "<leader>yf", function() local filename = vim.fn.expand("%") vim.fn.setreg("+", filename) end)

Map("i", "<C-S-Space>", "<cmd>lua vim.lsp.buf.completion()<CR>")
Map("i", "<C-Y>", "<C-X><C-O>")

Map("n", "N", [[v:searchforward ? 'Nzz' : 'nzz']], { expr = true })
Map("n", "n", [[v:searchforward ? 'nzz' : 'Nzz']], { expr = true })

-- keymap.set("n", "<leader>ss", ":setlocal spell! spelllang=en_us<CR>", { noremap = true })
-- keymap.set("n", "<leader>sn", "]s", { noremap = true })
-- keymap.set("n", "<leader>sp", "[s", { noremap = true })
-- keymap.set("n", "<leader>sa", "zg", { noremap = true })
-- keymap.set("n", "<leader>s?", "z=", { noremap = true })
--
-- Map("n", "<leader>oc", "<cmd>lua require('obsidian').util.toggle_checkbox()<CR>", { desc = "Obsidian Check Checkbox" })
-- Map("n", "<leader>ot", "<cmd>ObsidianTemplate<CR>", { desc = "Insert Obsidian Template" })
-- Map("n", "<leader>oo", "<cmd>ObsidianOpen<CR>", { desc = "Open in Obsidian App" })
-- Map("n", "<leader>ob", "<cmd>ObsidianBacklinks<CR>", { desc = "Show ObsidianBacklinks" })
-- Map("n", "<leader>ol", "<cmd>ObsidianLinks<CR>", { desc = "Show ObsidianLinks" })
-- Map("n", "<leader>on", "<cmd>ObsidianNew<CR>", { desc = "Create New Note" })
-- Map("n", "<leader>os", "<cmd>ObsidianSearch<CR>", { desc = "Search Obsidian" })
-- Map("n", "<leader>oq", "<cmd>ObsidianQuickSwitch<CR>", { desc = "Quick Switch" })
-- Map("n", "gf", function()
-- 	if require("obsidian").util.cursor_on_markdown_link() then
-- 		return "<cmd>ObsidianFollowLink<CR>"
-- 	else
-- 		return "gf"
-- 	end
-- end, { noremap = false, expr = true })
--
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
-- Discovered it when using vim-forgit https://github.com/ray-x/forgit.nvim/issues/1
-- vim.opt.shellcmdflag = "-ic"

-- Map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
-- vim.g.undotree_SetFocusWhenToggle = 0
--

function _G.map(mapping, opts)
    vim.keymap.set(
        mapping[1],
        mapping[2],
        mapping[3],
        vim.tbl_extend('keep', opts or {}, { silent = true })
    )
end

-- function _G.bmap(mapping, opts)
--     _G.map(mapping, vim.tbl_extend('force', opts or {}, { buffer = 0 }))
-- end

map({
    'n',
    'gx',
    function()
        local url = vim.fn.expand('<cfile>', nil)

        if not url:match('https') and url:match('/') then
            url = 'https://github.com/' .. url
        end

        vim.fn.jobstart({ vim.env.BROWSER, url })
    end,
})

-- map({
--     'n',
--     '<leader>r',
--     function()
--         vim.cmd('sil !mux file %')
--     end,
-- })

-- map({ 'x', 'p', '"_dp' })
-- map({ 'x', 'P', '"_dP' })

-- for key, keymap in pairs({ b = 'b', q = 'c', l = 'l' }) do
--     map({ 'n', ('[%s'):format(key), ('<cmd>%sprev<cr>'):format(keymap) })
--     map({ 'n', (']%s'):format(key), ('<cmd>%snext<cr>'):format(keymap) })
-- end
