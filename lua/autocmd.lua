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

		vim.cmd("Neotree close")
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

vim.api.nvim_create_autocmd("VimLeavePre", {
	callback = function()
		local shada_dir = vim.fn.stdpath("data") .. "/shada/"
		local tmp_files = vim.fn.glob(shada_dir .. "main.shada.tmp.*", true, true)
		for _, file in ipairs(tmp_files) do
			os.remove(file)
		end
	end,
})
