# ---------- XDG base directories ----------
# Centralizes config/cache/data locations
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# ---------- Editor ----------
# Default editor used by git, crontab, etc.
export EDITOR="nvim"
export VISUAL="nvim"

# ---------- Pager ----------
# if command -v bat >/dev/null 2>&1; then
  # export MANPAGER="bat -l man -p"
# elif command -v batcat >/dev/null 2>&1; then
  # export MANPAGER="batcat -l man -p"
# fi

# ---------- GPG ----------
export GPG_TTY=$(tty)

# ---------- PATH ----------
# Personal binaries/scripts
export PATH="$HOME/.local/bin:$PATH"

# Neovim on linux
if [[ -d "/opt/nvim-linux-x86_64/bin" ]]; then
    export PATH="/opt/nvim-linux-x86_64/bin:$PATH"
fi

if [[ $OSTYPE == "darwin" ]]; then
    mkdir -p ~/.1password && ln -s ~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock ~/.1password/agent.sock
fi

export SSH_AUTH_SOCK=~/.1password/agent.sock
