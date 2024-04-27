local opt = vim.opt

opt.updatetime = 250
opt.timeoutlen = 250
opt.inccommand = "split"

-- Session Management
-- opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Line Numbers
-- opt.relativenumber = true
-- opt.number = true

-- opt.tabstop = 2
-- opt.shiftwidth = 2
-- opt.expandtab = true
-- opt.autoindent = true
-- opt.softtabstop = 2
-- opt.autowrite = true
-- opt.cmdheight = 0

-- Line Wrapping
-- opt.wrap = false

-- Search Settings
-- opt.ignorecase = true
-- opt.smartcase = true

-- Cursor Line
-- opt.cursorline = true

-- Appearance
-- opt.termguicolors = true
-- opt.background = "dark"
-- opt.signcolumn = "yes"
vim.diagnostic.config({
	float = { border = "rounded" },
})

-- Backspace
-- opt.backspace = "indent,eol,start"

-- Clipboard
-- opt.clipboard:append("unnamedplus")

-- Split Windows
-- opt.splitright = true
-- opt.splitbelow = true

-- Consider - as part of keyword
opt.iskeyword:append("-")

-- Disable the mouse while in nvim
-- opt.mouse = ""

-- Folding
opt.foldlevel = 20
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()" -- Utilize Treesitter folds
--
opt.conceallevel = 1
-- opt.completeopt = "menu,menuone,noselect"
-- opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
-- opt.laststatus = 3 -- global statusline
-- opt.list = true -- Show some invisible characters (tabs...
-- opt.pumblend = 10 -- Popup blend
-- opt.pumheight = 10 -- Maximum number of entries in a popup
-- opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
-- opt.shiftround = true -- Round indent
-- opt.shiftwidth = 2 -- Size of an indent
-- opt.shortmess:append({ W = true, I = true, c = true, C = true })
-- opt.sidescrolloff = 8 -- Columns of context

-- opt.smartindent = true -- Insert indents automatically

-- opt.spelllang = { "en" }
-- opt.splitkeep = "screen"
-- opt.termguicolors = true -- True color support
--
-- opt.undofile = true
-- opt.undolevels = 10000

-- opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
-- opt.wildmode = "longest:full,full" -- Command-line completion mode
-- opt.winminwidth = 5 -- Minimum window width

-- opt.fillchars = {
--   foldopen = "",
--   foldclose = "",
--   fold = " ",
--   foldsep = " ",
--   diff = "╱",
--   eob = " ",
-- }

-- if vim.fn.has("nvim-0.10") == 1 then
-- 	opt.smoothscroll = true
-- end

-- Folding
-- vim.opt.foldlevel = 99

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
-- vim.g.markdown_recommended_style = 0
