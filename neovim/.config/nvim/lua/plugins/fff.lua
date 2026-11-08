vim.pack.add({ "https://github.com/dmtrKovalenko/fff.nvim" })

vim.g.fff = {
	lazy_sync = true,
}

-- Leader-prefixed so they don't shadow the built-in f{char} motion.
vim.keymap.set("n", "<leader>ff", function()
	require("fff").find_files()
end, { desc = "[F]ind [F]iles" })

vim.keymap.set("n", "<leader>fg", function()
	require("fff").live_grep()
end, { desc = "[F]ind by [G]rep" })

vim.keymap.set("n", "<leader>fz", function()
	require("fff").live_grep({
		grep = {
			modes = {
				"fuzzy",
				"plain",
			},
		},
	})
end, { desc = "[F]ind by fu[Z]zy grep" })

vim.keymap.set("n", "<leader>fw", function()
	require("fff").live_grep_under_cursor()
end, { desc = "[F]ind current [W]ord" })
