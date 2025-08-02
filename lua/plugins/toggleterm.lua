return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup({
			shell = vim.fn.has("win32") == 1 and "pwsh -nologo" or nil,
		})
	end,
}
