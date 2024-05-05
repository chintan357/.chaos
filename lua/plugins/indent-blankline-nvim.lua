local exclude_filetypes = {
	"help",
	"dashboard",
	"neotree",
	"Trouble",
	"trouble",
	"lazy",
	"mason",
	"notify",
	"toggleterm",
}
return {
	{
		"echasnovski/mini.indentscope",
		version = "*",
		event = "VeryLazy",
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = exclude_filetypes,
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
		mapping = {
			-- Textobjects
			object_scope = "ii",
			object_scope_with_border = "ai",
			-- Motions (jump to respective border line; if not present - body line)
			goto_top = "[i",
			goto_bottom = "]i",
		},
		opts = {
			symbol = "▏",
			-- symbol = "│",
		},
	},
	{
		-- 	-- https://github.com/lukas-reineke/indent-blankline.nvim
		"lukas-reineke/indent-blankline.nvim",
		event = "VeryLazy",
		main = "ibl",
		opts = {
			enabled = true,
			indent = {
				char = "|",
			},
			exclude = {
				filetypes = exclude_filetypes,
			},
		},
	},
}
