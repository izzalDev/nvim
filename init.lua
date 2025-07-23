-- File: C:\Users\Rizal Fadlullah\appdata\local\nvim\init.lua

vim.opt.rtp.prepend("lazy.nvim")

require("options")

-- Pastikan lazy sudah dimuat sebelum setup dipanggil
local lazy = require("lazy")

lazy.setup({
  spec = {
    { import = "plugins" }, -- Ini akan mengimpor semua file dari direktori lua/plugins
  },
  -- Tambahkan opsi lazy.nvim lainnya di sini jika ada (misalnya: defaults, checker, change_detection)
})
