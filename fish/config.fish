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

# pnpm
set -gx PNPM_HOME "/home/merzouka/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
