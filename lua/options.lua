local utils = require("utils")

vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.clipboard = "unnamedplus"
vim.opt.fillchars = { eob = " " }
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("state") .. "/undo"
vim.api.nvim_set_hl(0, "StatusLine", { link = "Normal" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
-- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
utils.set_bg_transparent("NormalFloat")
utils.set_bg_transparent("FloatBorder")

local servers = {
	"lua_ls",
	"ts_ls",
	"dartls",
}

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "",
		},
	},
	virtual_text = true,
	severity_sort = true,
})

for _, server in ipairs(servers) do
	vim.lsp.enable(server)
end

vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
