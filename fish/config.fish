if status is-interactive
    # interactive-only config goes here (e.g. key bindings, prompt)
end

# go
if test -d '/usr/local/go/bin'
    fish_add_path /usr/local/go/bin
end
fish_add_path $HOME/go/bin
fish_add_path $HOME/dotfiles/scripts

# pip binaries
fish_add_path $HOME/.local/bin

# intellij
fish_add_path $HOME/editors/idea-IC-252.26830.84/bin

# android cmd-tools
fish_add_path $HOME/Android/Sdk/cmdline-tools/latest/bin

# neovim (x86)
fish_add_path /opt/nvim-linux-x86_64/bin

# neovim (arm64 — only if present)
if test -d '/opt/nvim-linux-arm64/bin'
    fish_add_path /opt/nvim-linux-arm64/bin
end

# ardupilot / ccache
fish_add_path $HOME/code/projects/drone/load/sim/ardupilot/Tools/autotest
fish_add_path /usr/lib/ccache

# tmuxifier
fish_add_path $HOME/.tmuxifier/bin

# pnpm
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
fish_add_path $PNPM_HOME

# bun
set -gx BUN_INSTALL "$HOME/.bun"
fish_add_path $BUN_INSTALL/bin

# opencode
fish_add_path $HOME/.opencode/bin

# environment
set -gx EDITOR nvim
set -gx VIMTEX_OUTPUT_DIRECTORY './out'
set -gx TMUXIFIER_LAYOUT_PATH "$HOME/.config/tmux/layouts/"

# aliases
alias vim=nvim
alias tf=terraform
alias k=kubectl
alias d=docker
alias cd=z

function kcd
    kubectl config set-context (kubectl config current-context) --namespace $argv
end

# zoxide
if command -q zoxide
    zoxide init fish | source
else
    echo "Zoxide is missing..."
end

# tmuxifier
if command -q tmuxifier
    tmuxifier init - fish | source
end

# pyenv
set -Ux PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/bin
if command -q pyenv
    pyenv init - fish | source
end

# ssh agent
if test -z "$SSH_AGENT_PID"
    eval (ssh-agent -c) 1> /dev/null
end

# api keys
set keys_file "$HOME/.config/opencode/.api-keys"
if test -e $keys_file
    set -gx GOOGLE_GENERATIVE_AI_API_KEY \
        (grep -i 'GEMINI=' $keys_file | sed 's/.*GEMINI=//')
end
