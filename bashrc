export HISTFILESIZE=3000      # the bash history should save 3000 commands
export HISTCONTROL=ignoredups # don't put duplicate lines in the history.

shopt -s histappend
PROMPT_COMMAND='history -a; history -n'

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# enable programmable completion features
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Aliases
alias ps='ps auxf'
alias home='cd ~'
alias pg='ps aux | grep'                                # requires an argument
alias un='tar -zxvf'
alias du1='du -h --max-depth=1'
alias da='date "+%Y-%m-%d %A    %T %Z"'
alias hist='history | grep $1'                          # requires an argument
alias grso='git remote show origin'
alias grpo='git remote prune origin'
alias pcat='pygmentize -O style=native -g'
alias ll='ls -Al'
alias serve='python -m SimpleHTTPServer'

# vagrant aliases
alias vl='vagrant list'
alias vh='vagrant halt'
alias vu='vagrant up'
alias vs='vagrant ssh'
alias vp='vagrant putty'
alias vus='vagrant up && vagrant ssh'
alias vup='vagrant up && vagrant putty'
