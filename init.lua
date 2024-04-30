vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.python3_host_prog = vim.fn.expand("~/.pyenv/versions/3.11.8/bin/python3.11")

vim.g.have_nerd_font = true

-- local opts = { noremap=true, silent=true }

--  See `:help lua-guide-autocommands`

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("core.keymaps")
require("core.options")
require("core.autocommands")

require("lazy").setup("plugins", {
	change_detection = {
		enabled = true,
		notify = false,
	},
})

-- "tpope/vim-sleuth",
-- require("lazy").setup({
-- Use `opts = {}` to force a plugin to be loaded.
--  This is equivalent to: require('Comment').setup({})
--
-- See `:help gitsigns` to understand what the configuration keys do
-- { -- Adds git related signs to the gutter, as well as utilities for managing changes
--   "lewis6991/gitsigns.nvim",
--   opts = {
--     signs = {
--       add = { text = "+" },
--       change = { text = "~" },
--       delete = { text = "_" },
--       topdelete = { text = "‾" },
--       changedelete = { text = "~" },
--     },
--   },
-- },

--       vim.cmd.hi 'Comment gui=none'

--
--  Here are some example plugins that I've included in the Kickstart repository.
--  Uncomment any of the lines below to enable them (you will need to restart nvim).
--
-- require 'kickstart.plugins.debug',
-- require 'kickstart.plugins.indent_line',
-- require 'kickstart.plugins.lint',
-- require 'kickstart.plugins.autopairs',
-- require 'kickstart.plugins.neo-tree',
-- require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps

--
--    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
-- { import = 'custom.plugins' },
-- }, {
--     ui = {
--       icons = vim.g.have_nerd_font and {},
--     },
--   })

local currentmode = {
	n = "N",
	v = "V",
	V = "VL",
	[""] = "VB",
	i = "I",
	R = "R",
	c = "C",
	["r?"] = "Confirm",
	t = "T",
}

BuildStatusline = function()
	local vim_mode = currentmode[vim.fn.mode()] or "?"
	local relative_path = vim.fn.expand("%:~:.")
	local parts = {
		-- "%n",
		"[",
		vim_mode,
		"]",
		" ",
		"%<", -- truncate here if too long
		relative_path, -- filename
		" ",
		"%h", -- help text indicator
		"%m",
		"%r",
		"%=", -- alignment break
		"%y",
		" ",
		"%P",
	}
	return table.concat(parts)
end
-- set statusline +=%4*\ %<%f%*            "full path
-- set statusline +=%1*%v\ %*             "virtual column number

vim.opt.statusline = "%!v:lua.BuildStatusline()"

-- See `:help vim.opt`
-- See `:help vim.keymap.set()`
--  For more options, you can see `:help option-list`
-- The line beneath this is called `modeline`. See `:help modeline`
