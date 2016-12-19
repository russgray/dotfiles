export HISTFILESIZE=10000      # the bash history should save 3000 commands
export HISTSIZE=10000
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

dcleanup(){
    docker rm -v $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
    docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
}

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
alias gpl='git branch --merged develop | grep -v develop | xargs --no-run-if-empty git branch -d' # prune local branches that have been merged to develop
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
alias vshare='vagrant share --https 443'


# # https://raw.githubusercontent.com/eliben/code-for-blog/master/2016/persistent-history/add-persistent-history.sh
# log_bash_persistent_history()
# {
#   [[
#     $(history 1) =~ ^\ *[0-9]+\ +([^\ ]+\ [^\ ]+)\ +(.*)$
#   ]]
#   local date_part="${BASH_REMATCH[1]}"
#   local command_part="${BASH_REMATCH[2]}"
#   if [ "$command_part" != "$PERSISTENT_HISTORY_LAST" ]
#   then
#     echo $date_part "|" "$command_part" >> ~/.persistent_history
#     export PERSISTENT_HISTORY_LAST="$command_part"
#   fi
# }

# # Stuff to do on PROMPT_COMMAND
# run_on_prompt_command()
# {
#     log_bash_persistent_history
# }

# PROMPT_COMMAND="run_on_prompt_command"
