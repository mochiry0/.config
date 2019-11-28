
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
set -gx PATH $HOME/.pyenv/bin $PATH
eval (pyenv init - | source)

# Ruby PATH
set -gx PATH $HOME/.rbenv/bin $PATH
eval (rbenv init - | source)

# Node.js Path
set -gx PATH $HOME/.nodebrew/current/bin $PATH

# Aliases
alias tree="tree -ACN"
alias startrh='VBoxManage startvm "RHEL7" --type headless'
alias stoprh='VBoxManage controlvm "RHEL7" acpipowerbutton'
alias startri='VBoxManage startvm "RHEL7 IBM" --type headless'
alias stopri='VBoxManage controlvm "RHEL7 IBM" acpipowerbutton'
alias startrr='VBoxManage startvm "RHEL7 Redmine" --type headless'
alias stoprr='VBoxManage controlvm "RHEL7 Redmine" acpipowerbutton'
alias startrr4='VBoxManage startvm "RHEL7 Redmine 4" --type headless'
alias stoprr4='VBoxManage controlvm "RHEL7 Redmine 4" acpipowerbutton'
alias startrc='VBoxManage startvm "RHEL7 RocketChat" --type headless'
alias stoprc='VBoxManage controlvm "RHEL7 RocketChat" acpipowerbutton'
alias startrt='VBoxManage startvm "RHEL7 test" --type headless'
alias stoprt='VBoxManage controlvm "RHEL7 test" acpipowerbutton'
alias startal='VBoxManage startvm "Amazon Linux 2" --type headless'
alias stopal='VBoxManage controlvm "Amazon Linux 2" acpipowerbutton'
alias startgl='VBoxManage startvm "RHEL7 Gitlab" --type headless'
alias stopgl='VBoxManage controlvm "RHEL7 Gitlab" acpipowerbutton'
alias startrj='VBoxManage startvm "RHEL7 Jenkins" --type headless'
alias stoprj='VBoxManage controlvm "RHEL7 Jenkins" acpipowerbutton'
