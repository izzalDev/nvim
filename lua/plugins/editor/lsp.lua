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
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local bufnr = ev.buf
					local client = vim.lsp.get_client_by_id(ev.data.client_id)

					-- Set keymaps for the attached buffer
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to Definition" })
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Go to Declaration" })
					vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "Go to References" })
					vim.keymap.set(
						"n",
						"gi",
						vim.lsp.buf.implementation,
						{ buffer = bufnr, desc = "Go to Implementation" }
					)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename Symbol" })
					vim.keymap.set(
						"n",
						"<leader>ca",
						vim.lsp.buf.code_action,
						{ buffer = bufnr, desc = "Code Actions" }
					)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover Documentation" })
					vim.keymap.set("n", "<leader>f", function()
						vim.lsp.buf.format({ async = true })
					end, { buffer = bufnr, desc = "Format Code" })

					-- LSP Signature Help (Ctrl+k) in insert mode - handled by noice/LSP
					if client and client.server_capabilities.signatureHelpProvider then
						vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, {
							buffer = bufnr,
							desc = "LSP Signature Help",
							silent = true,
						})
					end

					-- You can also add more advanced actions or integrate with plugins like Telescope for LSP functions.
					-- Example for diagnostics:
					vim.keymap.set("n", "[d", function()
						vim.diagnostic.jump({ count = -1 })
					end, { buffer = bufnr, desc = "Previous Diagnostic" })
					vim.keymap.set("n", "]d", function()
						vim.diagnostic.jump({ count = 1 })
					end, { buffer = bufnr, desc = "Next Diagnostic" })
					vim.keymap.set(
						"n",
						"<leader>vd",
						vim.diagnostic.open_float,
						{ buffer = bufnr, desc = "Open Diagnostic Float" }
					)
				end,
			})

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
