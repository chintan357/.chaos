return {
	-- https://github.com/neovim/nvim-lspconfig
	"neovim/nvim-lspconfig",
	event = "VeryLazy",
	dependencies = {
		-- https://github.com/williamboman/mason.nvim
		{ "williamboman/mason.nvim", config = true },
		-- https://github.com/williamboman/mason-lspconfig.nvim
		{ "williamboman/mason-lspconfig.nvim" },
		-- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
		{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
		-- Useful status updates for LSP https://github.com/j-hui/fidget.nvim
		{ "j-hui/fidget.nvim", opts = {} },
		-- Additional lua configuration, makes nvim stuff amazing! https://github.com/folke/neodev.nvim
		{ "folke/neodev.nvim" },
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
				map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
				map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
				map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
				map("<leader>ltd", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
				map("<leader>lds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
				map("<leader>lws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
				map("<leader>lrn", vim.lsp.buf.rename, "[R]e[n]ame")
				map("<leader>lca", vim.lsp.buf.code_action, "[C]ode [A]ction")
				map("K", vim.lsp.buf.hover, "Hover Documentation")

				local client = vim.lsp.get_client_by_id(event.data.client_id)
				-- if client and client.server_capabilities.documentHighlightProvider then
				-- 	local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
				-- 	vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				-- 		buffer = event.buf,
				-- 		group = highlight_augroup,
				-- 		callback = vim.lsp.buf.document_highlight,
				-- 	})
				--
				-- 	vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				-- 		buffer = event.buf,
				-- 		group = highlight_augroup,
				-- 		callback = vim.lsp.buf.clear_references,
				-- 	})
				-- end

				if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
					map("<leader>th", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
					end, "[T]oggle Inlay [H]ints")
				end
			end,
		})

		vim.api.nvim_create_autocmd("LspDetach", {
			group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
			callback = function(event)
				vim.lsp.buf.clear_references()
				vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event.buf })
			end,
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		local servers = {
			lua_ls = {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			},
			-- clangd = {},
			-- gopls = {},
			-- pyright = {},
			-- rust_analyzer = {},
			-- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
			--
			-- Some languages (like typescript) have entire language plugins that can be useful:
			--    https://github.com/pmizio/typescript-tools.nvim
			--
			-- But for many setups, the LSP (`tsserver`) will work just fine
			-- tsserver = {},
			--
		}
		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			"lua_ls",
			"bashls",
			"cssls",
			"lua_ls",
			"html",
			"jsonls",
			"marksman",
			"yamlls",
			"pyright",
			"stylua",
		})

		require("mason").setup()

		require("mason-tool-installer").setup({
			ensure_installed = {
				"black",
				"debugpy",
				"flake8",
				"isort",
				"mypy",
				"pylint",
				"prettier",
				"prettierd",
				"eslint_d",
				"beautysh",
				"buf",
				"yamlfix",
				"taplo",
				"shellcheck",
			},
		})

		vim.api.nvim_command("MasonToolsInstall")

		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					-- This handles overriding only values explicitly passed
					-- by the server configuration above. Useful when disabling
					-- certain features of an LSP (for example, turning off formatting for tsserver)
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
		--        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
		-- Globally configure all LSP floating preview popups (like hover, signature help, etc)
		local open_floating_preview = vim.lsp.util.open_floating_preview
		function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
			opts = opts or {}
			opts.border = opts.border or "rounded" -- Set border to rounded
			return open_floating_preview(contents, syntax, opts, ...)
		end
	end,
}
-- There is an issue with mason-tools-installer running with VeryLazy, since it triggers on VimEnter which has already occurred prior to this plugin loading so we need to call install explicitly
-- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim/issues/39

-- Call setup on each LSP server
-- require("mason-lspconfig").setup_handlers({
--   function(server_name)
--     lspconfig[server_name].setup({
--       on_attach = lsp_attach,
--       capabilities = lsp_capabilities,
--     })
--   end,
-- })

-- Lua LSP settings
--
--     -- and elegantly composed help section, `:help lsp-vs-treesitter`
--         --  See `:help K` for why this keymap.
--
--     local capabilities = vim.lsp.protocol.make_client_capabilities()
--     capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
--
--     --  Add any additional override configuration in the following tables. Available keys are:
--     --  - cmd (table): Override the default command used to start the server
--     --  - filetypes (table): Override the default list of associated filetypes for the server
--     --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
--     --  - settings (table): Override the default settings passed when initializing the server.
--     --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
--
-- local map = function(keys, func, desc)
-- 	vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
-- end
--
-- vim.keymap.set("n", "<leader>sd", builtin.diagnostics { bufnr = 0 })
--     -- and elegantly composed help section, `:help lsp-vs-treesitter`
--  See `:help K` for why this keymap.
-- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
-- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
