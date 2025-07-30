vim.opt.rtp:prepend(vim.fn.stdpath("config") .. "/lazy.nvim/")

require("options")
require("keymaps")
require("lazy").setup("plugins")
