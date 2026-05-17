return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			require("which-key").setup({
				preset = "helix",
				defaults = {},
				spec = {
					{
						mode = { "n", "v" },
						{ "<leader>f", group = "file/find" },
						{ "<leader>g", group = "git" },
						{
							"<leader>b",
							group = "buffer",
							expand = function()
								return require("which-key.extras").expand.buf()
							end,
						},
						{
							"<leader>w",
							group = "windows",
							proxy = "<c-w>",
							expand = function()
								return require("which-key.extras").expand.win()
							end,
						},
					},
				},
			})
		end,
	},
}
