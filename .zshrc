eval "$(mise activate zsh)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Aliases
alias lg='lazygit'
alias ls='eza'
alias cd='z'
