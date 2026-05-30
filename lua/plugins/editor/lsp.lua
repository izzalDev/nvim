return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					backdrop = 100,
					border = "rounded",
				},
			})
		end,
	},

	{
		"mason-org/mason-lspconfig.nvim",
		event = "BufEnter",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"ts_ls",
					"vue_ls",
					"emmet_ls",
					"lua_ls",
					"pylsp",
				},
				automatic_installation = true,
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		event = "BufEnter",
		dependencies = {
			"hoffs/omnisharp-extended-lsp.nvim",
			"antosha417/nvim-lsp-file-operations",
		},
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

			vim.lsp.config("pylsp", {
				capabilities = capabilities,
				settings = {
					pylsp = {
						plugins = {
							jedi_completion = {
								enabled = true,
								include_params = true,
							},
							pyflakes = { enabled = true },
							pycodestyle = { enabled = false },
							mccabe = { enabled = false },
							autopep8 = { enabled = false },
							yapf = { enabled = false },
							black = { enabled = true },
							isort = { enabled = true },
						},
					},
				},
			})

			if vim.fn.has("mac") == 1 then
				vim.lsp.config("sourcekit", {
					capabilities = capabilities,
					cmd = { "sourcekit-lsp" },
					filetypes = { "swift", "objc", "objcpp" },
					root_dir = function(_, callback)
						local util = require("lspconfig.util")
						callback(
							util.root_pattern("Package.swift")(vim.fn.getcwd())
								or util.find_git_ancestor(vim.fn.getcwd())
						)
					end,
				})
			end

			-- Configure and enable all required LSP servers
			local servers = {
				"ts_ls",
				"vue_ls",
				"emmet_ls",
				"lua_ls",
				"cssls",
				"html",
				"pylsp",
				"dartls",
			}
			if vim.fn.has("mac") == 1 then
				table.insert(servers, "sourcekit")
			end

			for _, server in ipairs(servers) do
				-- If capabilities haven't been customized, register them
				if
					server ~= "sourcekit"
					and server ~= "pylsp"
					and server ~= "ts_ls"
					and server ~= "cssls"
					and server ~= "html"
				then
					vim.lsp.config(server, {
						capabilities = capabilities,
					})
				end
				vim.lsp.enable(server)
			end
		end,
	},

	{
		"MysticalDevil/inlay-hints.nvim",
		event = "LspAttach",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			require("inlay-hints").setup()
		end,
	},
}
