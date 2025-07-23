vim.opt.rtp:prepend(vim.fn.stdpath("config") .. "/lazy.nvim/")

require("options")
require('lazy').setup("plugins")
