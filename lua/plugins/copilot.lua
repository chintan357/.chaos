return {
	"github/copilot.vim",
	config = function()
		-- vim.g.copilot_no_tab_map = true
		vim.g.copilot_filetypes = { ["TelescopePrompt"] = false }
		vim.keymap.set("i", "<C-I>", 'copilot#Accept("\\<CR>")', {
			expr = true,
			replace_keycodes = false,
		})

		-- vim.keymap.set("i", "<C-L>", "<Plug>(copilot-accept-word)")
		--
		-- Set to true to assume that copilot is already mapped
		-- vim.g.copilot_assume_mapped = true

		-- Set workspace folders
		-- vim.g.copilot_workspace_folders = "~/Projects"

		local keymap = vim.keymap.set
		local opts = { silent = true }

		keymap("i", "<C-L>", "<Plug>(copilot-accept-line)", opts)

		keymap("i", "<M-]>", "<Plug>(copilot-next)", opts)
		keymap("i", "<M-[>", "<Plug>(copilot-previous)", opts)
		keymap("i", "<M-\\>", "<Plug>(copilot-suggest)", opts)
		keymap("i", "<C-]>", "<Plug>(copilot-dismiss)", opts)
	end,
}
