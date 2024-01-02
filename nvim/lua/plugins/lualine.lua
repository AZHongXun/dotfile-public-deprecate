local diagnostic_signs = require("util.icons").diagnostic_signs
return {
  "nvim-lualine/lualine.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  event = "VeryLazy",
  opts = {
    options = {
      theme = "solarized_dark",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = { "mason" },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch" },
      lualine_c = {
        {
          "filename",
          file_status = true, -- displays file status (readonly status, modified status)
          path = 0,           -- 0 = just filename, 1 = relative path, 2 = absolute path
        },
      },
      lualine_x = {
        {
          "diagnostics",
          sources = { "nvim_diagnostic" },
          symbols = {
            error = diagnostic_signs.Error,
            warn = diagnostic_signs.Warn,
            info = diagnostic_signs.Info,
            hint = diagnostic_signs.Hint,
          },
        },
        -- stylua: ignore
        {
          function() return require("noice").api.status.command.get() end,
          cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
          color = { fg = "#95A0A1" }
        },
        -- stylua: ignore
        {
          function() return require("noice").api.status.mode.get() end,
          cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
          color = { fg = "##95A0A1" }

        },
        "filetype",
      },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {
        {
          "filename",
          file_status = true, -- displays file status (readonly status, modified status)
          path = 1,           -- 0 = just filename, 1 = relative path, 2 = absolute path
        },
      },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    extensions = { "fugitive" },
  },
}
