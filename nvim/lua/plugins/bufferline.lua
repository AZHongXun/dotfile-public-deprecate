return {
	"akinsho/bufferline.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	event = "VeryLazy",
	keys = {
		{ "<TAB>", "<cmd>BufferLineCycleNext<cr>", { silence = true, noremap = true } },
		{ "<S-TAB>", "<cmd>BufferLineCyclePrev<cr>", { silence = true, noremap = true } },
		{ "<leader>q", "<cmd>bdelete<cr>", { silence = true, noremap = true } },
	},
	opts = function()
		return {
			options = {
				mode = "tabs",
				separator_style = "thin",
				always_show_bufferline = false,
				show_buffer_close_icons = false,
				show_close_icon = false,
				color_icons = true,
			},
			highlights = {
				separator = {
					fg = "#073642",
					bg = "#002b36",
				},
				separator_selected = {
					fg = "#073642",
				},
				background = {
					fg = "#657b83",
					bg = "#002b36",
				},
				buffer_selected = {
					fg = "#fdf6e3",
					bold = true,
				},
				fill = {
					bg = "#073642",
				},
			},
		}
	end,
}
