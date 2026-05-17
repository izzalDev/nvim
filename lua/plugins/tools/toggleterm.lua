return {
	{
		"akinsho/toggleterm.nvim",
		config = function()
			local toggleterm = require("toggleterm")
			local Terminal = require("toggleterm.terminal").Terminal

			toggleterm.setup({
				highlights = {
					Normal = { guibg = "NONE" },
				},
				shade_terminals = false,
				float_opts = { border = "rounded" },
			})

			-- Terminal keymaps (for terminal buffers)
			function _G.set_terminal_keymaps()
				local opts = { buffer = 0 }
				vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
				vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
				vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
				vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
				vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
				vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
				vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
			end
			vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

			-- single lazygit floating terminal (reuse the same instance)
			local lazygit = Terminal:new({ cmd = "lazygit", direction = "float", hidden = true })
			function _LAZYGIT_TOGGLE()
				lazygit:toggle()
			end

			-- create a NEW horizontal split terminal (fresh instance each time)
			function _NEW_HORIZONTAL_TERM()
				local t = Terminal:new({
					direction = "horizontal",
					size = 15, -- height in lines
					close_on_exit = true, -- auto close when process exits
					on_open = function(t)
						vim.cmd("startinsert")
					end,
				})
				t:toggle()
			end

			-- create a NEW vertical split terminal (fresh instance each time)
			function _NEW_VERTICAL_TERM()
				local t = Terminal:new({
					direction = "vertical",
					size = 80, -- width in columns
					close_on_exit = true,
					on_open = function(t)
						vim.cmd("startinsert")
					end,
				})
				t:toggle()
			end

			-- create a NEW tab terminal (fresh instance each time)
			function _NEW_TAB_TERM()
				local t = Terminal:new({
					direction = "tab",
					close_on_exit = true,
					on_open = function(t)
						vim.cmd("startinsert")
					end,
				})
				t:toggle()
			end
		end,

		keys = {
			{ "<leader>t", "", desc = "Terminal", mode = "n" },
			{ "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float (toggle)", mode = "n" },

			-- Create NEW terminals (not just toggle)
			{ "<leader>th", "<cmd>lua _NEW_HORIZONTAL_TERM()<cr>", desc = "New Horizontal Terminal", mode = "n" },
			{ "<leader>tn", "<cmd>lua _NEW_VERTICAL_TERM()<cr>", desc = "New Vertical Split Terminal", mode = "n" },
			{ "<leader>ts", "<cmd>lua _NEW_TAB_TERM()<cr>", desc = "New Tab Terminal", mode = "n" },

			-- Lazygit (toggle single floating instance)
			{ "<leader>tg", "<cmd>lua _LAZYGIT_TOGGLE()<cr>", desc = "Lazygit", mode = "n" },
		},
	},
}
