return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true,
		})

		vim.api.nvim_create_autocmd({ "BufEnter" }, {
			callback = function()
				vim.cmd("Neotree close")
			end,
		})
	end,
}
