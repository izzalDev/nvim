-- General settings
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.number = true
vim.opt.clipboard = "unnamedplus"
vim.opt.fillchars = { eob = " " }
vim.o.fileformat = "unix"

-- Leader key
vim.g.mapleader = " "

-- Keymap helper
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Disable <Space>
keymap("", "<Space>", "<Nop>", opts)

-- Disable arrow keys and mouse buttons in normal, visual, and select mode
for _, mode in ipairs({ "n", "v", "s", "i" }) do
	keymap(mode, "<Up>", "<Nop>", opts)
	keymap(mode, "<Down>", "<Nop>", opts)
	keymap(mode, "<Left>", "<Nop>", opts)
	keymap(mode, "<Right>", "<Nop>", opts)
	-- keymap(mode, "<LeftMouse>", "<Nop>", opts)
	-- keymap(mode, "<RightMouse>", "<Nop>", opts)
end

vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("state") .. "/undo"
