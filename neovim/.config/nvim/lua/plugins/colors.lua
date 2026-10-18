vim.pack.add({ { src = "https://github.com/ellisonleao/gruvbox.nvim" } })
require("gruvbox").setup({
	terminal_colors = true,
	transparent_mode = true,
})

vim.cmd.colorscheme("gruvbox")
