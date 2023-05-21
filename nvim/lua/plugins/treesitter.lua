return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  opts = {
    sync_install = true,
    auto_install = true,
    ensure_installed = {
      "markdown",
      "markdown_inline",
      "tsx",
      "typescript",
      "javascript",
      "css",
      "html",
      "json",
      "python",
      "cpp",
      "lua"
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
    },
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
    local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
    parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
  end,
}
