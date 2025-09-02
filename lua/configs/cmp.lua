return function()
	local cmp = require("cmp")
	local luasnip = require("luasnip")
	local cmp_autopairs = require("nvim-autopairs.completion.cmp")

	local check_backspace = function()
		local col = vim.fn.col(".") - 1
		return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
	end

	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

	cmp.setup({
		completion = {
			completeopt = "menu,menuone,noinsert",
		},
		mapping = cmp.mapping.preset.insert({
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-l>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping.confirm({ select = true }),
			["<Tab>"] = cmp.mapping(function(fallback)
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
			end, { "i", "s" }),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
			["<Down>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				else
					fallback()
				end
			end, { "i", "s" }),
			["<Up>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				else
					fallback()
				end
			end, { "i", "s" }),
		}),
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
	})
end
