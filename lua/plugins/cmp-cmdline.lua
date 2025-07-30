return {
	"hrsh7th/cmp-cmdline",
	event = "VeryLazy",
	dependencies = { "nvim-cmp" },
	config = function()
		local cmp = require("cmp")
		local mapping = {
			["<CR>"] = cmp.mapping.confirm({ select = true }),
			["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
			["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
		}

		cmp.setup.cmdline(":", {
			preselect = "none",
			completion = {
				completeopt = "menu,preview,menuone,noselect",
			},
			mapping = mapping,
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
			experimental = {
				ghost_text = true,
				native_menu = false,
			},
		})

		cmp.setup.cmdline("/", {
			preselect = "none",
			completion = {
				completeopt = "menu,preview,menuone,noselect",
			},
			mapping = mapping,
			sources = {
				{ name = "buffer" },
			},
			experimental = {
				ghost_text = true,
				native_menu = false,
			},
		})
	end,
}
