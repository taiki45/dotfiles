PS1='\[\033[36m\][\u\]\[\033[33m\]\w\]\[\033[36m\]]\[\033[0m\] \$\] '

source ~/.dotfiles/alias.sh

if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
    . /opt/local/etc/bash_completion
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

if [ -d ~/.rbenv ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
    source ~/.rbenv/completions/rbenv.zsh
fi
