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
		"debugloop/telescope-undo.nvim",
	},
	config = function()
		local actions = require("telescope.actions")
		local action_layout = require("telescope.actions.layout")
		local builtin = require("telescope.builtin")
		local keymap = vim.keymap

		local vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--trim",
		}

		table.insert(vimgrep_arguments, "--hidden")
		table.insert(vimgrep_arguments, "--glob")
		table.insert(vimgrep_arguments, "!**/.git/*")

		require("telescope").setup({
			defaults = {
				prompt_prefix = "  ",
				-- selection_strategy = "reset",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						preview_width = 0.55,
						results_width = 0.8,
					},
					vertical = {
						mirror = false,
					},
					width = 0.87,
					height = 0.80,
					preview_cutoff = 120,
				},
				path_display = { "truncate" },
				vimgrep_arguments = vimgrep_arguments,
				mappings = {
					i = {
						["<c-t>"] = require("trouble.providers.telescope").open_with_trouble,
						["<c-d>"] = actions.delete_buffer + actions.move_to_top,
						["<C-u>"] = false,
						["<M-p>"] = action_layout.toggle_preview,
						["<C-s>"] = actions.cycle_previewers_next,
						["<C-a>"] = actions.cycle_previewers_prev,
						-- ['<c-enter>'] = 'to_fuzzy_refine',
					},
					n = {
						["<c-t>"] = require("trouble.providers.telescope").open_with_trouble,
						["q"] = actions.close,
						["<M-p>"] = action_layout.toggle_preview,
					},
				},
			},
			pickers = {
				find_files = {
					find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
				},
				mappings = {
					n = {
						["cd"] = function(prompt_bufnr)
							local selection = require("telescope.actions.state").get_selected_entry()
							local dir = vim.fn.fnamemodify(selection.path, ":p:h")
							require("telescope.actions").close(prompt_bufnr)
							-- Depending on what you want put `cd`, `lcd`, `tcd`
							vim.cmd(string.format("silent lcd %s", dir))
						end,
					},
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
				undo = {
					use_delta = true,
					side_by_side = false,
				},
			},
		})

		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")

		require("telescope").load_extension("undo")
		vim.keymap.set("n", "<leader>tu", "<cmd>Telescope undo<cr>")


		-- stylua: ignore start
		keymap.set("n", "<leader>sh", builtin.help_tags)
		keymap.set("n", "<leader>sk", builtin.keymaps)

		keymap.set("n", "<leader>s:", builtin.command_history)
		keymap.set("n", '<leader>s"', builtin.registers)
		keymap.set("n", "<leader>sa", builtin.autocommands)
		keymap.set("n", "<leader>sm", builtin.marks)
		keymap.set("n", "<leader>sq", builtin.quickfix)

		keymap.set("n", "<leader>sf", builtin.find_files)
		keymap.set("n", "<leader>sr", builtin.oldfiles)
		keymap.set("n", "<leader>sc", function() builtin.find_files({ cwd = vim.fn.stdpath("config") }) end)

		keymap.set("n", "<leader>sb", function() builtin.buffers({ sort_mru = true, sort_lastused = true }) end)

		keymap.set("n", "<leader>hf", builtin.git_files)
		keymap.set("n", "<leader>hc", builtin.git_commits)
		keymap.set("n", "<leader>hs", builtin.git_status)

		keymap.set("n", "<leader>sH", builtin.highlights)
		keymap.set("n", "<leader>sM", builtin.man_pages)
		keymap.set("n", "<leader>sC", builtin.commands)

		keymap.set("n", "<leader>ic", require("telescope.builtin").lsp_incoming_calls)
		keymap.set("n", "<leader>oc", require("telescope.builtin").lsp_outgoing_calls)
		keymap.set("n", "<leader>re", require("telescope.builtin").lsp_references)
		keymap.set("n", "<leader>sd", function() builtin.diagnostics({ bufnr = 0 }) end)
		keymap.set("n", "<leader>sD", require("telescope.builtin").diagnostics)

		-- keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics({ bufnr = 0 }))
		-- keymap.set("n", "<leader>td", require("telescope.builtin").lsp_type_definitions)
		-- keymap.set("n", "<leader>td", require("telescope.builtin").lsp_implementations)
		-- keymap.set("n", "<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols)
		-- keymap.set("n", "<leader>df", require("telescope.builtin").lsp_definitions)
		-- builtin.git_commits
		-- builtin.git_bcommits
		-- builtin.git_bcommits_range
		-- builtin.git_branche
		-- builtin.git_status
		-- builtin.git_stash
		-- builtin.vimoptions

		keymap.set("n", "<leader>tt", require("telescope.builtin").treesitter)
		keymap.set("n", "<leader>fm", function() require("telescope.builtin").treesitter({ default_text = ":method:" }) end)

		keymap.set("n", "<leader>fw", builtin.grep_string)
		keymap.set("v", "<leader>fw", function() builtin.grep_string({ cwd = false }) end)

		keymap.set("n", "<leader>sg", builtin.live_grep)
		keymap.set("n", "<leader>/", function()
			builtin.current_buffer_fuzzy_find(
				require("telescope.themes").get_dropdown({ winblend = 10, previewer = false })
			)
		end)

		keymap.set("n", "<leader>s/", function() builtin.live_grep({ grep_open_files = true, prompt_title = "Live Grep in Open Files" }) end, { desc = "[S]earch [/] in Open Files" })
		keymap.set("n", "<leader>sF", function() builtin.find_files({ cwd = vim.fn.expand("~") }) end)
		keymap.set("n", "<leader>tb", builtin.builtin)
	end,
}
