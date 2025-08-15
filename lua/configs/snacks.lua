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
		lazygit = {
			enabled = true,
			-- Add cleanup on exit
			configure = function(_, opts)
				opts.win = opts.win or {}
				opts.win.on_exit = function()
					-- Force redraw and clear any lingering state
					vim.schedule(function()
						vim.cmd("redraw!")
						collectgarbage()
					end)
				end
			end,
		},
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
