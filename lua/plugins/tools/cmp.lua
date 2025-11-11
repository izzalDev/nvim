return {
	"hrsh7th/nvim-cmp",
	version = false,
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-cmdline",
		"onsails/lspkind-nvim", -- untuk icon formatting
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		local check_backspace = function()
			local col = vim.fn.col(".") - 1
			return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
		end

		local select_next_item = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expandable() then
				luasnip.expand()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif check_backspace() then
				fallback()
			else
				fallback()
			end
		end

		local select_prev_item = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end

		local mapping = cmp.mapping.preset.insert({
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping.confirm({ select = true }),
			["<Tab>"] = cmp.mapping(select_next_item, { "i", "s", "c" }),
			["<S-Tab>"] = cmp.mapping(select_prev_item, { "i", "s", "c" }),
		})

		-- Insert mode setup
		cmp.setup({
			completion = { completeopt = "menu,menuone,noinsert" },
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = mapping,
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
				{ name = "nvim_lua" },
			}),
			formatting = {
				format = function(entry, vim_item)
					local kind = require("lspkind").cmp_format({
						mode = "symbol",
						maxwidth = 25,
						ellipsis_char = "...",
					})(entry, vim_item)

					kind.menu = ({
						nvim_lsp = "[LSP]",
						buffer = "[Buffer]",
						path = "[Path]",
						nvim_lua = "[Lua]",
						luasnip = "[Luasnip]",
					})[entry.source.name] or ""

					return kind
				end,
				fields = { "kind", "abbr", "menu" },
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			experimental = { ghost_text = false },
		})

		-- Cmdline setup
		cmp.setup.cmdline("/", {
			mapping = mapping,
			sources = { { name = "buffer" } },
			completion = { completeopt = "menu,preview,menuone,noselect" },
		})

		cmp.setup.cmdline(":", {
			mapping = mapping,
			sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
			completion = { completeopt = "menu,preview,menuone,noselect" },
		})
	end,
}
