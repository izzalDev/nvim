local keymap = function (mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { desc = desc, noremap = true, silent = true })
end

local keymaps = function(mode, mappings)
  for _, map in ipairs(mappings) do
    keymap(mode, map[1], map[2], map[3])
  end
end

keymaps({ "n", "v", "i", "x" }, {
  { "<S-Down>", "<cmd>t.<cr>" },
  { "<S-Up>", "<cmd>t -l<cr>" },
  { "<C-n>", "<cmd>Neotree toggle<cr>" },
})

keymaps("n", {
  { "<leader>e", "<cmd>Neotree toggle<cr>", "Toggle Explorer" },
  { "<leader>o", "<cmd>Neotree focus<cr>", "Toggle Focus Explorer" },
  { "<leader>snl", "<cmd>Noice last<cr>", "Noice Last Message" },
  -- Terminal group
  { "<leader>t", "", "Terminal" },
  { "<leader>tx", "<cmd>ToggleTermToggleAll!<cr>", "Close All Terminals" },
  { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", "Float Terminal" },
  { "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal Terminal" },
  { "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical Terminal" },
  { "<leader>ts", "<cmd>ToggleTerm direction=tab<cr>", "Tab Terminal" },
})

keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code Action")
