local function config()
	require("code_runner").setup({
		mode = "float",
		float = {
			border = "rounded",
		},
	})

	vim.api.nvim_create_autocmd("FileType", {
		pattern = "crunner",
		callback = function(ev)
			vim.keymap.set("n", "q", "<cmd>close<cr>", {
				buffer = ev.buf,
				silent = true,
			})
			vim.keymap.set("n", "<esc>", "<cmd>close<cr>", {
				buffer = ev.buf,
				silent = true,
			})
		end,
	})
end

return {
	"CRAG666/code_runner.nvim",
	cmd = { "RunCode", "RunFile", "RunProject", "RunClose" },
	keys = {
		{ "<leader>rr", "<cmd>RunCode<CR>", desc = "Run Code" },
		{ "<leader>rf", "<cmd>RunFile<CR>", desc = "Run File" },
		{ "<leader>rp", "<cmd>RunProject<CR>", desc = "Run Project" },
	},
	config = config,
}
