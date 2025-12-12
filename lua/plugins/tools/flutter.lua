return {
	"nvim-flutter/flutter-tools.nvim",
	ft = "dart",
	cmd = {
		"FlutterRun",
		"FlutterDebug",
		"FlutterDevices",
		"FlutterEmulators",
		"FlutterReload",
		"FlutterRestart",
		"FlutterQuit",
		"FlutterAttach",
		"FlutterDetach",
		"FlutterOutlineToggle",
		"FlutterOutlineOpen",
		"FlutterDevTools",
		"FlutterDevToolsActivate",
		"FlutterCopyProfilerUrl",
		"FlutterLspRestart",
		"FlutterSuper",
		"FlutterReanalyze",
		"FlutterRename",
		"FlutterLogClear",
		"FlutterLogToggle",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>rp", "<cmd>FlutterRun<CR>", desc = "Run Project" },
	},
	config = function()
		require("flutter-tools").setup({
			lsp = {
				color = {
					enabled = true,
				},
			},
			dev_log = {
				open_cmd = "botright 10split",
			},
			widget_guides = {
				enabled = true,
			},
			closing_tags = {
				highlight = "@property",
				enabled = true,
			},
		})

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

		vim.api.nvim_create_autocmd("BufWinEnter", {
			pattern = "__FLUTTER_DEV_LOG__",
			callback = function()
				vim.opt_local.winfixheight = true
			end,
		})
	end,
}
