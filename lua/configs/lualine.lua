local function xcodebuild_device()
	if not vim.g.xcodebuild_platform then
		return ""
	end
	if vim.g.xcodebuild_platform == "macOS" then
		return " macOS"
	end

	local deviceIcon = ""
	if vim.g.xcodebuild_platform:match("watch") then
		deviceIcon = "󰢗"
	elseif vim.g.xcodebuild_platform:match("tv") then
		deviceIcon = ""
	elseif vim.g.xcodebuild_platform:match("vision") then
		deviceIcon = "󰊪"
	end

	local name = vim.g.xcodebuild_device_name or "Unknown Device"
	if vim.g.xcodebuild_os then
		return deviceIcon .. " " .. name .. " (" .. vim.g.xcodebuild_os .. ")"
	end

	return deviceIcon .. " " .. name
end

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
		lualine_x = {
			{
				function()
					local parts = {}
					if vim.g.xcodebuild_scheme then
						table.insert(parts, " " .. vim.g.xcodebuild_scheme)
					end

					local device = xcodebuild_device()
					if device ~= "" then
						table.insert(parts, device)
					end

					return table.concat(parts, "  ")
				end,
				cond = function()
					return vim.g.xcodebuild_scheme ~= nil
				end,
				color = { fg = "#f5c2e7" }, -- Catppuccin Pink
			},
		},
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
