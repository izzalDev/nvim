local M = {}

function M.set_bg_transparent(group)
	local hl = vim.api.nvim_get_hl(0, { name = group })
	vim.api.nvim_set_hl(0, group, { fg = hl.fg, bg = "NONE" })
end

return M
