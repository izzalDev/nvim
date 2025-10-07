return {
	{
		"stevearc/conform.nvim",
		event = { "InsertLeave", "BufWritePre" },
		dependencies = { "zapling/mason-conform.nvim" },
		config = function()
			local utils = require("utils")
			local conform = require("conform")

			require("mason-conform").setup()
			conform.setup({
				formatters_by_ft = {
					lua = { "stylua" },
					typescript = { "prettier" },
					json = { "prettier" },
					sh = { "shfmt" },
					markdown = { "prettier" },
					dart = { "dart_format" },
					handlebars = { "prettier" },
					vue = { "prettier" },
				},
				formatters = {
					dart_format = {
						command = "dart",
						args = { "format", "--output=show" },
						stdin = true,
					},
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
				conform.format({ async = true })
			end, { desc = "Format buffer" })
		end,
	},
}
