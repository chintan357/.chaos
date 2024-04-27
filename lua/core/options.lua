local opt = vim.opt

opt.updatetime = 250
opt.timeoutlen = 250

opt.inccommand = "split"
opt.incsearch = true

opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

opt.relativenumber = true
opt.number = true

opt.history = 9999

opt.hidden = true
opt.ttyfast = true
opt.shell = "/bin/bash"
opt.viminfo:append({ "!" })

opt.langnoremap = false

opt.scrollbind = false
opt.cursorbind = false

opt.hlsearch = true

opt.autoread = true
opt.autowrite = true

opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.expandtab = true

-- set smarttab
opt.autoindent = true
opt.smartindent = true

opt.cmdheight = 0

opt.wrap = false

opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
vim.diagnostic.config({
	float = { border = "rounded" },
})

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")

opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

-- opt.mouse = ""
--
--
opt.conceallevel = 1
opt.linebreak = false
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 2
opt.confirm = true
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.laststatus = 3

-- opt.list = true -- Show some invisible characters (tabs...
opt.pumblend = 10
opt.pumheight = 10
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.shiftround = true
opt.shiftwidth = 2
opt.numberwidth = 2
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.sidescrolloff = 8 -- Columns of context

opt.spelllang = { "en" }
opt.splitkeep = "screen"
opt.termguicolors = true
--
opt.undofile = true
opt.undolevels = 10000

opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width

opt.modeline = true
opt.modelines = 1

opt.backup = false
opt.writebackup = false
opt.swapfile = false

opt.title = false
opt.showmode = false
opt.showcmd = true

-- opt.fillchars = {
--   foldopen = "",
--   foldclose = "",
--   fold = " ",
--   foldsep = " ",
--   diff = "╱",
--   eob = " ",
-- }

opt.smoothscroll = true

-- Folding
-- vim.opt.foldlevel = 99

-- Folding
opt.foldlevel = 20
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()" -- Utilize Treesitter folds
-- HACK: causes freezes on <= 0.9, so only enable on >= 0.10 for now
-- if vim.fn.has("nvim-0.10") == 1 then
-- 	vim.opt.foldmethod = "expr"
-- 	vim.opt.foldexpr = "v:lua.require'lazyvim.util'.ui.foldexpr()"
-- 	vim.opt.foldtext = ""
-- 	vim.opt.fillchars = "fold: "
-- else
-- 	vim.opt.foldmethod = "indent"
-- end

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

opt.showtabline = 0
