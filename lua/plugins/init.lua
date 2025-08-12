return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"MunifTanjim/nui.nvim",
		event = "VeryLazy",
	},
	{
		"rcarriga/nvim-notify",
		event = "VeryLazy",
	},
	{
		"nvim-lualine/lualine.nvim",
		config = require("configs.lualine"),
	},
	{
		"nvim-tree/nvim-web-devicons",
		event = "BufReadPost",
	},
	{
		"mikavilpas/yazi.nvim",
		cmd = "YaziToggle",
	},
	{
		"nvim-lua/plenary.nvim",
		event = "VeryLazy",
	},
	{
		"stevearc/oil.nvim",
		lazy = true,
		cmd = { "Oil", "OilOpen", "OilClose" },
		opts = {},
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
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
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
				ensure_installed = { "lua_ls" },
				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = "BufEnter",
		config = function()
			vim.lsp.enable("lua_ls")
		end,
	},
	{
		"folke/snacks.nvim",
		priority = 1000,
		config = require("configs.snacks"),
	},
	{
		"stevearc/conform.nvim",
		event = { "InsertLeave", "BufWritePre" },
		config = require("configs.conform"),
	},
}
