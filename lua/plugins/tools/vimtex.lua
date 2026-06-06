return {
	"lervag/vimtex",
	lazy = false,
	keys = {
		{ "<leader>lc", "<cmd>VimtexCompile<cr>", desc = "LaTeX Compile Toggle" },
		{ "<leader>lv", "<cmd>VimtexView<cr>", desc = "LaTeX View PDF" },
		{ "<leader>lx", "<cmd>VimtexClean<cr>", desc = "LaTeX Clean Aux Files" },
		{ "<leader>lX", "<cmd>VimtexClean!<cr>", desc = "LaTeX Clean All Files incl PDF" },
		{ "<leader>lk", "<cmd>VimtexStop<cr>", desc = "LaTeX Stop Compiler" },
		{ "<leader>lt", "<cmd>VimtexTocToggle<cr>", desc = "LaTeX Table of Contents Toggle" },
		{ "<leader>li", "<cmd>VimtexInfo<cr>", desc = "LaTeX Show Info" },
		{ "<leader>le", "<cmd>VimtexErrors<cr>", desc = "LaTeX Show Errors" },
		{ "<leader>ls", "<cmd>VimtexStatus<cr>", desc = "LaTeX Compiler Status" },
		{ "<leader>lm", "<cmd>VimtexLog<cr>", desc = "LaTeX Show Full Log" },
		{ "<leader>la", "<cmd>VimtexContext<cr>", desc = "LaTeX Show Context under Cursor" },
	},
	init = function()
		vim.g.vimtex_view_method = "mupdf"
		vim.g.vimtex_mappings_enabled = 0
		vim.g.vimtex_quickfix_open_on_warning = 0
		vim.g.vimtex_toc_config = {
			split_width = 30,
			split_pos = "leftabove",
			mode = 1,
		}
		vim.g.vimtex_compiler_latexmk = {
			out_dir = "build",
		}
	end,
}
