return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup({
				ui = { backdrop = 100, border = "rounded" },
			})
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		event = "BufEnter",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "ts_ls", "vue_ls", "emmet_ls", "pyright", "lua_ls" },
				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "hoffs/omnisharp-extended-lsp.nvim" },
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local vue_language_server = vim.fn.stdpath("data")
				.. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

			vim.lsp.config("ts_ls", {
				capabilities = capabilities,
				init_options = {
					plugins = {
						{
							name = "@vue/typescript-plugin",
							location = vue_language_server,
							languages = { "vue" },
						},
					},
				},
				filetypes = { "typescript", "javascript", "vue" },
			})

			vim.lsp.config("cssls", {
				filetypes = { "css", "vue", "scss", "less" },
				capabilities = capabilities,
			})

			vim.lsp.config("html", {
				filetypes = { "html", "ejs", "vue" },
				capabilities = capabilities,
			})

			vim.lsp.enable("dartls")
		end,
	},
}
