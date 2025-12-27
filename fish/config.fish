
if status is-interactive
end

# adding go binaries
set -gx PATH "$HOME/go/bin/" "$HOME/dotfiles/scripts/" $PATH
# add binaries installed by pip to path
set -gx PATH "$HOME/.local/bin" "$HOME/dotfiles/scripts/" $PATH
# intellij
set -gx PATH "$HOME/editors/idea-IC-252.26830.84/bin" $PATH
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

# ssh
if [ "$SSH_AGENT_PID" = "" ]
    eval (ssh-agent -c) 1> /dev/null
end

# tmuxifier
set -gx PATH "$HOME/.tmuxifier/bin" $PATH
export TMUXIFIER_LAYOUT_PATH="$HOME/.config/tmux/layouts/"
if command -q tmuxifier
    eval (tmuxifier init - fish)
end

# vimtex
set -gx VIMTEX_OUTPUT_DIRECTORY './out'
alias tf='terraform'
alias k='kubectl'
alias d='docker'
alias kcd='kubectl config set-context $(kubectl config current-context) --namespace'

# ardupilot

set -gax PATH $HOME/code/projects/drone/load/sim/ardupilot/Tools/autotest
set -gpx PATH /usr/lib/ccache

# neovim
set -gax PATH /opt/nvim-linux-x86_64/bin

# Pyenv
set -Ux PYENV_ROOT $HOME/.pyenv
test -d $PYENV_ROOT/bin; and fish_add_path $PYENV_ROOT/bin

if command -q pyenv
    pyenv init - fish | source
end

# neovim
if test -d '/opt/nvim-linux-arm64/bin'
    set -gx PATH "/opt/nvim-linux-arm64/bin" $PATH
end

if test -d '/usr/local/go/bin'
    set -gx PATH "/usr/local/go/bin" $PATH
end
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
