if status is-interactive
    # Commands to run in interactive sessions can go here
end

# adding go binaries
set -gx PATH "$HOME/go/bin/" "$HOME/dotfiles/scripts/" $PATH

# zoxide
zoxide init fish | source
alias cd=z

# set up nvim as editor
set -gx EDITOR nvim

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
