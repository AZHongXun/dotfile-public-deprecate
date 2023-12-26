return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"nvimdev/lspsaga.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local lspconfig = require("lspconfig")
		-- Set up completion using nvim_cmp with LSP source
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Diagnostic symbols in the sign column (gutter)
		local diagnostic_signs = require("util.icons").diagnostic_signs
		for type, icon in pairs(diagnostic_signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		local on_attach = require("util.lsp").on_attach

		-- Lsp Settings
		-- C/C++
		lspconfig.clangd.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			cmd = {
				"clangd",
				"--offset-encoding=utf-16",
				"--fallback-style=Google",
				"--completion-style=detailed",
				"--function-arg-placeholders",
			},
			init_options = { usePlaceholders = true },
		})
		--emmet-ls
		lspconfig.emmet_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "html", "css", "less", "scss", "sass", "vue" },
		})
		-- json
		lspconfig.jsonls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
		-- lua
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					diagnostic = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
		-- python
		lspconfig.pyright.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				python = {
					disableOrganizeImports = false,
					analysis = {
						autoImportCompletions = true,
						autoSearchPaths = true,
						diagnosticMode = "workspace",
						useLibraryCodeForTypes = true,
					},
				},
			},
		})
		-- tailwindcss
		lspconfig.tailwindcss.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = {
				"astro",
				"css",
				"html",
				"sass",
				"scss",
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
			},
		})
		-- typescript
		lspconfig.tsserver.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		-- 	underline = true,
		-- 	update_in_insert = false,
		-- 	virtual_text = { spacing = 4, prefix = "\u{ea71}" },
		-- 	severity_sort = true,
		-- })

		vim.diagnostic.config({
			virtual_text = {
				prefix = "●",
			},
			update_in_insert = false,
			float = {
				source = "always", -- Or "if_many"
			},
			severity_sort = true,
		})
	end,
}
