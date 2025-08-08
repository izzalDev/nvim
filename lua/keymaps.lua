local keymap = function(mode, lhs, rhs, desc)
	vim.keymap.set(mode, lhs, rhs, { desc = desc, noremap = true, silent = true })
end

local keymaps = function(mode, mappings)
	for _, map in ipairs(mappings) do
		keymap(mode, map[1], map[2], map[3])
	end
end

keymaps({ "n", "v", "i", "x" }, {
	{ "<S-Down>", "<cmd>t.<cr>" },
	{ "<S-Up>", "<cmd>t -l<cr>" },
})

vim.keymap.set("n", ";", ":")
