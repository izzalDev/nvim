return function()
	local utils = require("utils")
	local conform = require("conform")
	conform.setup({
		formatters_by_ft = {
			lua = { "stylua" },
		},
	})

	local group = vim.api.nvim_create_augroup("ConformFormatOnInsertLeave", { clear = true })

	vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePre" }, {
		group = group,
		callback = function(args)
			local bufnr = args.buf
			if
				vim.api.nvim_buf_is_valid(bufnr)
				and vim.api.nvim_buf_is_loaded(bufnr)
				and vim.bo[bufnr].modifiable
				and vim.bo[bufnr].modified
				and utils.has_no_errors(bufnr)
			then
				vim.defer_fn(function()
					if vim.api.nvim_buf_is_valid(bufnr) then
						conform.format({ bufnr = bufnr })
					end
				end, 500)
			end
		end,
	})
end
