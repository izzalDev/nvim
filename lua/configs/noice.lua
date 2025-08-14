-- lua/configs/noice.lua
return function()
	require("noice").setup({
		lsp = {
			-- Biarkan noice handle semua LSP UI
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
			hover = {
				enabled = true,
				silent = true,
			},
			signature = {
				enabled = true,
				auto_open = {
					enabled = true,
					trigger = true, -- Auto show saat mengetik
					luasnip = true,
					throttle = 50,
				},
			},
		},
		presets = {
			long_message_to_split = true,
			lsp_doc_border = true, -- Enable noice border handling
		},
		-- Custom views dengan rounded border
		views = {
			hover = {
				border = { style = "rounded" },
				size = { max_width = 80, max_height = 20 },
			},
			popup = {
				border = { style = "rounded" },
			},
		},
	})

	-- Setup LSP keymaps setelah noice diinisialisasi
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("NoiceLspKeymaps", { clear = true }),
		callback = function(args)
			local bufnr = args.buf
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			if not client then
				return
			end

			-- LSP Hover (K) - handled by noice
			if client.server_capabilities and client.server_capabilities.hoverProvider then
				vim.keymap.set("n", "K", vim.lsp.buf.hover, {
					buffer = bufnr,
					desc = "LSP Hover",
					silent = true,
				})
			end

			-- LSP Signature Help (Ctrl+k) - handled by noice
			if client.server_capabilities and client.server_capabilities.signatureHelpProvider then
				vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, {
					buffer = bufnr,
					desc = "LSP Signature Help",
					silent = true,
				})
			end
		end,
	})
end
