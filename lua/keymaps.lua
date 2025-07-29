local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Menetapkan Spacebar sebagai leader key dan menonaktifkan fungsi defaultnya.
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Menonaktifkan tombol panah untuk mode Normal, Visual, Select, dan Insert.
-- Ini mendorong penggunaan h, j, k, l untuk navigasi.
for _, mode in pairs({ "n", "v", "s" }) do
  keymap(mode, "<Up>", "<Nop>", opts)
  keymap(mode, "<Down>", "<Nop>", opts)
  keymap(mode, "<Left>", "<Nop>", opts)
  keymap(mode, "<Right>", "<Nop>", opts)
end

-- Keymap untuk ToggleTerm (atau plugin terminal serupa).
-- "<S-Down>" (Shift + Panah Bawah) akan membuka/menutup terminal utama.
-- "<S-Up>" (Shift + Panah Atas) akan membuka terminal mengambang.
-- Sesuaikan perintah "<cmd>t.<cr>" dan "<cmd>t -l<cr>" agar sesuai
-- dengan perintah aktual plugin terminal Anda (misalnya, "ToggleTerm").
for _, mode in pairs({ "i", "v", "n", "x" }) do
  keymap(mode, "<S-Down>", "<cmd>t.<cr>", opts)
  keymap(mode, "<S-Up>", "<cmd>t -l<cr>", opts)
end

keymap("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Explorer" })
keymap("n", "<C-n>", ":Neotree toggle<CR>", {})
