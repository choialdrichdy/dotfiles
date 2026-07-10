vim.pack.add({
	{ src = "https://github.com/mbbill/undotree" },
})

vim.g.undotree_WindowLayout = 3
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "[U]ndo tree" })
