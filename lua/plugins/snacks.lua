return {
	"folke/snacks.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	priority = 1000,
	lazy = false,
	opts = {
		indent = { enabled = true, only_scope = true },
		picker = {
			layout = "my_telescope_top",
			layouts = {
				my_telescope_top = {
					layout = {
						box = "horizontal",
						backdrop = false,
						width = 0.8,
						height = 0.9,
						border = "none",
						{
							box = "vertical",
							{
								win = "input",
								height = 1,
								border = "rounded",
								title = "{title} {live} {flags}",
								title_pos = "center",
							},
							{ win = "list", title = " Results ", title_pos = "center", border = "rounded" },
						},
						{
							win = "preview",
							title = "{preview:Preview}",
							width = 0.45,
							border = "rounded",
							title_pos = "center",
						},
					},
				},
			},
		},
	},
	keys = {
		{
			"<leader>e",
			function()
				Snacks.picker.explorer()
			end,
			desc = "File Explorer",
		},
	},
}
