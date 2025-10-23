return {
	"nvim-flutter/flutter-tools.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("flutter-tools").setup({})

		vim.api.nvim_create_autocmd({ "BufWritePost", "TextChanged" }, {
			callback = function(args)
				local bufnr = args.buf
				local utils = require("utils")

				if vim.bo[bufnr].modifiable and utils.has_no_errors(bufnr) then
					if vim.bo[bufnr].filetype == "dart" then
						vim.cmd("FlutterReload")
					end
				end
			end,
		})
	end,
}
