local config = {
	options = {
		component_separators = "",
		section_separators = { left = "", right = "" },
		globalstatus = true,
		disable_filetypes = {
			statusline = {},
			winbar = {},
		},
	},
	sections = {
		lualine_a = { { "mode", separator = { left = " " }, right_padding = 2 } },
		lualine_b = {
			"filename",
			"branch",
			{
				"diff",
				symbols = { added = " ", modified = " ", removed = " " },
			},
			"diagnostic",
		},
		lualine_c = {
			"%=", --[[ add your center components here in place of this comment ]]
		},
		lualine_x = {},
		lualine_y = {
			"lsp_status",
			{
				"diagnostics",
				symbols = { error = " ", warn = " ", info = " " },
			},
			"filetype",
			"progress",
		},
		lualine_z = {
			{ "location", separator = { right = " " }, left_padding = 2 },
		},
	},
	inactive_sections = {
		lualine_a = { "filename" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "location" },
	},
	tabline = {},
	extensions = {},
}

return function()
	require("lualine").setup(config)
	vim.api.nvim_set_hl(0, "StatusLine", { link = "Normal" })
	vim.api.nvim_set_hl(0, "StatusLineNC", { link = "NormalNC" })
end
