return {
  'windwp/nvim-ts-autotag',
  ft = { "html", "javascript", "typescript", "javascriptreact", "typescriptreact", "jsx", "tsx", "astro" },
  config = function()
    require('nvim-ts-autotag').setup({
    })
  end
}
