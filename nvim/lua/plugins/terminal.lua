-- toggleterm.nvim
return {
	"akinsho/toggleterm.nvim",
	version = "*",
	keys = [[<C-`>]],
	opts = {
		open_mapping = [[<C-`>]],
		size = 20,
		hide_numbers = true,
		shell = vim.o.shell,
		shade_terminals = false,
		persist_size = true,
		start_in_insert = true,
		direction = "float",
		close_on_exit = true,
		float_opts = { border = "curved" },
	},
}
