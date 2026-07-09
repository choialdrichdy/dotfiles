vim.pack.add({ "https://github.com/dmtrKovalenko/fff.nvim" })

vim.g.fff = {
	lazy_sync = true,
	debug = { enabled = true, show_scores = true },
}

vim.keymap.set("n", "ff", function()
	require("fff").find_files()
end, { desc = "FFFind files" })
