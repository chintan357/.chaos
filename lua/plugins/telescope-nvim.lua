-- normal autocommands events (`:help autocmd-events`).
return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	lazy = true,
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	config = function()
		require("telescope").setup({
			defaults = {
				mappings = {
					i = { ["<c-t>"] = require("trouble.providers.telescope").open_with_trouble },
					n = { ["<c-t>"] = require("trouble.providers.telescope").open_with_trouble },
					--     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
				},
			},
			-- pickers = {}
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")

		local builtin = require("telescope.builtin")
		local keymap = vim.keymap

		keymap.set("n", "<leader>sh", builtin.help_tags)
		keymap.set("n", "<leader>sk", builtin.keymaps)

		keymap.set("n", "<leader>s:", builtin.command_history)
		keymap.set("n", '<leader>s"', builtin.registers)
		keymap.set("n", "<leader>sa", builtin.autocommands)
		keymap.set("n", "<leader>sm", builtin.marks)
		-- keymap.set("n", "<leader>so", builtin.options)

		keymap.set("n", "<leader>sf", builtin.find_files)
		keymap.set("n", "<leader>sr", builtin.oldfiles)

		keymap.set("n", "<leader>,", function()
			builtin.buffers({ sort_mru = true, sort_lastused = true })
		end)

		keymap.set("n", "<leader>hf", builtin.git_files)
		keymap.set("n", "<leader>hc", builtin.git_commits)
		keymap.set("n", "<leader>hs", builtin.git_status)
		--
		keymap.set("n", "<leader>sH", builtin.highlights)
		keymap.set("n", "<leader>sM", builtin.man_pages)

		keymap.set("n", "<leader>di", require("telescope.builtin").lsp_incoming_calls, {})

		keymap.set("n", "<leader>fm", function()
			require("telescope.builtin").treesitter({ default_text = ":method:" })
		end)

		keymap.set("n", "<leader>fw", builtin.grep_string)
		vim.keymap.set("n", "<leader>sg", builtin.live_grep)
		vim.keymap.set("n", "<leader>/", function()
			builtin.current_buffer_fuzzy_find(
				require("telescope.themes").get_dropdown({ winblend = 10, previewer = false })
			)
		end, { desc = "[/] Fuzzily search in current buffer" })

		keymap.set("n", "<leader>s/", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "[S]earch [/] in Open Files" })

		vim.keymap.set("n", "<leader>sc", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end)

		keymap.set("n", "<leader>sD", builtin.diagnostics)
		keymap.set("n", "<leader>ss", builtin.builtin)
		--
		-- keymap.set("v", "<leader>sw", builtin.grep_string())
		-- keymap.set("v", "<leader>sW", function()
		-- 	builtin.grep_string({ cwd = false })
		-- end)
		-- keymap.set("v", "<leader>sW", function()
		-- 	builtin.grep_string({ cwd = false })
		-- end)
		keymap.set("n", "<leader>sC", builtin.commands)
		keymap.set("n", "<leader>sR", builtin.resume)
		--
	end,
}
-- vim.keymap.set("n", "<leadrr>fR", function()
-- 	builtin.oldfiles({ cwd = vim.fn.getcwd() })
-- end)
-- vim.keymap.set("n", "<leader>sR", function()
-- 	builtin.oldfiles({ cwd = vim.fn.getcwd() })
-- end)
--
-- vim.keymap.set("n", "<leader>sS", function() builtin.lsp_dynamic_workspace_symbols { symbols = require("lazyvim.config").get_kind_filter() } end)
--  See `:help telescope.builtin.live_grep()` for information about particular keys
--  :Telescope help_tags
--  - Insert mode: <c-/>
--  - Normal mode: ?
-- See `:help telescope` and `:help telescope.setup()`
-- See `:help telescope.builtin`
