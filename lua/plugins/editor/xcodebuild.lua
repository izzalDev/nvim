if vim.fn.has("mac") == 0 then
	return {}
end

return {
	"wojciech-kulik/xcodebuild.nvim",
	dependencies = {
		-- Uncomment a picker that you want to use, snacks.nvim might be additionally
		-- useful to show previews and failing snapshots.

		-- You must select at least one:
		-- "nvim-telescope/telescope.nvim",
		-- "ibhagwan/fzf-lua",
		-- "folke/snacks.nvim", -- (optional) to show previews

		"MunifTanjim/nui.nvim",
		"nvim-treesitter/nvim-treesitter", -- (optional) for Quick tests support (required Swift parser)
	},
	config = function()
		require("xcodebuild").setup({
			-- put some options here or leave it empty to use default settings
		})
	end,
}
