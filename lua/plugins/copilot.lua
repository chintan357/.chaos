return {
	"github/copilot.vim",
	config = function()
		-- enable copilot for specific filetypes
		vim.g.copilot_filetypes = { ["TelescopePrompt"] = false }

		-- Set to true to assume that copilot is already mapped
		-- vim.g.copilot_assume_mapped = true

		-- Set workspace folders
		-- vim.g.copilot_workspace_folders = "~/Projects"

		local keymap = vim.keymap.set
		local opts = { silent = true }

		keymap("i", "<C-i>", "<Plug>(copilot-accept-line)", opts)

		keymap("i", "<C-l>", "<Plug>(copilot-next)", opts)
		keymap("i", "<C-h>", "<Plug>(copilot-previous)", opts)
		keymap("i", "<C-i>", "<Plug>(copilot-suggest)", opts)
		keymap("i", "<C-d>", "<Plug>(copilot-dismiss)", opts)
	end,
}
