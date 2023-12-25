return {
	"nvimdev/lspsaga.nvim",
	event = "LspAttach",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("lspsaga").setup({
			ui = {
				winblend = 10,
				border = "rounded",
				colors = {
					normal_bg = "#002b36",
				},
			},
			lightbulb = {
				enable = false,
			},
			symbol_in_winbar = {
				enable = false,
			},
		})
	end,
}
