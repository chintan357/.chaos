return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {
		search = {
			exclude = {
				"MiniFiles",
				"notify",
				"cmp_menu",
				"noice",
				"flash_prompt",
				function(win)
					-- exclude non-focusable windows
					return not vim.api.nvim_win_get_config(win).focusable
				end,
			},
			mode = "exact",
		},
		modes = {
			search = {
				enabled = false,
			},
		},
	},
	keys = {
		{
			"?",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "Flash",
		},
		{
			"S",
			mode = { "n", "x", "o" },
			function()
				require("flash").treesitter()
			end,
			desc = "Flash Treesitter",
		},
		{
			"r",
			mode = "o",
			function()
				require("flash").remote()
			end,
			desc = "Remote Flash",
		},
		{
			"R",
			mode = { "o", "x" },
			function()
				require("flash").treesitter_search()
			end,
			desc = "Treesitter Search",
		},

		{
			"<leader>uf",
			mode = { "n" },
			function()
				require("flash").toggle()
			end,
			desc = "Toggle Flash Search",
		},
		-- { "<leader>uf", mode =  "n" ,"<cmd>lua require('flash').toggle()<cr>", desc = "Toggle Flash Search" },
	},
}
-- WARN:  When creating the keymaps manually either use a lua function like function() require("flash").jump() end as the rhs, or a string like <cmd>lua require("flash").jump()<cr>. DO NOT use :lua, since that will break dot-repeat
--
-- Flash Telescope config
-- {
-- 	"nvim-telescope/telescope.nvim",
-- 	optional = true,
-- 	opts = function(_, opts)
-- 		-- if not LazyVim.has("flash.nvim") then
-- 		--   return
-- 		-- end
-- 		local function flash(prompt_bufnr)
-- 			require("flash").jump({
-- 				pattern = "^",
-- 				label = { after = { 0, 0 } },
-- 				search = {
-- 					mode = "search",
-- 					exclude = {
-- 						function(win)
-- 							return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "TelescopeResults"
-- 						end,
-- 					},
-- 				},
-- 				action = function(match)
-- 					local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
-- 					picker:set_selection(match.pos[1] - 1)
-- 				end,
-- 			})
-- 		end
-- 		opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
-- 			mappings = { n = { s = flash }, i = { ["<c-s>"] = flash } },
-- 		})
-- 	end,
-- },
-- }
