return {
	"nvim-flutter/flutter-tools.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("flutter-tools").setup({})

		local function flutter_reload(args)
			local bufnr = args.buf
			local has_errors = not require("utils").has_no_errors(bufnr)
			if has_errors then
				return
			end
			vim.cmd("FlutterReload")
		end

		vim.api.nvim_create_autocmd({ "BufWritePost", "TextChanged" }, {
			pattern = "*.dart",
			callback = function(args)
				local function perform_reload()
					flutter_reload(args)
				end
				vim.defer_fn(perform_reload, 300)
			end,
		})
	end,
}
