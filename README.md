# dotfiles

A collection of configuration files managed with [GNU Stow](https://www.gnu.org/software/stow/).

## What's inside

| Package    | Contents                                                                                                                                         |
| ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------ |
| `ghostty`  | [Ghostty](https://ghostty.org/) terminal emulator config (Moonfly theme, JetBrainsMono Nerd Font)                                                |
| `neovim`   | Neovim config using `vim.pack` (built-in 0.11+ plugin manager), native `vim.lsp.enable()`, Mason, Treesitter                                     |
| `starship` | [Starship](https://starship.rs/) prompt with Catppuccin-based custom palette (also includes gruvbox, tokyonight, solarized, one-dark presets)    |
| `tmux`     | Tmux config with true color, vi mode, TPM plugins (resurrect, continuum, vim-tmux-navigator)                                                     |
| `wezterm`  | [WezTerm](https://wezfurlong.org/wezterm/) terminal emulator config (Catppuccin Mocha, JetBrainsMono Nerd Font, no tab bar)                      |
| `herdr`    | [Herdr](https://herdr.dev/) terminal multiplexer config (Catppuccin, vim-style Ctrl+h/j/k/l pane nav, lazygit binding)                     |
| `zsh`      | Zsh config with Zinit plugin manager, syntax highlighting, autosuggestions, fzf-tab, completions, aliases, integrations (mise, zoxide, starship) |

## Prerequisites

Install these on your system before deploying:

| Tool                                                             | Package                                                                                                |
| ---------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| [GNU Stow](https://www.gnu.org/software/stow/)                   | Core — creates symlinks                                                                                |
| [Neovim](https://neovim.io/doc/install/)                         | ≥ 0.11 (required for `vim.pack` and `vim.lsp.enable()`)                                                |
| [Zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)    | Shell (if using the zsh config)                                                                        |
| [starship](https://starship.rs/guide/#%F0%9F%9A%80-installation) | Prompt                                                                                                 |
| [mise](https://mise.jdx.dev/getting-started.html)                | Runtime/version manager                                                                                |
| [fzf](https://github.com/junegunn/fzf#installation)              | Fuzzy finder                                                                                           |
| [zoxide](https://github.com/ajeetdsouza/zoxide#installation)     | Smarter `cd`                                                                                           |
| [eza](https://github.com/eza-community/eza/blob/main/INSTALL.md) | Modern `ls` replacement                                                                                |
| [bat](https://github.com/sharkdp/bat#installation)               | Modern `cat` replacement                                                                               |
| [ripgrep](https://github.com/BurntSushi/ripgrep#installation)    | Search                                                                                                 |
| [lazygit](https://github.com/jesseduffield/lazygit#installation) | Git TUI                                                                                                |
| [fd](https://github.com/sharkdp/fd#installation)                 | File finder (used by fzf)                                                                              |
| [Herdr](https://herdr.dev/)                                        | Terminal multiplexer (via npm: `npm install -g @herdr/herdr`)                                           |
| Terminal                                                         | [Ghostty](https://ghostty.org/download) or [WezTerm](https://wezfurlong.org/wezterm/installation.html) |

## Installation

Clone the repo, then use `stow` to symlink the configs you want into your home directory:

```bash
git clone https://github.com/aldrich/dotfiles ~/dotfiles
cd ~/dotfiles

# Deploy individual packages
stow -t ~ neovim
stow -t ~ zsh
stow -t ~ starship

# Or deploy multiple at once
stow -t ~ neovim ghostty herdr wezterm starship tmux zsh
```

> **Note:** To undo a stow, run `stow -D -t ~ <package>`.

## Post-install

### Neovim

1. Open Neovim — plugins install automatically via `:PackUpdate` (triggered by `Pack` command in `lua/commands.lua`).
2. Run `:Mason` to install LSP servers, linters, and formatters.
3. Treesitter grammars auto-install on first load.
4. Run `:checkhealth` to verify everything is set up correctly.

### Tmux

1. Install TPM plugins: press `prefix` + `I` (capital I) inside tmux.
2. Restore sessions is enabled via tmux-continuum (save every 15 min, auto-restore on launch).

### Zsh

1. Zinit installs itself automatically on first shell launch.
2. Required tools in `$PATH`: `mise`, `fzf`, `zoxide`, `starship`, `eza`, `bat`, `fd`.

## Structure

Each top-level directory is a **stow package**. They mirror the `~/.config/` layout:

```
dotfiles/
├── ghostty/
│   └── .config/ghostty/config
├── neovim/
│   └── .config/nvim/
│       ├── init.lua
│       └── lua/
├── starship/
│   └── .config/starship.toml
├── tmux/
│   └── .config/tmux/tmux.conf
├── wezterm/
│   └── .wezterm.lua
├── herdr/
│   └── .config/herdr/config.toml
└── zsh/
    ├── .zshenv
    └── .zshrc
```

## Quick reference

| Command                        | What it does                                                |
| ------------------------------ | ----------------------------------------------------------- |
| `stow -t ~ neovim`             | Symlink Neovim config                                       |
| `stow -D -t ~ neovim`          | Remove Neovim symlinks                                      |
| `stow -t ~ neovim zsh ghostty` | Deploy multiple                                             |
| `:PackUpdate` (nvim)           | Update Neovim plugins                                       |
| `:Mason` (nvim)                | Manage LSP/tools                                            |
| `prefix + I` (tmux)            | Install TPM plugins                                         |
