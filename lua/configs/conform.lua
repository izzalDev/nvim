return function()
	local utils = require("utils")
	local conform = require("conform")
	conform.setup({
		formatters_by_ft = {
			lua = { "stylua" },
		},
	})

	vim.api.nvim_create_autocmd("InsertLeave", {
		callback = function(args)
			local bufnr = args.buf
			if vim.bo[bufnr].modifiable and utils.has_no_errors(bufnr) then
				if vim.api.nvim_buf_is_valid(bufnr) then
					conform.format()
				end
			end
		end,
	})
	vim.keymap.set("n", "f", function()
		conform.format()
	end, { desc = "Format buffer" })
end
