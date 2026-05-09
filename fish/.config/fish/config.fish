set -x EDITOR nvim
set -x PROJECTS ~/codes

if test -d /opt/nvim-linux-x86_64/bin
    fish_add_path -p /opt/nvim-linux-x86_64/bin
end

if status is-interactive
    alias n nvim
    alias lg lazygit
    alias cd z

    # Setup starship
    starship init fish | source

    # Setup mise
    /home/aldrich/.local/bin/mise activate fish | source

    # Setup zoxide
    zoxide init fish | source

    # Setup fzf
    fzf --fish | source
end
