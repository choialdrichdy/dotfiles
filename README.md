# dotfiles

Personal configuration files, managed with [GNU Stow](https://www.gnu.org/software/stow/). Each top-level directory is a stow package that mirrors the layout of `$HOME`, so `stow -t ~ <package>` symlinks it into place.

The setup is built around Gruvbox Dark and JetBrainsMono Nerd Font across the terminal, multiplexer and editor.

## What's inside

| Package    | Contents                                                                                                                            |
| ---------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| `ghostty`  | [Ghostty](https://ghostty.org/) terminal: Gruvbox Dark, JetBrainsMono Nerd Font Mono, 90% opacity, zsh shell integration            |
| `wezterm`  | [WezTerm](https://wezfurlong.org/wezterm/) terminal: Gruvbox Dark, no tab bar, macOS-style word/line editing keys                    |
| `tmux`     | tmux: `Ctrl-s` prefix, vi copy mode, Gruvbox powerline status bar, TPM (resurrect, continuum, vim-tmux-navigator)                    |
| `herdr`    | [Herdr](https://herdr.dev/) multiplexer: `Ctrl-s` prefix, Gruvbox, `Ctrl-h/j/k/l` pane focus, lazygit pane                         |
| `neovim`   | Neovim 0.12+: `vim.pack` plugins with a lockfile, native `vim.lsp`, Mason, Treesitter (`main`), blink.cmp, conform, mini, fff       |
| `zsh`      | Zsh: Zinit, syntax highlighting, autosuggestions, fzf-tab, OMZ git/aws/kubectl snippets, mise, zoxide, direnv, worktrunk            |
| `starship` | [Starship](https://starship.rs/) prompt: Catppuccin-based palette, plus gruvbox, tokyonight, solarized and one-dark palettes         |

## Prerequisites

**Core**

| Tool                                                             | Why                                                               |
| ---------------------------------------------------------------- | ----------------------------------------------------------------- |
| [GNU Stow](https://www.gnu.org/software/stow/)                   | Creates the symlinks                                              |
| git, curl                                                        | Zinit, TPM and `vim.pack` clone plugins on first run              |
| A [Nerd Font](https://www.nerdfonts.com/)                        | JetBrainsMono Nerd Font is configured; icons break without one    |
| Terminal                                                         | [Ghostty](https://ghostty.org/download) or [WezTerm](https://wezfurlong.org/wezterm/installation.html) |

**Shell (`zsh` package)**

| Tool                                                             | Why                                                  |
| ---------------------------------------------------------------- | ---------------------------------------------------- |
| [Zsh](https://www.zsh.org/)                                      | Shell                                                |
| [starship](https://starship.rs/guide/#%F0%9F%9A%80-installation) | Prompt                                               |
| [mise](https://mise.jdx.dev/getting-started.html)                | Runtime/version manager                              |
| [fzf](https://github.com/junegunn/fzf#installation)              | Fuzzy finder (`Ctrl-t`, `Ctrl-r`, `Ctrl-f`, fzf-tab) |
| [fd](https://github.com/sharkdp/fd#installation)                 | File source for fzf                                  |
| [bat](https://github.com/sharkdp/bat#installation)               | fzf previews                                         |
| [zoxide](https://github.com/ajeetdsouza/zoxide#installation)     | Replaces `cd`                                        |
| [eza](https://github.com/eza-community/eza/blob/main/INSTALL.md) | `ls`, `ll`, `la`, `tree`                             |
| [lazygit](https://github.com/jesseduffield/lazygit#installation) | `lg` alias, herdr lazygit pane                       |

Optional; each is skipped or only needed when you use it: [direnv](https://direnv.net/), [worktrunk](https://github.com/max-sixty/worktrunk) (`wt`), [lf](https://github.com/gokcehan/lf).

**Editor (`neovim` package)**

| Tool                                                                       | Why                                                        |
| -------------------------------------------------------------------------- | ---------------------------------------------------------- |
| [Neovim](https://neovim.io/doc/install/) ≥ 0.12                            | `vim.pack`, `:restart` and the new UI need 0.12            |
| [tree-sitter CLI](https://github.com/tree-sitter/tree-sitter) + a C compiler | nvim-treesitter `main` compiles parsers locally          |
| [ripgrep](https://github.com/BurntSushi/ripgrep#installation)              | Grep backend                                               |
| `unzip`, `tar`, `gzip`                                                     | Used by Mason to unpack servers                            |

## Installation

```bash
git clone git@github.com:choialdrichdy/dotfiles.git ~/codes/dotfiles
cd ~/codes/dotfiles

# Deploy the packages you want
stow -t ~ zsh neovim tmux ghostty

# Or everything
stow -t ~ ghostty wezterm tmux herdr neovim zsh starship
```

The repo can live anywhere, because `-t ~` always targets your home directory. Use `stow -n -v -t ~ <package>` to see what would be linked without changing anything, and `stow -D -t ~ <package>` to remove a package's links.

If a real file already exists where stow wants to put a link (e.g. a default `~/.zshrc`), stow refuses and reports a conflict. Move the existing file out of the way and run it again.

## Post-install

### Zsh

Open a new shell. Zinit clones itself and its plugins on the first launch, which takes a few seconds.

### Tmux

1. Clone TPM: `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
2. Start tmux and press `Ctrl-s` then `I` to install the plugins.

Sessions are saved every 15 minutes by tmux-continuum and restored automatically when tmux starts.

### Neovim

1. Start `nvim`. `vim.pack` installs the plugins on first launch at the revisions pinned in `nvim-pack-lock.json`, then Treesitter compiles its parsers.
2. Install language servers and formatters through Mason:

   ```vim
   :MasonInstall vtsls eslint-lsp html-lsp css-lsp json-lsp marksman gopls basedpyright ruff lua-language-server dockerfile-language-server docker-compose-language-service yaml-language-server terraform-ls ansible-language-server stylua prettierd goimports gofumpt
   ```

   Install only what you need for the languages you use.
3. Run `:checkhealth` to confirm the setup.

## Keybindings

### tmux (prefix `Ctrl-s`)

| Key                     | Action                                 |
| ----------------------- | -------------------------------------- |
| `Ctrl-h/j/k/l`          | Move between panes and Neovim splits   |
| `prefix h/j/k/l`        | Resize pane (repeatable)               |
| `Alt-H` / `Alt-L`       | Previous / next window                 |
| `Alt-1` … `Alt-9`       | Jump to window                         |
| `prefix v`              | Enter copy mode (`v` select, `y` copy) |
| `prefix n`              | New named session                      |
| `prefix r`              | Reload config                          |

### Neovim (leader `Space`)

| Key                          | Action                                  |
| ---------------------------- | --------------------------------------- |
| `<leader>ff`                 | Find files (fff)                        |
| `<leader>fg` / `<leader>fz`  | Live grep / fuzzy grep                  |
| `<leader>fw`                 | Grep word under cursor                  |
| `<leader>-`                  | File explorer (mini.files)              |
| `<leader>cf`                 | Format buffer (also runs on save)       |
| `<leader>e`                  | Show line diagnostics                   |
| `gd`                         | Go to definition                        |
| `<leader>s`                  | Substitute word under cursor            |
| `<leader>u`                  | Undotree                                |
| `<leader>d`                  | Delete without yanking                  |
| `<leader>re`                 | Restart Neovim                          |

Plugin commands: `:PackUpdate [names]` updates plugins, `:PackSync` resets them to the lockfile, and `:PackAdd` / `:PackDel` add or remove plugins.

### Zsh

| Key / alias        | Action                                       |
| ------------------ | -------------------------------------------- |
| `Ctrl-t`           | Insert file path (fzf, includes hidden)      |
| `Ctrl-f`           | Insert file path (fzf, excludes hidden)      |
| `Ctrl-r`           | Search history (fzf)                         |
| `Ctrl-p` / `Ctrl-n`| History search matching the first word typed |
| `cd <partial>`     | Jump to a frecent directory (zoxide); `cdi` picks interactively |
| `-`                | Previous directory                           |
| `lg`, `n`, `t`, `ta` | lazygit, nvim, tmux, tmux attach           |

## Structure

```
dotfiles/
├── ghostty/   .config/ghostty/config
├── herdr/     .config/herdr/config.toml
├── neovim/    .config/nvim/
│              ├── init.lua               entry point
│              ├── nvim-pack-lock.json    pinned plugin revisions
│              └── lua/
│                  ├── options.lua, keymaps.lua, autocmd.lua, commands.lua, ft.lua
│                  └── plugins/           one file per plugin, loaded alphabetically
├── starship/  .config/starship.toml
├── tmux/      .config/tmux/tmux.conf
├── wezterm/   .wezterm.lua
└── zsh/       .zshenv   environment for every shell (XDG, EDITOR, PATH)
               .zshrc    interactive shell
```

To add a Neovim plugin, create a new file in `lua/plugins/` that calls `vim.pack.add` and sets the plugin up. It is picked up automatically.
