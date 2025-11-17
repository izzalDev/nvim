return {
	"nvim-telescope/telescope.nvim",

	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
	},

	keys = function()
		local builtin = require("telescope.builtin")
		return {
			{ "<leader>ff", builtin.find_files, desc = "Find files" },
			{ "<leader>fb", builtin.buffers, desc = "Find buffers" },
			{ "<leader>fh", builtin.help_tags, desc = "Help tags" },
			{ "<leader>fs", builtin.lsp_document_symbols, desc = "Document symbols" },
		}
	end,
	config = function()
		require("telescope").setup({
			extensions = {
				["ui-select"] = { require("telescope.themes").get_dropdown() },
			},
		})
		require("telescope").load_extension("ui-select")
	end,
}
