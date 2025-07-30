return {
	"neovim/nvim-lspconfig",
	config = function()
		require("lspconfig").lua_ls.setup({})
		vim.keymap.set("n", "K", vim.lsp.buf.hover)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition)
	end,
}
