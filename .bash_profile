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
