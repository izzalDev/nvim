local keymap = vim.api.nvim_set_keymap
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

keymap("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Explorer" })
keymap("n", "<leader>snl", "<cmd>Noice last<cr>", { desc = "Noice Last Message" })
