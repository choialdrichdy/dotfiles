vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
})

local servers = {
	-- Web
	vtsls = {},
	eslint = {},
	html = {},
	cssls = {},
	jsonls = {},
	-- Markdown
	marksman = {},
	-- Go
	gopls = {},
	-- Python
	basedpyright = {},
	ruff = {},
	-- Lua
	lua_ls = {
		settings = {
			Lua = {
				diagnostics = { globals = { "vim" } },
			},
		},
	},
	-- IaC
	dockerls = {},
	docker_compose_language_service = {},
	yamlls = {
		settings = {
			yaml = {
				-- Only apply the Kubernetes schema to manifest directories, not to
				-- every YAML file (compose, GitHub Actions, Ansible, ...).
				schemas = {
					kubernetes = {
						"k8s/**/*.{yml,yaml}",
						"kubernetes/**/*.{yml,yaml}",
						"manifests/**/*.{yml,yaml}",
					},
				},
			},
		},
	},
	terraformls = {},
	ansiblels = {},
}

require("mason").setup()

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "<leader>cf", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "[C]ode [F]ormat buffer" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show line diagnostics" })

vim.diagnostic.config({ virtual_text = true })

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities({}, false))

vim.lsp.config("*", { capabilities = capabilities })

for server, config in pairs(servers) do
	if next(config) ~= nil then
		vim.lsp.config(server, config)
	end
end

vim.lsp.enable(vim.tbl_keys(servers))
