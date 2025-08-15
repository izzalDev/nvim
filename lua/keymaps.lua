vim.keymap.set("n", ";", ":")
vim.keymap.set("n", "<leader>g", "", { desc = "+Git" })
vim.keymap.set("n", "<leader>f", "", { desc = "+Find" })
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]])
vim.keymap.set("t", "  ", [[<C-\><C-n>]])
vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]])
vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]])
vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]])
vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]])
vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]])
-- Fungsi untuk disable key hanya di buffer normal
local function disable_edit_keys()
	if vim.bo.buftype == "" then -- buftype kosong artinya buffer biasa
		-- Disable Backspace in Insert mode
		vim.keymap.set("i", "<BS>", "<Nop>", { buffer = true, noremap = true, silent = true })

		-- Disable Arrow keys in Normal & Insert mode
		local modes = { "n", "i" }
		vim.keymap.set(modes, "<Up>", "<Nop>", { buffer = true, noremap = true, silent = true })
		vim.keymap.set(modes, "<Down>", "<Nop>", { buffer = true, noremap = true, silent = true })
		vim.keymap.set(modes, "<Left>", "<Nop>", { buffer = true, noremap = true, silent = true })
		vim.keymap.set(modes, "<Right>", "<Nop>", { buffer = true, noremap = true, silent = true })
	end
end

-- Terapkan saat membuka buffer
vim.api.nvim_create_autocmd("BufEnter", {
	callback = disable_edit_keys,
})
