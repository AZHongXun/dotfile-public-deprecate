return {
  "numToStr/Comment.nvim",
  dependencies = {
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      opts = { enable_autocmd = false },
    },
    "nvim-treesitter/nvim-treesitter"
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
  config = function()
    require("Comment").setup({
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
    })
  end
}
