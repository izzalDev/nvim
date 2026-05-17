return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				transparent_background = true,
				background = {
					light = "latte",
					dark = "mocha",
				},
				custom_highlights = {
					WinSeparator = { link = "LineNr" },
					NeoTreeNormal = { bg = "None" },
					NeoTreeNormalNC = { bg = "None" },
					NeoTreeWinSeparator = { link = "WinSeparator" },
					NormalFloat = { link = "Normal" },
					FloatBorder = { link = "Title" },
				},
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
