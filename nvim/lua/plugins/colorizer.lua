return {
	{
		"NvChad/nvim-colorizer.lua",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("colorizer").setup({
				filetypes = {
					"*",
					"!vim",
					c = { RGB = false }, -- prevent some keywords colorized
					cpp = { RGB = false },
				},
				user_default_options = {
					names = false,
					css_fn = true, -- Enable rgb() hsl()
					tailwind = true,
					always_update = true,
				},
			})
		end,
	},
}
