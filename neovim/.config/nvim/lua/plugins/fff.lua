vim.pack.add({ "https://github.com/dmtrKovalenko/fff.nvim" })

vim.g.fff = {
	lazy_sync = true,
	debug = { enabled = true, show_scores = true },
}

vim.keymap.set("n", "ff", function()
	require("fff").find_files()
end, { desc = "FFFind files" })

vim.keymap.set("n", "fg", function()
	require("fff").live_grep()
end, { desc = "LiFFFe grep" })

vim.keymap.set("n", "fz", function()
	require("fff").live_grep({
		grep = {
			modes = {
				"fuzzy",
				"plain",
			},
		},
	})
end, { desc = "Live fffuzzy grep" })

vim.keymap.set("n", "fw", function()
	require("fff").live_grep_under_cursor()
end, { desc = "Search current word / selection" })
