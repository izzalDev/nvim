vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
	callback = function()
		local buftype = vim.bo.buftype
		local modified = vim.bo.modified
		local bufname = vim.fn.expand("%:p")
		local modifiable = vim.bo.modifiable

		if modifiable and modified and buftype == "" and bufname ~= "" then
			vim.defer_fn(function()
				vim.cmd("silent write")
			end, 3000)
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

-- vim.api.nvim_create_autocmd("ColorScheme", {
--   callback = function()
--     vim.api.nvim_set_hl(0, "StatusLine", { link = "Normal" })
--     vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
--     vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
--   end,
-- })
