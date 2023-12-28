# dotfile-public/nvim

<a href="https://dotfyle.com/AZHongXun/dotfile-public-nvim"><img src="https://dotfyle.com/AZHongXun/dotfile-public-nvim/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/AZHongXun/dotfile-public-nvim"><img src="https://dotfyle.com/AZHongXun/dotfile-public-nvim/badges/leaderkey?style=flat" /></a>
<a href="https://dotfyle.com/AZHongXun/dotfile-public-nvim"><img src="https://dotfyle.com/AZHongXun/dotfile-public-nvim/badges/plugin-manager?style=flat" /></a>

## Description
This is my personal neovim config. It use [folke/lazy.nvim](https://dotfyle.com/plugins/folke/lazy.nvim) to manage plugins.</br>
I didn't use a lot of lazy load. Since lazy loading some plugins may cause unexception error, the startuptime isn't "blazing fast"(**40ms** without opening files)
### Install Instructions
 > Install requires Neovim 0.9+. Always review the code before installing a configuration.

Clone the repository and install the plugins:

```sh
git clone git@github.com:AZHongXun/dotfile-public ~/.config/AZHongXun/dotfile-public
NVIM_APPNAME=AZHongXun/dotfile-public/nvim nvim --headless +"Lazy! sync" +qa
```

Open Neovim with this config:

```sh
NVIM_APPNAME=AZHongXun/dotfile-public/nvim nvim
```

## Plugins List

### theme
+ [craftzdog/solarized-osaka](https://github.com/craftzdog/solarized-osaka.nvim)

### color

+ [NvChad/nvim-colorizer.lua](https://dotfyle.com/plugins/NvChad/nvim-colorizer.lua)
### comment

+ [numToStr/Comment.nvim](https://dotfyle.com/plugins/numToStr/Comment.nvim)
### completion

+ [hrsh7th/nvim-cmp](https://dotfyle.com/plugins/hrsh7th/nvim-cmp)
### editing-support

+ [windwp/nvim-autopairs](https://dotfyle.com/plugins/windwp/nvim-autopairs)
+ [windwp/nvim-ts-autotag](https://dotfyle.com/plugins/windwp/nvim-ts-autotag)
### formatting

+ [stevearc/conform.nvim](https://dotfyle.com/plugins/stevearc/conform.nvim)
### fuzzy-finder

+ [nvim-telescope/telescope.nvim](https://dotfyle.com/plugins/nvim-telescope/telescope.nvim)
### git

+ [lewis6991/gitsigns.nvim](https://dotfyle.com/plugins/lewis6991/gitsigns.nvim)
### indent

+ [echasnovski/mini.indentscope](https://dotfyle.com/plugins/echasnovski/mini.indentscope)
### lsp

+ [neovim/nvim-lspconfig](https://dotfyle.com/plugins/neovim/nvim-lspconfig)
+ [mfussenegger/nvim-lint](https://dotfyle.com/plugins/mfussenegger/nvim-lint)
+ [nvimdev/lspsaga.nvim](https://dotfyle.com/plugins/nvimdev/lspsaga.nvim)
### lsp-installer

+ [williamboman/mason.nvim](https://dotfyle.com/plugins/williamboman/mason.nvim)
### nvim-dev

+ [MunifTanjim/nui.nvim](https://dotfyle.com/plugins/MunifTanjim/nui.nvim)
+ [nvim-lua/plenary.nvim](https://dotfyle.com/plugins/nvim-lua/plenary.nvim)
### plugin-manager

+ [folke/lazy.nvim](https://dotfyle.com/plugins/folke/lazy.nvim)
### snippet

+ [L3MON4D3/LuaSnip](https://dotfyle.com/plugins/L3MON4D3/LuaSnip)
+ [rafamadriz/friendly-snippets](https://dotfyle.com/plugins/rafamadriz/friendly-snippets)
### statusline

+ [nvim-lualine/lualine.nvim](https://dotfyle.com/plugins/nvim-lualine/lualine.nvim)
### syntax

+ [nvim-treesitter/nvim-treesitter-textobjects](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter-textobjects)
+ [nvim-treesitter/nvim-treesitter](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter)
### tabline

+ [akinsho/bufferline.nvim](https://dotfyle.com/plugins/akinsho/bufferline.nvim)
### utility

+ [folke/noice.nvim](https://dotfyle.com/plugins/folke/noice.nvim)
+ [rcarriga/nvim-notify](https://dotfyle.com/plugins/rcarriga/nvim-notify)
## Language Servers

+ astro
+ clangd
+ cssls
+ emmet_ls
+ html
+ jsonls
+ lua_ls
+ pyright
+ tailwindcss
+ tsserver
