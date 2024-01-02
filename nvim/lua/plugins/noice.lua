local icons = require("util.icons").ui

return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
      cmdline = {
        format = {
          search_down = { kind = "search", pattern = "^/", icon = icons.FindDown, lang = "regex" },
          search_up = { kind = "search", pattern = "^%?", icon = icons.FindUp, lang = "regex" }
        }
      },
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true,         -- use a classic bottom cmdline for search
        command_palette = true,       -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = true,            -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false,       -- add a border to hover docs and signature help
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "; after #%d+" },
              { find = "; before #%d+" },
            },
          },
          view = "mini",
        },
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      -- {
      -- 	"rcarriga/nvim-notify",
      -- 	opts = {
      -- 		timeout = 3000,
      -- 		max_height = function()
      -- 			return math.floor(vim.o.lines * 0.75)
      -- 		end,
      -- 		max_width = function()
      -- 			return math.floor(vim.o.columns * 0.75)
      -- 		end,
      -- 		on_open = function(win)
      -- 			vim.api.nvim_win_set_config(win, { zindex = 100 })
      -- 		end,
      -- 	},
      -- 	config = function(_, opts)
      -- 		require("notify").setup(opts)
      -- 	end,
      -- },
    },
    -- config = function(_, opts)
    --   require("noice").setup(opts)
    -- end
  },
}
