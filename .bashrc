source ~/.bash/git-prompt.sh
source ~/.bash/git-completion.bash

PS1='\[\033[36m\][\u@\h:\]\[\033[33m\]\w\]\[\033[35m\]$(__git_ps1 ":%s")\]\[\033[36m\]]\[\033[0m\] \$\] '

export PATH=/opt/local/bin:/usr/local/bin:/opt/local/sbin/:$PATH
export MANPATH=/opt/local/man:$MANPATH
export RSENSE_HOME=~/.rsense-0.3

if [ -s ${HOME}/.rbenv ]; then 
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
  source ~/.rbenv/completions/rbenv.bash
fi

export EDITOR=vim
export TERM=xterm-color

export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
export HISTCONTROL=ignoreboth

source ~/.dotfiles/.aliasrc

if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
    . /opt/local/etc/bash_completion
fi

source ~/.bash/itunes_completion.sh
