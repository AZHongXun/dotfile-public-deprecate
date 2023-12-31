return {
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
		build = ":MasonUpdate",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = "williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				-- Lsp Server
				"astro",
				"clangd",
				"cssls",
				"emmet_ls",
				"jsonls",
				"lua_ls",
				"pyright",
				"tsserver",
				"tailwindcss",
				-- Formatter and Linter
				"prettierd",
				"eslintd",
				"stylua",
				"autopep8",
				"pylint",
				"isort",
				"clang-format",
			},
			automatic_install = true,
		},
	},
}
