vim.pack.add({
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") },
})

-- blink.cmp
require("blink.cmp").setup({
	keymap = { preset = "default" },
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
	signature = { enabled = true },
})
