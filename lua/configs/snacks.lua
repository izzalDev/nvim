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
	})

	-- vim.keymap.set("n", "<leader>e", function()
	-- 	Snacks.explorer()
	-- end, { desc = "Toggle File Explorer" })
	vim.keymap.set("n", "<leader> ", function()
		Snacks.picker.files()
	end, { desc = "Find Files" })
	vim.keymap.set("n", "<leader>gl", function()
		Snacks.lazygit()
	end, { desc = "Lazygit" })
end
