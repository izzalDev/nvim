return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	keys = {
		{ "<leader>e", "<cmd>Neotree toggle left<cr>", desc = "Explorer (Neo-tree)" },
		{ "<leader>o", "<cmd>Neotree focus<cr>", desc = "Focus Neo-tree" },
	},
	config = function()
		require("neo-tree").setup({
			event_handlers = {
				{
					event = "file_opened",
					handler = function()
						vim.cmd("Neotree close")
					end,
				},
			},
			use_popups_for_input = false,
		})
	end,
}
