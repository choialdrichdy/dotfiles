local servers = {
    -- Web
    vtsls    = {},
    eslint   = {},
    html     = {},
    cssls    = {},
    jsonls   = {},
    -- Markdown
    marksman = {},
    -- Go
    gopls = {},
    -- Python
    basedpyright = {},
    ruff         = {},
    -- Lua
    lua_ls = {
        settings = {
            Lua = {
                diagnostics = { globals = { "vim" } },
            },
        },
    },
    -- IaC
    dockerls                        = {},
    docker_compose_language_service = {},
    yamlls = {
        settings = {
            yaml = {
                schemas = {
                    kubernetes = "/*.yaml",
                },
            },
        },
    },
    terraformls = {},
    ansiblels   = {},
}

require("mason").setup()

vim.keymap.set("n", "<leader>f", function()
    require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Format buffer" })
vim.keymap.set("n", "df", vim.diagnostic.open_float, { desc = "Show line diagnostics" })

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
