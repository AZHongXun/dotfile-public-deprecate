local M = {}

M.on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "<C-j>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
  vim.keymap.set("n", "gl", "<Cmd>Lspsaga show_line_diagnostics<CR>", opts)
  vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
  vim.keymap.set("n", "gd", "<Cmd>Lspsaga finder<CR>", opts)
  vim.keymap.set("i", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  vim.keymap.set("n", "gp", "<Cmd>Lspsaga peek_definition<CR>", opts)
  vim.keymap.set("n", "gr", "<Cmd>Lspsaga rename<CR>", opts)
  vim.keymap.set({ "n", "v" }, "ga", "<cmd>Lspsaga code_action<CR>") -- code action
  vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
  vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>")
end

M.capabilities = function()
  local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if status_ok then
    return cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())
  end
end

return M
