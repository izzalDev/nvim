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
		routes = {
			{
				filter = {
					event = "notify",
					kind = "warn", -- Hanya memfilter pesan WARN
					find = "[Neo-tree WARN]", -- Hanya memfilter pesan yang berisi teks ini
				},
				opts = {
					skip = true, -- Perintah utama: Lewati (sembunyikan) notifikasi ini
				},
			},
		},
	})
end
