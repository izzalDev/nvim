return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			require("which-key").setup({
				preset = "helix",
				defaults = {},
				spec = {
					{
						mode = { "n", "v" },
						{ "<leader>f", group = "file/find" },
						{ "<leader>g", group = "git" },
						{
							"<leader>b",
							group = "buffer",
							expand = function()
								return require("which-key.extras").expand.buf()
							end,
						},
						{
							"<leader>w",
							group = "windows",
							proxy = "<c-w>",
							expand = function()
								return require("which-key.extras").expand.win()
							end,
						},
					},
				},
			})
		end,
	},
	{ "folke/noice.nvim", event = "VeryLazy", config = require("configs.noice") },
	{ "MunifTanjim/nui.nvim", event = "VeryLazy" },
	{ "rcarriga/nvim-notify", event = "VeryLazy" },
	{ "nvim-lualine/lualine.nvim", config = require("configs.lualine") },
	{ "nvim-tree/nvim-web-devicons", event = "BufReadPost" },
	{ "mikavilpas/yazi.nvim", cmd = "YaziToggle" },
	{ "nvim-lua/plenary.nvim", event = "VeryLazy" },
	{ "stevearc/oil.nvim", lazy = true, cmd = { "Oil", "OilOpen", "OilClose" }, opts = {} },
	{ "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },
	{ "hrsh7th/cmp-nvim-lsp", event = "VeryLazy" },
	{ "hrsh7th/cmp-buffer", event = "VeryLazy" },
	{ "hrsh7th/cmp-path", event = "VeryLazy" },
	{ "hrsh7th/cmp-nvim-lua", event = "VeryLazy" },
	{ "onsails/lspkind.nvim", event = "VeryLazy" },
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = require("configs.cmp"),
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("configs.gitsigns")
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup({
				ui = { backdrop = 100, border = "rounded" },
			})
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		event = "BufEnter",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls", "pyright", "powershell_es", "bashls" },
				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = "BufEnter",
		config = function()
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("bashls")
			vim.lsp.enable("dartls")
		end,
	},
	{
		"folke/snacks.nvim",
		priority = 1000,
		config = require("configs.snacks"),
	},
	{
		import = "plugins.tools",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "lua", "markdown", "markdown_inline", "gitcommit" },
				auto_install = true,
				highlight = {
					enable = true,
				},
			})
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		lazy = false,
		config = function()
			require("neo-tree").setup()
		end,
	},
	{
		"JezerM/oil-lsp-diagnostics.nvim",
		config = function()
			require("oil-lsp-diagnostics").setup({})
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		enabled = false,
		config = function()
			local toggleterm = require("toggleterm")
			local Terminal = require("toggleterm.terminal").Terminal

			toggleterm.setup({
				shell = "pwsh -NoLogo",
				highlights = {
					Normal = { guibg = "NONE" },
				},
				shade_terminals = false,
				float_opts = { border = "rounded" },
			})

			-- Terminal keymaps (for terminal buffers)
			function _G.set_terminal_keymaps()
				local opts = { buffer = 0 }
				vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
				vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
				vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
				vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
				vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
				vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
				vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
			end
			vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

			-- single lazygit floating terminal (reuse the same instance)
			local lazygit = Terminal:new({ cmd = "lazygit", direction = "float", hidden = true })
			function _LAZYGIT_TOGGLE()
				lazygit:toggle()
			end

			-- create a NEW horizontal split terminal (fresh instance each time)
			function _NEW_HORIZONTAL_TERM()
				local t = Terminal:new({
					direction = "horizontal",
					size = 15, -- height in lines
					close_on_exit = true, -- auto close when process exits
					on_open = function(t)
						vim.cmd("startinsert")
					end,
				})
				t:toggle()
			end

			-- create a NEW vertical split terminal (fresh instance each time)
			function _NEW_VERTICAL_TERM()
				local t = Terminal:new({
					direction = "vertical",
					size = 80, -- width in columns
					close_on_exit = true,
					on_open = function(t)
						vim.cmd("startinsert")
					end,
				})
				t:toggle()
			end

			-- create a NEW tab terminal (fresh instance each time)
			function _NEW_TAB_TERM()
				local t = Terminal:new({
					direction = "tab",
					close_on_exit = true,
					on_open = function(t)
						vim.cmd("startinsert")
					end,
				})
				t:toggle()
			end
		end,

		keys = {
			{ "<leader>t", "", desc = "Terminal", mode = "n" },
			{ "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float (toggle)", mode = "n" },

			-- Create NEW terminals (not just toggle)
			{ "<leader>th", "<cmd>lua _NEW_HORIZONTAL_TERM()<cr>", desc = "New Horizontal Terminal", mode = "n" },
			{ "<leader>tn", "<cmd>lua _NEW_VERTICAL_TERM()<cr>", desc = "New Vertical Split Terminal", mode = "n" },
			{ "<leader>ts", "<cmd>lua _NEW_TAB_TERM()<cr>", desc = "New Tab Terminal", mode = "n" },

			-- Lazygit (toggle single floating instance)
			{ "<leader>tg", "<cmd>lua _LAZYGIT_TOGGLE()<cr>", desc = "Lazygit", mode = "n" },
		},
	},
	{ "zapling/mason-conform.nvim" },
}
