return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup()
		vim.api.nvim_create_autocmd("VimLeavePre", {
			callback = function()
				pcall(vim.cmd, "NoiceDismiss")
			end,
		})
	end,
}
