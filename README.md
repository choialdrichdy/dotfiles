# dotfiles
Here is my dotfiles for my development workflow

## Prerequisites

Install the following:
- stow
- Your Terminal of choice:
  - ghostty
- Shell of choice:
  - [fish](https://fishshell.com/docs/current/index.html#installation)
  - [zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
- [starship](https://starship.rs/guide/#%F0%9F%9A%80-installation)
- [mise-en-place](https://mise.jdx.dev/getting-started.html#installing-mise-cli)
- [fzf](https://github.com/junegunn/fzf#installation)
- [zoxide](https://github.com/ajeetdsouza/zoxide#installation)
- [eza](https://github.com/eza-community/eza/blob/main/INSTALL.md)
- [neovim](https://neovim.io/doc/install/)
- [lazygit](https://github.com/jesseduffield/lazygit#installation)

## How to use
Use stow to symlink the dotfiles to your home directory:
```
# stow -t <destination> <configs to symlink>
stow -t ~ neovim ghostty fish
```
