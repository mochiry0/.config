
# Path
set -U fish_user_paths /usr/local/bin
set -gx PATH /usr/local/bin /usr/sbin /usr/local/sbin $PATH
set -gx MANPATH /usr/local/share/man $MAINPATH
set -U fish_user_paths (echo $fish_user_paths | tr ' ' '\n' | sort -u)

# Python PATH
set -gx PATH $HOME/.pyenv/bin $PATH
eval (pyenv init - | source)

# Ruby PATH
set -gx PATH $HOME/.rbenv/bin $PATH
eval (rbenv init - | source)

# Node.js Path
set -gx PATH $HOME/.nodebrew/current/bin $PATH

eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# Aliases
