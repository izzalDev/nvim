local utils = require("utils")

vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.clipboard = "unnamedplus"
vim.opt.fillchars = { eob = " " }
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("state") .. "/undo"
vim.keymap.set("", "<LeftMouse>", "<Nop>")
vim.keymap.set("", "<RightMouse>", "<Nop>")
vim.cmd("set mousescroll=ver:1")
vim.opt.scrolloff = 999
utils.set_bg_transparent("NormalFloat")
utils.set_bg_transparent("FloatBorder")

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

-- Set shell
vim.opt.shell = "pwsh -NoLogo"

-- Set shellcmdflag
vim.opt.shellcmdflag = "-NoLogo -NonInteractive -ExecutionPolicy RemoteSigned -Command "
		.. "[Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();"
		.. "$PSDefaultParameterValues['Out-File:Encoding']='utf8';"
		.. "$PSStyle.OutputRendering='plaintext';"
		.. "Remove-Alias -Force -ErrorAction SilentlyContinue tee;"

-- Set shellredir
vim.opt.shellredir = [[2>&1 | %{%{ "$_" }} | Out-File %s; exit $LastExitCode]]

-- Set shellpipe
vim.opt.shellpipe = [[2>&1 | %{%{ "$_" }} | tee %s; exit $LastExitCode]]

-- Clear shellquote & shellxquote
vim.opt.shellquote = ""
vim.opt.shellxquote = ""
vim.opt.textwidth = 80
