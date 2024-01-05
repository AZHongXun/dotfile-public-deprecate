return {
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter" },
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			build = "make install_jsregexp",
			dependencies = {
				"rafamadriz/friendly-snippets",
				config = function()
					require("luasnip.loaders.from_vscode").lazy_load()
				end,
			},
			opts = {
				history = true,
				delete_check_events = "TextChanged",
			},
		},
		-- Add icon
		{
			"onsails/lspkind-nvim",
			config = function()
				local icons = require("util.icons").kinds
				require("lspkind").init({
					mode = "symbol",
					preset = "codicons",
					symbol_map = icons,
				})
			end,
		},
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
		"windwp/nvim-autopairs",
	},
	opts = function()
		vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
		local cmp = require("cmp")
		local lspkind = require("lspkind")
		local luasnip = require("luasnip")
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local defaults = require("cmp.config.default")()
		local has_words_before = function()
			unpack = unpack or table.unpack
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end
		return {
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
				["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
				["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
				["<C-e>"] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }),
				-- Accept currently selected item. If none selected, `select` first item.
				-- Set `select` to `false` to only confirm explicitly selected items.
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<S-CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
				-- Super-Tab like mapping
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),

				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),
			formatting = {
				field = { "abbr", "kind", "menu" },
				format = lspkind.cmp_format({
					maxwidth = 25,
					ellipsis_char = "...",
					before = function(_, vim_item)
						vim_item.menu = nil
						return vim_item
					end,
				}),
			},
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			experimental = { ghost_text = { hl_group = "CmpGhostText" } },
			sorting = defaults.sorting,
			view = { entries = { name = "custom", selection_order = "near_cursor" } },
			-- nvim-autopairs integration
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done()),
			vim.cmd([[highlight! default link CmpItemKind CmpItemMenuDefault]]),
		}
	end,
	---@param opts cmp.ConfigSchema
	config = function(_, opts)
		for _, source in ipairs(opts.sources) do
			source.group_index = source.group_index or 1
		end
		require("cmp").setup(opts)
	end,
}
