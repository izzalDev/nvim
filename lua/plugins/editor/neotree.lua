return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"antosha417/nvim-lsp-file-operations",
	},
	keys = {
		{ "<leader>ef", "<cmd>Neotree toggle left<cr>", desc = "Files" },
		{ "<leader>eo", "<cmd>Neotree focus<cr>", desc = "Focus" },
		{ "<leader>es", "<cmd>Neotree toggle left source=document_symbols<cr>", desc = "Document Symbols" },
		{ "<leader>eb", "<cmd>Neotree toggle left source=buffers<cr>", desc = "Buffers" },
		{ "<leader>eg", "<cmd>Neotree toggle left source=git_status<cr>", desc = "Git Status" },
	},
	config = function()
		require("lsp-file-operations").setup({})
		require("neo-tree").setup({
			event_handlers = {
				{
					event = "file_opened",
					handler = function()
						vim.cmd("Neotree close")
					end,
				},
			},
			window = {
				mappings = {
					["<esc>"] = "close_window",
					["q"] = "close_window",
				},
			},
			use_popups_for_input = false,
			sources = { "filesystem", "document_symbols", "buffers", "git_status" },
		})
	end,
}
