vim.pack.add({
    "https://github.com/nvim-mini/mini.nvim",
})

-- mini files
local MiniFiles = require("mini.files")
MiniFiles.setup({
    mappings = {
        go_in = "<CR>",
        go_in_plus = "L",
        go_out = "-",
        go_out_plus = "H",
    },
})

vim.keymap.set("n", "<leader>-", function()
    MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
    MiniFiles.reveal_cwd()
end, { desc = "Toggle into currently opened file" })

-- mini notify
require("mini.notify").setup({
    -- only show messages
    content = {
        formet = function(notif)
            return notif.msg
        end,
    },
})

-- mini cmdline completion
require("mini.cmdline").setup({})

-- mini surround
require("mini.surround").setup()
-- Default Keymaps
-- | `sa` | Add surrounding or Direct with 'saiw' |
-- | `sd` | Delete surrounding |
-- | `sr` | Replace surrounding |
-- | `sf` | Find surrounding (right) |
-- | `sF` | Find surrounding (left) |
-- | `sh` | Highlight surrounding |
-- | `sn` | Update n_lines |
-- | `l` / `n` | as suffix for prev/next |
