
# Path
set -U fish_user_paths /usr/local/bin
set -gx PATH /usr/local/bin /usr/sbin /usr/local/sbin $PATH
set -gx PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
set -gx PATH /usr/local/opt/findutils/libexec/gnubin $PATH
set -gx MANPATH /usr/local/share/man $MAINPATH
set -gx MANPATH /usr/local/opt/coreutils/libexec/gnuman $MANPATH
set -gx MANPATH /usr/local/opt/findutils/libexec/gnuman $MANPATH
set -U fish_user_paths (echo $fish_user_paths | tr ' ' '\n' | sort -u)

# Python PATH
set -gx PATH $HOME/.pyenv/shims $PATH
eval (pyenv init - | source)

# Ruby PATH
set -gx PATH $HOME/.rbenv/shims $PATH
eval (rbenv init - | source)

# Node.js Path
set -gx PATH $HOME/.nodebrew/current/bin $PATH

# Aliases
alias tree="tree -ACN"
alias startco='VBoxManage startvm "CentOS7" --type headless'
alias stopco='VBoxManage controlvm "CentOS7" acpipowerbutton'
alias WEXOS="ssh WEXOS"
alias su="sh /Users/rmochizuki/Shell/Script/auto_su.sh"
alias gm="sh /Users/rmochizuki/Shell/Script/git_menu.sh"
