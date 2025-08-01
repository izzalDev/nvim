vim.opt.rtp:prepend(vim.fn.stdpath("config") .. "/lazy.nvim/")

require("autocmd")
require("options")
require("keymaps")
require("lazy").setup("plugins")
