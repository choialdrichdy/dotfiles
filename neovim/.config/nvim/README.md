# Neovim config

Requires Neovim 0.12+, the tree-sitter CLI, a C compiler and ripgrep. See the [top-level README](../../../README.md) for setup, Mason packages and keybindings.

- `init.lua` loads `lua/{keymaps,options,autocmd,commands,ft}.lua`, then every file in `lua/plugins/` in alphabetical order.
- Plugins are managed by the built-in `vim.pack`; revisions are pinned in `nvim-pack-lock.json`.
