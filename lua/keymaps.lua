local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("", "<Space>", "<Nop>", opts)

for _, mode in pairs({ "n", "v", "s" }) do
	keymap(mode, "<Up>", "<Nop>", opts)
	keymap(mode, "<Down>", "<Nop>", opts)
	keymap(mode, "<Left>", "<Nop>", opts)
	keymap(mode, "<Right>", "<Nop>", opts)
end

for _, mode in pairs({ "i", "v", "n", "x" }) do
	keymap(mode, "<S-Down>", "<cmd>t.<cr>", opts)
	keymap(mode, "<S-Up>", "<cmd>t -l<cr>", opts)
	keymap(mode, "<C-n>", "<cmd>Neotree toggle<cr>", opts)
end

for _, mode in pairs({ "n", "v" }) do
	keymap(mode, "<leader>ca", vim.lsp.buf.code_action, opts)
end

keymap("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Explorer" })
keymap("n", "<leader>snl", "<cmd>Noice last<cr>", { desc = "Noice Last Message" })
keymap("n", "<leader>t", "", { desc = "Terminal" })
keymap("n", "<leader>tx", "<cmd>ToggleTermToggleAll!<cr>", { desc = "Close Tab" })
keymap("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Float" })
keymap("n", "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", { desc = "Horizontal" })
keymap("n", "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", { desc = "Vertical" })
keymap("n", "<leader>ts", "<cmd>ToggleTerm direction=tab<cr>", { desc = "New Tab" })
