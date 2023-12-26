local M = {}

M.on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "<C-j>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
	vim.keymap.set("n", "gl", "<Cmd>Lspsaga show_line_diagnostics<CR>", opts)
	vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
	vim.keymap.set("n", "gd", "<Cmd>Lspsaga lsp_finder<CR>", opts)
	vim.keymap.set("i", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	vim.keymap.set("n", "gp", "<Cmd>Lspsaga peek_definition<CR>", opts)
	vim.keymap.set("n", "<leader>cr", "<Cmd>Lspsaga rename<CR>", opts)
	vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>") -- code action
end

return M
