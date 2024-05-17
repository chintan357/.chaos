local is_inside_git_repo = function()
	local git_dir = vim.fn.finddir(".git", vim.fn.expand("%:p:h") .. ";")
	return vim.fn.isdirectory(git_dir) ~= 0
end

return {
	{ "tpope/vim-fugitive" },
	{ "tpope/vim-rhubarb" },
	{ "junegunn/gv.vim" },
	{
		"f-person/git-blame.nvim",
		event = "VeryLazy",
		opts = {
			enabled = false,
			date_format = "%m/%d/%y %H:%M:%S",
		},
	},
	{
		"akinsho/git-conflict.nvim",
		opts = {
			highlights = {
				incoming = "DiffAdd",
				current = "DiffText",
			},
		},
		lazy = not is_inside_git_repo(),
		keys = {
			-- Chose conflict
			-- { "", "<cmd>GitConflictChooseTheirs<cr>", desc = "Git Conflict Choose - Incoming changes" },
			-- { "", "<cmd>GitConflictChooseOurs<cr>", desc = "Git Conflict Choose - Current changes" },
			-- { "", "<cmd>GitConflictChooseBoth<cr>", desc = "Git Conflict Choose - Both changes" },
			-- Navigate conflicts
			-- { "", "<cmd>GitConflictListQf<cr>", desc = "Git Conflict Quicklist" },
			-- { "", "<cmd>GitConflictPrevConflict<cr>", desc = "Git Conflict Previous" },
			-- { "", "<cmd>GitConflictNextConflict<cr>", desc = "Git Conflict Next" },
		},
	},
	{
		"sindrets/diffview.nvim",
		lazy = not is_inside_git_repo(),
		cmd = "DiffviewOpen",
		keys = { { "gco", "<cmd>DiffviewOpen<cr>", desc = "Open Git Diff" } },
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		opts = {
			signs = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = "" },
				topdelete = { text = "" },
				changedelete = { text = "▎" },
				untracked = { text = "▎" },
			},
			on_attach = function(buffer)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
				end

				map("n", "]h", gs.next_hunk, "Next Hunk")
				map("n", "[h", gs.prev_hunk, "Prev Hunk")

				-- map({ "n", "v" }, "gh", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
				-- map({ "n", "v" }, "gH", ":Gitsigns reset_hunk<CR>", "Reset Hunk")

				map("n", "<leader>gS", gs.stage_buffer, "Stage Buffer")
				map("n", "<leader>gR", gs.reset_buffer, "Reset Buffer")
				map("n", "<leader>gU", gs.undo_stage_hunk, "Undo Stage Hunk")

				map("n", "gct", gs.diffthis, "Diff This")
			end,
		},
	},
}

-- -- fugitive
-- vim.keymap.set({ "n" }, "gw", function()
-- 	vim.cmd("Gwrite")
-- end)
-- vim.keymap.set({ "n" }, "gs", function()
-- 	vim.cmd("G status")
-- end)
-- vim.keymap.set({ "n" }, "gc", function()
-- 	vim.cmd("G commit -v")
-- end)
-- vim.keymap.set({ "n" }, "gp", function()
-- 	vim.cmd("G push")
-- end)
-- vim.keymap.set({ "n" }, "gfp", function()
-- 	vim.cmd("G push -f")
-- end)
-- vim.keymap.set({ "n" }, "gy", function()
-- 	vim.cmd("GBrowse!")
-- end)
-- vim.keymap.set({ "v" }, "gy", function()
-- 	vim.cmd("'<'>GBrowse!")
-- end)
