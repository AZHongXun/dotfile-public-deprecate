return {
	"lewis6991/gitsigns.nvim",
	ft = "gitcommit",
	init = function()
		-- load gitsigns only when a git file is opened
		vim.api.nvim_create_autocmd({ "BufRead" }, {
			group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
			callback = function()
				vim.fn.system("git -C " .. '"' .. vim.fn.expand("%:p:h") .. '"' .. " rev-parse")
				if vim.v.shell_error == 0 then
					vim.api.nvim_del_augroup_by_name("GitSignsLazyLoad")
					vim.schedule(function()
						require("lazy").load({ plugins = { "gitsigns.nvim" } })
					end)
				end
			end,
		})
	end,
	opts = {
		signcolumn = true,
		watch_gitdir = {
			interval = 1000,
			follow_files = true,
		},
		attach_to_untracked = true,
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol",
			delay = 1000,
		},
		sign_priority = 6,
		update_debounce = 100,
		current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
		status_formatter = nil,
		preview_config = {
			border = "rounded",
			style = "minimal",
			relative = "cursor",
			row = 0,
			col = 1,
		},
	},
}
