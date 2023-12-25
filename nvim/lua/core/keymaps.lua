local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- Disable X to cut
keymap("n", "x", '"_x')

-- Move while insert
keymap("i", "<C-h>", "<Left>", opts)
keymap("i", "<C-j>", "<Down>", opts)
keymap("i", "<C-k>", "<Up>", opts)
keymap("i", "<C-l>", "<Right>", opts)

-- Better escape in terminal mode
keymap("t", "<C-[>", "<C-\\><C-n>")

-- Toggle relative number
keymap("n", "<leader>rn", "<cmd>set rnu!<cr>", { desc = "Toggle relative number" }, opts)

-- Format
keymap("n", "<C-f>", "<cmd>lua vim.lsp.buf.format{async = true}<cr>", opts)

-- Increment/decrement
keymap("n", "+", "<C-a>")
keymap("n", "-", "<C-x>")

-- Delete a word backwards
keymap("n", "dw", 'vb"_d')

-- Select all
keymap("n", "<C-a>", "gg<S-v>G")

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command("W", "w !sudo tee > /dev/null %", {})

-- New tab
keymap("n", "te", "<cmd>tabedit<cr>")

-- Split window
keymap("n", "ss", "<cmd>split<Return><C-w>w")
keymap("n", "sv", "<cmd>vsplit<Return><C-w>w")
-- Move window
keymap("n", "<Space>", "<C-w>w")
keymap("", "sh", "<C-w>h")
keymap("", "sk", "<C-w>k")
keymap("", "sj", "<C-w>j")
keymap("", "sl", "<C-w>l")

-- Resize window
keymap("n", "<C-w><left>", "<C-w><")
keymap("n", "<C-w><right>", "<C-w>>")
keymap("n", "<C-w><up>", "<C-w>+")
keymap("n", "<C-w><down>", "<C-w>-")

-- quit hl search
keymap("n", "<ESC>", "<cmd>nohlsearch<cr>", opts)
