-- Encoding
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- Appearance
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
vim.opt.background = 'dark'
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.scrolloff = 10
vim.opt.inccommand = 'split'
vim.opt.wrap = false -- No Wrap lines
vim.opt.backspace = { 'start', 'eol', 'indent' }

-- Title
vim.opt.title = true
vim.opt.titlestring = '❐ %t'
vim.opt.titleold = '%{fnamemodify(getcwd(), ":t")}'
vim.opt.titlelen = 70

-- Indent
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true

--Searching
vim.opt.hlsearch = true
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smartcase = true  -- Don't ignore case with capitals
vim.opt.showmatch = true


-- Backup
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }
vim.opt.writebackup = false
vim.opt.undofile = true -- Save undo history
vim.opt.confirm = true  -- prompt to save before destructive actions

-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }

-- Other
vim.opt.shell = 'zsh'
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }

-- Netrw
vim.g.netrw_banner = 0 -- do not display info on the top of window

-- disable some builtin providers we don't use
vim.tbl_map(function(p)
  vim.g['loaded_' .. p] = vim.endswith(p, 'provider') and 0 or 1
end, {
  'ruby_provider',
  'perl_provider',
})
