return {
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

      -- stylua: ignore start
      map("n", "]h", gs.next_hunk, "Next Hunk")
      map("n", "[h", gs.prev_hunk, "Prev Hunk")
      map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
      map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
      map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
      map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
      map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
      map("n", "<leader>ghp", gs.preview_hunk_inline, "Preview Hunk Inline")
      map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
      map("n", "<leader>ghd", gs.diffthis, "Diff This")
      map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
		end,
	},
}

-- function M.gitgutter()
-- 	cmd([[
--         hi! link GitGutterAdd Constant
--         hi! link GitGutterChange Type
--         hi! link GitGutterDelete Identifier
--         hi! link GitGutterAddLineNr GitGutterAdd
--         hi! link GitGutterChangeLineNr GitGutterChange
--         hi! link GitGutterDeleteLineNr GitGutterDelete
--         hi! link GitGutterChangeDeleteLineNr GitGutterChangeDeleteLine
--         hi! link GitGutterAddIntraLine DiffText
--         hi! link GitGutterDeleteIntraLine DiffText
--     ]])
-- 	if g.colors_name == "one" then
-- 		cmd("hi! GitGutterChangeDeleteLine guifg=#be5046")
-- 	end
-- 	map("n", "<Leader>hp", "<Plug>(GitGutterPreviewHunk)", {})
-- 	map("n", "<Leader>hs", "<Plug>(GitGutterStageHunk)", {})
-- 	map("n", "<Leader>hu", "<Plug>(GitGutterUndoHunk)", {})
-- 	map("n", "[c", "<Plug>(GitGutterPrevHunk)", {})
-- 	map("n", "]c", "<Plug>(GitGutterNextHunk)", {})
-- 	map("o", "ih", "<Plug>(GitGutterTextObjectInnerPending)", {})
-- 	map("o", "ah", "<Plug>(GitGutterTextObjectOuterPending)", {})
-- 	map("x", "ih", "<Plug>(GitGutterTextObjectInnerVisual)", {})
-- 	map("x", "ah", "<Plug>(GitGutterTextObjectOuterVisual)", {})
-- end
