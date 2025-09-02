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
		input = {
			enabled = true,
			mappings = {
				["<Esc>"] = "close",
			},
			auto_close = true,
		},
		picker = { enabled = true },
		win = { backdrop = 100 },
		notify = { enabled = false },
		lazygit = { enabled = true },
		styles = {
			input = {
				width = 80,
			},
		},
	})

	-- Close snacks_input buffer automatically when it becomes inactive
	vim.api.nvim_create_autocmd({ "BufLeave", "WinLeave" }, {
		pattern = "*",
		callback = function()
			local ft = vim.bo.filetype
			if ft == "snacks_input" then
				-- Only close if the window is valid
				local win = vim.api.nvim_get_current_win()
				if win and vim.api.nvim_win_is_valid(win) then
					-- Use pcall to safely ignore any errors from plugins
					pcall(vim.api.nvim_win_close, win, true)
				end
			end
		end,
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
end
