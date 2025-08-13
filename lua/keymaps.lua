vim.keymap.set("n", ";", ":")

-- Window navigation
vim.keymap.set({ "n", "t" }, "<C-h>", "<C-w>h", { silent = true })
vim.keymap.set({ "n", "t" }, "<C-j>", "<C-w>j", { silent = true })
vim.keymap.set({ "n", "t" }, "<C-k>", "<C-w>k", { silent = true })
vim.keymap.set({ "n", "t" }, "<C-l>", "<C-w>l", { silent = true })
