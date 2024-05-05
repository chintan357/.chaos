local opt = vim.opt

opt.relativenumber = true
opt.number = true

opt.timeout = true
opt.timeoutlen = 423
opt.ttimeout = true
opt.timeoutlen = 500
opt.updatetime = 100
opt.ttimeoutlen = 10

opt.history = 9999

opt.inccommand = "split"
opt.incsearch = true
opt.hlsearch = true

opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

opt.hidden = true
opt.ttyfast = true
opt.shell = "/bin/bash"
opt.viminfo:append({ "!" })
opt.langnoremap = false

opt.autoread = true
opt.autowrite = true

opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.expandtab = true

opt.ignorecase = true
opt.smartcase = true

opt.autoindent = true
opt.smartindent = true
opt.smarttab = true

opt.cmdheight = 0
opt.cmdwinheight = 1
opt.colorcolumn = "80"

opt.wrap = false

opt.scrollbind = false
opt.cursorbind = false
opt.cursorline = true

opt.ruler = false
opt.textwidth = 79

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.conceallevel = 2
opt.linebreak = false

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")

opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")
opt.confirm = true

opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
vim.o.errorformat = vim.o.errorformat .. ",%f:%l"
opt.grepprg = "rg --vimgrep"
-- vim.opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"
-- opt.grepprg = "rg --vimgrep --no-heading"

opt.completeopt = "menu,menuone,noselect"
opt.pumblend = 10
opt.pumheight = 10

opt.shiftround = true
opt.numberwidth = 2

opt.shortmess:append({ W = true, I = true, c = true, C = true })

opt.sidescrolloff = 3
opt.scrolloff = 10

-- opt.spelllang = { "en" }
opt.splitkeep = "screen"

opt.undofile = true
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.undolevels = 1000
opt.undoreload = 10000

opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = "longest:full,full"

opt.modeline = false
-- opt.modelines = 1

opt.backup = false
opt.writebackup = false
opt.swapfile = false

opt.title = false
opt.showmode = false
opt.showtabline = 0
opt.laststatus = 3

opt.smoothscroll = true

-- vim.opt.foldlevel = 99
opt.foldlevel = 20
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.cmd([[ set guicursor=n-v-c-i:block ]])

-- vim.g.markdown_recommended_style = 0
-- vim.opt.isfname:append("@-@")

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

--------------------------

opt.magic = true
opt.wildignorecase = true

opt.redrawtime = 1500
opt.infercase = true

-- if vim.fn.executable("rg") == 1 then
-- 	opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"
-- 	opt.grepprg = "rg --vimgrep --no-heading --smart-case"
-- end

-- opt.shortmess = "aoOTIcF"
-- opt.foldlevelstart = 99
opt.winwidth = 30
opt.showcmd = false

--eol:¬
opt.winblend = 0
-- opt.spelloptions = "camel"

-- local function get_signs(name)
-- 	return function()
-- 		local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
-- 		local it = vim.iter(api.nvim_buf_get_extmarks(bufnr, -1, 0, -1, { details = true, type = "sign" }))
-- 			:find(function(item)
-- 				return item[2] == vim.v.lnum - 1 and item[4].sign_hl_group and item[4].sign_hl_group:find(name)
-- 			end)
-- 		return not it and "  " or "%#" .. it[4].sign_hl_group .. "#" .. it[4].sign_text .. "%*"
-- 	end
-- end
--
-- function _G.show_stc()
-- 	local stc_diagnostic = get_signs("Diagnostic")
-- 	local stc_gitsign = get_signs("GitSign")
--
-- 	local function show_break()
-- 		if vim.v.virtnum > 0 then
-- 			return (" "):rep(math.floor(math.ceil(math.log10(vim.v.lnum))) - 1) .. "↳"
-- 		elseif vim.v.virtnum < 0 then
-- 			return ""
-- 		else
-- 			return vim.v.lnum
-- 		end
-- 	end
-- 	return stc_diagnostic() .. "%=" .. show_break() .. stc_gitsign()
-- end
--
-- vim.opt.stc = "%!v:lua.show_stc()"
