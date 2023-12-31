return {
	"numToStr/Comment.nvim",
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
		lazy = true,
		opts = { enable_autocmd = false },
	},
	keys = {
		{ "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<cr>", desc = "Comment" },
		{
			"<leader>/",
			'<esc><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<cr>',
			desc = "Comment",
			mode = "x",
		},
	},
	opts = {
		custom_commentstring = function()
			return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
		end,
	},
}
