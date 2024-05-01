return {
	-- https://github.com/utilyre/barbecue.nvim
	"utilyre/barbecue.nvim",
	name = "barbecue",
	version = "*",
	dependencies = {
		-- https://github.com/SmiteshP/nvim-navic
		"SmiteshP/nvim-navic",
		-- https://github.com/nvim-tree/nvim-web-devicons
		"nvim-tree/nvim-web-devicons",
	},

	opts = {
		-- create_autocmd = false,
		-- show_dirname = false,
		-- show_basename = true,
		-- show_navic = true,
		-- exclude_filetypes = {""},
	},
	-- config = function(_, opts)
	-- 	vim.api.nvim_set_keymap(
	-- 		"n",
	-- 		"<leader>ub",
	-- 		':lua require("barbecue.ui").toggle()<CR>',
	-- 		{ noremap = true, silent = true }
	-- 	)
	-- 	vim.api.nvim_create_autocmd({
	-- 		"WinScrolled",
	-- 		"BufWinEnter",
	-- 		"CursorHold",
	-- 		"InsertLeave",
	-- 		"BufModifiedSet", -- include this if you have set `show_modified` to `true`
	-- 	}, {
	-- 		group = vim.api.nvim_create_augroup("barbecue.updater", {}),
	-- 		callback = function()
	-- 			require("barbecue.ui").update()
	-- 		end,
	-- 	})
	-- 	require("barbecue").setup(opts)
	-- end,
}

-- attach_navic = false, -- prevent barbecue from automatically attaching nvim-navic
-- require("lspconfig")[server].setup({
--   -- ...
--
--   on_attach = function(client, bufnr)
--     -- ...
--
--     if client.server_capabilities["documentSymbolProvider"] then
--       require("nvim-navic").attach(client, bufnr)
--     end
--
--     -- ...
--   end,
--
--   -- ...
-- })
