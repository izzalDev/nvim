vim.keymap.set("n", "<leader>g", "", { desc = "Git" })

return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" }, -- Lazy load on buffer events
		config = function()
			require("gitsigns").setup({})
		end,
		keys = {
			{ "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview hunk" },
			{ "<leader>gt", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Toggle line blame" },
			{ "<leader>gb", "<cmd>Gitsigns blame_line<cr>", desc = "Blame line" },
			{ "<leader>gd", "<cmd>Gitsigns diffthis<cr>", desc = "Diff this" },
			{ "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset hunk" },
			{ "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", desc = "Stage hunk" },
		},
	},
	{
		"tpope/vim-fugitive",
		cmd = { "Git", "G", "Gdiffsplit", "Gread", "Gwrite", "Ggrep", "GMove", "GDelete", "GBrowse" },
		keys = {
			{ "<leader>gg", "<cmd>Git<cr>", desc = "Status" },
			{ "<leader>gc", "<cmd>Git commit<cr>", desc = "Commit" },
			{ "<leader>gP", "<cmd>Git push<cr>", desc = "Push" },
			{ "<leader>gl", "<cmd>Git pull<cr>", desc = "Pull" },
			{ "<leader>gs", "<cmd>Git stash<cr>", desc = "Stash" },
		},
	},
}
