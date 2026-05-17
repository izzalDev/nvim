return {
	{
		"stevearc/oil.nvim",
		lazy = true,
		cmd = { "Oil", "OilOpen", "OilClose" },
		opts = {},
	},
	{
		"JezerM/oil-lsp-diagnostics.nvim",
		dependencies = { "stevearc/oil.nvim" },
		config = function()
			require("oil-lsp-diagnostics").setup({})
		end,
	},
}
