return {
  "akinsho/bufferline.nvim",
  dependencies = 'nvim-tree/nvim-web-devicons',
  event = "UIEnter",
  opts = function()
    return {
      options = {
        mode = 'tabs',
        separator_style = 'thin',
        always_show_bufferline = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
        color_icons = true
      },
      highlights = {
        separator = {
          fg = '#073642',
          bg = '#002b36',
        },
        separator_selected = {
          fg = '#073642',
        },
        background = {
          fg = '#657b83',
          bg = '#002b36'
        },
        buffer_selected = {
          fg = '#fdf6e3',
          bold = true,
        },
        fill = {
          bg = '#073642'
        }
      },
    }
  end,
}
