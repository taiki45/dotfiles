PS1='\[\033[36m\][\u@\h:\]\[\033[33m\]\w\]\[\033[35m\]$(__git_ps1 ":%s")\]\[\033[36m\]]\[\033[0m\] \$\] '

source ~/.dotfiles/alias.sh

if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
    . /opt/local/etc/bash_completion
fi

source ~/.bash/git-prompt.sh
source ~/.bash/git-completion.bash

source ~/.bash/itunes_completion.sh
