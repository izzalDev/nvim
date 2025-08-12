return function()
	require("snacks").setup({
		dashboard = { enabled = true, statusline = true },
		explorer = { enabled = true },
		indent = { enabled = true },
		input = { enabled = true },
		picker = { enabled = true },
		win = { backdrop = 100 },
		notify = { enabled = false },
	})
end
