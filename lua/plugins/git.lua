local is_inside_git_repo = function()
	local git_dir = vim.fn.finddir(".git", vim.fn.expand("%:p:h") .. ";")
	return vim.fn.isdirectory(git_dir) ~= 0
end

return {
	{ "tpope/vim-fugitive" },
	{ "tpope/vim-rhubarb" },
	{ "junegunn/gv.vim" },
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
			{ "<leader>hci", "<cmd>GitConflictChooseTheirs<cr>", desc = "Git Conflict Choose - Incoming changes" },
			{ "<leader>hcc", "<cmd>GitConflictChooseOurs<cr>", desc = "Git Conflict Choose - Current changes" },
			{ "<leader>hcb", "<cmd>GitConflictChooseBoth<cr>", desc = "Git Conflict Choose - Both changes" },
			-- Navigate conflicts
			{ "<leader>hcq", "<cmd>GitConflictListQf<cr>", desc = "Git Conflict Quicklist" },
			{ "<leader>hcp", "<cmd>GitConflictPrevConflict<cr>", desc = "Git Conflict Previous" },
			{ "<leader>hcn", "<cmd>GitConflictNextConflict<cr>", desc = "Git Conflict Next" },
		},
	},
	{
		"sindrets/diffview.nvim",
		lazy = not is_inside_git_repo(),
		cmd = "DiffviewOpen",
		keys = { { "<leader>gdv", "<cmd>DiffviewOpen<cr>", desc = "Open Git Diff" } },
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

				map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
				map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")

				map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
				map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
				map("n", "<leader>ghU", gs.undo_stage_hunk, "Undo Stage Hunk")

				map("n", "<leader>ghb", function()
					gs.blame_line({ full = true })
				end, "Blame Line")
				map("n", "<leader>ghd", gs.diffthis, "Diff This")
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
