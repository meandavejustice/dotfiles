#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export NVM_DIR="/home/meandave/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

PATH=$PATH:/home/meandave/bin/
PATH="`ruby -e 'puts Gem.user_dir'`/bin:$PATH"

eval $(ssh-agent)

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#--PROMPT--
#PS1='[\u@\h \W]\$ ' #The arch default
PS1="\[\033[0;32m\][\u@\h \w]$\[\033[0m\] "

if [ `/usr/bin/whoami` = "root" ] ; then
  # root has a red prompt
  PS1="\[\033[1;31m\]\u@\h \w \$ \[\033[0m\]"
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


#Tab-Completion in sudo and man
complete -cf sudo
complete -cf man
complete -cf optirun


#--ENVIRONMENTAL VARIABLES--
export EDITOR="emacs"

# ignore duplicates in bash history
export HISTCONTROL=ignoredups

# append history from each terminal upon exit
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make bash history ... HUGE!
HISTSIZE=100000
