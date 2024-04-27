-- vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })vim.cmd([[ nnoremap <Space> <Nop> ]])

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.python3_host_prog = "/home/chintan357/.pyenv/versions/3.11.8/bin/python3.11"

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
require("core.keymaps2")
-- require("core.keymaps3")

require("lazy").setup("plugins", {
	change_detection = {
		enabled = true,
		notify = false, -- turn off notifications whenever plugin changes are made
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

vim.cmd([[
set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%4*\ %<%f%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=%5l/%*             "current line
set statusline +=%1*%v\ %*             "virtual column number
]])
-- See `:help vim.opt`
-- See `:help vim.keymap.set()`
--  For more options, you can see `:help option-list`
-- The line beneath this is called `modeline`. See `:help modeline`
