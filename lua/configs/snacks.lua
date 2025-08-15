return function()
	require("snacks").setup({
		dashboard = {
			enabled = true,
			statusline = true,
			preset = {
				header = table.concat({
					"                                                                    ",
					"      ████ ██████           █████      ██                     ",
					"     ███████████             █████                             ",
					"     █████████ ███████████████████ ███   ███████████   ",
					"    █████████  ███    █████████████ █████ ██████████████   ",
					"   █████████ ██████████ █████████ █████ █████ ████ █████   ",
					" ███████████ ███    ███ █████████ █████ █████ ████ █████  ",
					"██████  █████████████████████ ████ █████ █████ ████ ██████ ",
				}, "\n"),
			},
		},
		explorer = { enabled = true },
		indent = { enabled = true },
		input = { enabled = true },
		picker = { enabled = true },
		win = { backdrop = 100 },
		notify = { enabled = false },
		lazygit = { enabled = true },
	})

	-- vim.keymap.set("n", "<leader>e", function()
	-- 	Snacks.explorer()
	-- end, { desc = "Toggle File Explorer" })
	vim.keymap.set("n", "<leader> ", function()
		Snacks.picker.files()
	end, { desc = "Find Files" })
	vim.keymap.set("n", "<leader>gg", function()
		Snacks.lazygit()
	end, { desc = "Lazygit" })
	vim.keymap.set("n", "<leader>tf", function()
		Snacks.terminal()
	end, { desc = "Terminal" })
	vim.keymap.set("n", "<leader>e", function()
		Snacks.explorer()
	end, { desc = "Toggle Explorer" })
end
