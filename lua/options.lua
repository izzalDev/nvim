local utils = require("utils")

vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.clipboard = "unnamedplus"
vim.opt.fillchars = { eob = " " }
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("state") .. "/undo"
vim.opt.mouse = ""
vim.cmd("set mousescroll=ver:1")
vim.opt.scrolloff = 999
utils.set_bg_transparent("NormalFloat")
utils.set_bg_transparent("FloatBorder")

-- vim.opt.shell = "pwsh -nologo"

-- Flags sebelum -Command
-- vim.opt.shellcmdflag = "-NoLogo"

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
