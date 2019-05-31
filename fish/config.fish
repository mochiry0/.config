
# Path
set -U fish_user_paths /usr/local/bin
set -g -x PATH /usr/local/bin /usr/sbin /usr/local/sbin $PATH
set -g -x PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
set -g -x PATH /usr/local/opt/findutils/libexec/gnubin $PATH
set -g -x MANPATH /usr/local/share/man $MAINPATH
set -g -x MANPATH /usr/local/opt/coreutils/libexec/gnuman $MANPATH
set -g -x MANPATH /usr/local/opt/findutils/libexec/gnuman $MANPATH

set -g -x HOMEBREW_INSTALL_CLEANUP 1
set -U fish_user_paths (echo $fish_user_paths | tr ' ' '\n' | sort -u)

set -g -x PATH $HOME/.pyenv/shims $PATH
eval (pyenv init - | source)

# Aliases
alias vi="vim"
alias la="ls -alhF"
alias ll="ls -lhF"
alias du="du -h"
alias df="df -h"
alias su="su -l"
alias tree="tree -ACN"
alias startco='VBoxManage startvm "CentOS7" --type headless'
alias stopco='VBoxManage controlvm "CentOS7" acpipowerbutton'
alias WEXOS="ssh WEXOS"
alias su="sh /Users/rmochizuki/Shell/Script/auto_su.sh"
alias gm="sh /Users/rmochizuki/Shell/Script/git_menu.sh"
