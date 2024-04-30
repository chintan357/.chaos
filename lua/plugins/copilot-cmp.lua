return {
	"zbirenbaum/copilot-cmp",
	config = function()
		require("copilot_cmp").setup()
		local lspkind = require("lspkind")
		lspkind.init({
			symbol_map = {
				Copilot = "",
			},
		})
		vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
	end,
}
