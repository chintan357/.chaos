local opt = vim.opt

opt.updatetime = 250
opt.timeoutlen = 300

opt.inccommand = "split"
opt.incsearch = true
opt.hlsearch = true

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
opt.ruler = true
opt.textwidth = 79

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")

opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

opt.conceallevel = 2
opt.linebreak = false
opt.completeopt = "menu,menuone,noselect"
opt.confirm = true
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.laststatus = 3

opt.pumblend = 10
opt.pumheight = 10
opt.shiftround = true
opt.numberwidth = 2
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.sidescrolloff = 3
opt.scrolloff = 10

opt.spelllang = { "en" }
opt.splitkeep = "screen"

opt.undofile = true
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.undolevels = 1000
opt.undoreload = 10000

vim.opt.cmdwinheight = 1
vim.opt.colorcolumn = "80"

opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = "longest:full,full"

opt.modeline = false
-- opt.modelines = 1

opt.backup = false
opt.writebackup = false
opt.swapfile = false

opt.title = false
opt.showmode = false

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
opt.foldlevel = 20
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

-- vim.g.markdown_recommended_style = 0

opt.showtabline = 0

vim.cmd([[

set guicursor=n-v-c-i:block

]])
