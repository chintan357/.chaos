-- Auto-completion / Snippets
return {
	-- https://github.com/hrsh7th/nvim-cmp
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		-- Snippet engine & associated nvim-cmp source
		-- https://github.com/L3MON4D3/LuaSnip
		"L3MON4D3/LuaSnip",
		-- https://github.com/saadparwaiz1/cmp_luasnip
		"saadparwaiz1/cmp_luasnip",

		-- LSP completion capabilities
		-- https://github.com/hrsh7th/cmp-nvim-lsp
		"hrsh7th/cmp-nvim-lsp",

		-- Additional user-friendly snippets
		-- https://github.com/rafamadriz/friendly-snippets
		"rafamadriz/friendly-snippets",
		-- https://github.com/hrsh7th/cmp-buffer
		"hrsh7th/cmp-buffer",
		-- https://github.com/hrsh7th/cmp-path
		"hrsh7th/cmp-path",
		-- https://github.com/hrsh7th/cmp-cmdline
		"hrsh7th/cmp-cmdline",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		require("luasnip.loaders.from_vscode").lazy_load()
		luasnip.config.setup({})

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			mapping = cmp.mapping.preset.insert({
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-b>"] = cmp.mapping.scroll_docs(-4), -- scroll backward
				["<C-f>"] = cmp.mapping.scroll_docs(4), -- scroll forward
				["<C-a"] = cmp.mapping.complete({}), -- show completion suggestions
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
				-- Tab through suggestions or when a snippet is active, tab to the next argument
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				-- Tab backwards through suggestions or when a snippet is active, tab to the next argument
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = cmp.config.sources({
				{ name = "jupyter" },
				{ name = "nvim_lsp" }, -- lsp
				{ name = "luasnip" }, -- snippets
				{ name = "buffer" }, -- text within current buffer
				{ name = "path" }, -- file system paths
			}),
			-- window = {
			-- 	-- Add borders to completions popups
			-- 	completion = cmp.config.window.bordered(),
			-- 	documentation = cmp.config.window.bordered(),
			-- },
		})
	end,
}

-- { -- Autocompletion
--   "hrsh7th/nvim-cmp",
--   event = "InsertEnter",
--   dependencies = {
--     -- Snippet Engine & its associated nvim-cmp source
--     {
--       "L3MON4D3/LuaSnip",
--       build = (function()
--         -- Build Step is needed for regex support in snippets.
--         -- This step is not supported in many windows environments.
--         -- Remove the below condition to re-enable on windows.
--         if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
--           return
--         end
--         return "make install_jsregexp"
--       end)(),
--       dependencies = {
--         -- `friendly-snippets` contains a variety of premade snippets.
--         --    See the README about individual language/framework/plugin snippets:
--         --    https://github.com/rafamadriz/friendly-snippets
--         -- {
--         --   'rafamadriz/friendly-snippets',
--         --   config = function()
--         --     require('luasnip.loaders.from_vscode').lazy_load()
--         --   end,
--         -- },
--       },
--     },
--     "saadparwaiz1/cmp_luasnip",
--
--     -- Adds other completion capabilities.
--     --  nvim-cmp does not ship with all sources by default. They are split
--     --  into multiple repos for maintenance purposes.
--     "hrsh7th/cmp-nvim-lsp",
--     "hrsh7th/cmp-path",
--   },
--   config = function()
--     -- See `:help cmp`
--     local cmp = require("cmp")
--     local luasnip = require("luasnip")
--     luasnip.config.setup({})
--
--     cmp.setup({
--       snippet = {
--         expand = function(args)
--           luasnip.lsp_expand(args.body)
--         end,
--       },
--       completion = { completeopt = "menu,menuone,noinsert" },
--
--       -- For an understanding of why these mappings were
--       -- chosen, you will need to read `:help ins-completion`
--       --
--       -- No, but seriously. Please read `:help ins-completion`, it is really good!
--       mapping = cmp.mapping.preset.insert({
--         -- Select the [n]ext item
--         ["<C-n>"] = cmp.mapping.select_next_item(),
--         -- Select the [p]revious item
--         ["<C-p>"] = cmp.mapping.select_prev_item(),
--
--         -- Scroll the documentation window [b]ack / [f]orward
--         ["<C-b>"] = cmp.mapping.scroll_docs(-4),
--         ["<C-f>"] = cmp.mapping.scroll_docs(4),
--
--         -- Accept ([y]es) the completion.
--         --  This will auto-import if your LSP supports it.
--         --  This will expand snippets if the LSP sent a snippet.
--         ["<C-y>"] = cmp.mapping.confirm({ select = true }),
--
--         --['<CR>'] = cmp.mapping.confirm { select = true },
--         --['<Tab>'] = cmp.mapping.select_next_item(),
--         --['<S-Tab>'] = cmp.mapping.select_prev_item(),
--
--         -- ['<C-Space>'] = cmp.mapping.complete {},
--
--         -- Think of <c-l> as moving to the right of your snippet expansion.
--         --  So if you have a snippet that's like:
--         --  function $name($args)
--         --    $body
--         --  end
--         --
--         -- <c-l> will move you to the right of each of the expansion locations.
--         -- <c-h> is similar, except moving you backwards.
--         ["<C-l>"] = cmp.mapping(function()
--           if luasnip.expand_or_locally_jumpable() then
--             luasnip.expand_or_jump()
--           end
--         end, { "i", "s" }),
--         ["<C-h>"] = cmp.mapping(function()
--           if luasnip.locally_jumpable(-1) then
--             luasnip.jump(-1)
--           end
--         end, { "i", "s" }),
--
--         -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
--         --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
--       }),
--       sources = {
--         { name = "nvim_lsp" },
--         { name = "luasnip" },
--         { name = "path" },
--       },
--     })
--   end,
-- },
