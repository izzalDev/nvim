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

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local bufnr = ev.buf
		local client = vim.lsp.get_client_by_id(ev.data.client_id)

		-- Set keymaps for the attached buffer
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to Definition" })
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Go to Declaration" })
		vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "Go to References" })
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr, desc = "Go to Implementation" })
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename Symbol" })
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code Actions" })
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover Documentation" })
		vim.keymap.set("n", "<leader>f", function()
			vim.lsp.buf.format({ async = true })
		end, { buffer = bufnr, desc = "Format Code" })

		-- You can also add more advanced actions or integrate with plugins like Telescope for LSP functions.
		-- Example for diagnostics:
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { buffer = bufnr, desc = "Previous Diagnostic" })
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { buffer = bufnr, desc = "Next Diagnostic" })
		vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, { buffer = bufnr, desc = "Open Diagnostic Float" })
	end,
})
