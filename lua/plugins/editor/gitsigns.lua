return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{ "<leader>gb", "<cmd>Gitsigns reset_buffer<CR>", desc = "Git reset buffer" },
		{ "<leader>gh", "<cmd>Gitsigns reset_hunk<CR>", desc = "Git reset hunk" },
		{ "]h", "<cmd>Gitsigns next_hunk<CR>", desc = "Next Hunk" },
		{ "[h", "<cmd>Gitsigns prev_hunk<CR>", desc = "Prev Hunk" },
	},
	config = function()
		require("gitsigns").setup({})
	end,
}
