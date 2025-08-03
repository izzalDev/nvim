vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		if vim.v.exiting == 1 then
			return
		end

		local buftype = vim.bo.buftype
		if buftype == "" then
			vim.keymap.set("i", "<Up>", "<Nop>", { buffer = true })
			vim.keymap.set("i", "<Down>", "<Nop>", { buffer = true })
			vim.keymap.set("i", "<Left>", "<Nop>", { buffer = true })
			vim.keymap.set("i", "<Right>", "<Nop>", { buffer = true })
		end
	end,
})

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
	callback = function()
		local buftype = vim.bo.buftype
		local modified = vim.bo.modified

		if modified and buftype == "" then
			vim.cmd("silent write")
		end
	end,
})
