local opts = { noremap = true, silent = true }
-- Set Space as leaderkey
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local icons = require("util.icons").ui
require("lazy").setup({
	spec = {
		import = "plugins",
		opts = { colorscheme = "solarized-osaka" },
	},
	defaults = { lazy = true },
	ui = {
		icons = {
			cmd = icons.Cmdline,
			ft = icons.File,
			init = icons.Gear,
			import = icons.Import,
			runtime = icons.Runtime,
		},
	},
	checker = { enable = false },
	performance = {
		cache = { enable = true },
		rtp = {
			disabled_plugins = {
				"2html_plugin",
				"tohtml",
				"getscript",
				"getscriptPlugin",
				"gzip",
				"logipat",
				"matchit",
				"tar",
				"tarPlugin",
				"rrhelper",
				"spellfile_plugin",
				"vimball",
				"vimballPlugin",
				"zip",
				"zipPlugin",
				"tutor",
				"rplugin",
				"synmenu",
				"optwin",
				"compiler",
				"bugreport",
				"netrw",
				"netrwPlugin",
				"netrwSettings",
				"netrwFileHandlers",
			},
		},
	},
})

vim.keymap.set("n", "<leader>lz", "<cmd>:Lazy<cr>")
vim.keymap.set("n", "<leader>lu", "<cmd>:Lazy update<cr>")

-- Lazy loading keymaps and autocmd
vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		require("core.keymaps")
		require("core.autocmds")
	end,
})
