return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "",
					[vim.diagnostic.severity.WARN] = "",
					[vim.diagnostic.severity.INFO] = "",
					[vim.diagnostic.severity.HINT] = "",
				},
			},
			virtual_text = true,
			severity_sort = true,
		})

		require("lspconfig").lua_ls.setup({})
		vim.keymap.set("n", "K", vim.lsp.buf.hover)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition)
	end,
}
