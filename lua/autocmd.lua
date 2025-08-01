vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		if vim.v.exiting == 1 then
			return
		end

		local buftype = vim.api.nvim_buf_get_option(0, "buftype")
		if buftype == "" then
			vim.keymap.set("i", "<Up>", "<Nop>", { buffer = true })
			vim.keymap.set("i", "<Down>", "<Nop>", { buffer = true })
			vim.keymap.set("i", "<Left>", "<Nop>", { buffer = true })
			vim.keymap.set("i", "<Right>", "<Nop>", { buffer = true })
		end
	end,
})
