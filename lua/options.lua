vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set clipboard=unnamedplus")
vim.g.mapleader = " "
-- vim.cmd("nnoremap ; :")
vim.keymap.set("n", ";", ":")
-- set fillchars=eob:\
vim.opt.fillchars = { eob = " " }
