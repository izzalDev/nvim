return {
	{
		"stevearc/conform.nvim",
		event = { "InsertLeave", "BufWritePre" },
		keys = {
			{
				"f",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
			},
		},
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
					handlebars = { "prettier" },
					vue = { "prettier" },
				},
			})

			vim.api.nvim_create_autocmd("InsertLeave", {
				callback = function(args)
					local bufnr = args.buf
					if vim.bo[bufnr].modifiable and utils.has_no_errors(bufnr) then
						if vim.api.nvim_buf_is_valid(bufnr) then
							conform.format({ async = true, lsp_fallback = true })
						end
					end
				end,
			})
		end,
	},
}
