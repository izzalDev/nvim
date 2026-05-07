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
	float = {
		border = "rounded",
	},
})

if vim.fn.has("win32") == 1 then
	local shell_cmd = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell"

	local powershell_options = {
		shell = shell_cmd,
		-- Gabungkan flag yang kompleks ke dalam satu string di sini
		shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command "
			.. "[Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
			.. "$PSDefaultParameterValues['Out-File:Encoding']='utf8';"
			.. "Remove-Alias -Force tee -ErrorAction SilentlyContinue;",
		shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
		shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
		shellquote = "",
		shellxquote = "",
	}

	for option, value in pairs(powershell_options) do
		vim.opt[option] = value
	end
end

-- Setting umum (Non-shell related)
vim.opt.textwidth = 80
vim.opt.ffs = "unix"
