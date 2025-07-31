if status is-interactive
    # Commands to run in interactive sessions can go here
end

# adding go binaries
set -gx PATH "$HOME/go/bin/" "$HOME/dotfiles/scripts/" $PATH
# add binaries installed by pip to path
set -gx PATH "$HOME/.local/bin" "$HOME/dotfiles/scripts/" $PATH
# intellij
set -gx PATH "$HOME/editors/idea-IU-243.23654.153/bin" $PATH
# android cmd-tools
set -gx PATH "$HOME/Android/Sdk/cmdline-tools/latest/bin" $PATH

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

# tmuxifier
set -gx PATH "$HOME/.tmuxifier/bin" $PATH
eval (tmuxifier init - fish)
export TMUXIFIER_LAYOUT_PATH="$HOME/.config/tmux/layouts/"

# vimtex
set -gx VIMTEX_OUTPUT_DIRECTORY './out'
alias tf='terraform'
alias k='kubectl'

# ardupilot

set -gax PATH $HOME/code/projects/drone/load/sim/ardupilot/Tools/autotest
set -gpx PATH /usr/lib/ccache

# neovim
set -gax PATH /opt/nvim-linux-x86_64/bin

# Pyenv
set -Ux PYENV_ROOT $HOME/.pyenv
test -d $PYENV_ROOT/bin; and fish_add_path $PYENV_ROOT/bin

pyenv init - fish | source
