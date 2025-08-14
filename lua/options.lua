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

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
	callback = function(args)
		local bufnr = args.buf
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client then
			return
		end

		if client.server_capabilities and client.server_capabilities.hoverProvider then
			vim.keymap.set("n", "K", function()
				vim.lsp.buf.hover({ border = "rounded" })
			end, { buffer = bufnr, desc = "LSP Hover" })
		end

		if client.server_capabilities and client.server_capabilities.signatureHelpProvider then
			vim.keymap.set("i", "<C-k>", function()
				vim.lsp.buf.signature_help({ border = "rounded" })
			end, { buffer = bufnr, desc = "LSP Signature Help" })
		end
	end,
})

-- Keymaps
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "LSP Signature Help" })
