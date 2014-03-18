export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8

export EDITOR=vim

export LS_COLORS="di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32";

if [ -d /opt/local ]; then
    export SHELL=/opt/local/bin/zsh
elif [ -f /usr/local/bin/zsh ]; then
    export SHELL=/usr/local/bin/zsh
    source ~/.bash_profile
else
    export SHELL=/usr/bin/zsh
fi

#export NODEBREW_ROOT=$HOME:.nodebrew
#export PYTHONDONTWRITEBYTECODE=1

export PATH=/usr/local/bin:$PATH
export PATH=$HOME/.nodebrew/current/bin:$HOME/.local/bin:/opt/local/bin:/opt/local/lib/mysql55/bin:/usr/local/bin:/opt/local/sbin/:$PATH
export PATH=$HOME/.dotfiles/git/contrib/diff-highlight:$HOME/.dotfiles/git/contrib/git-jump:$PATH
export PATH=/Library/Haskell/bin:$PATH
export PATH=/Library/Frameworks/GHC.framework/Versions/7.6.3-x86_64/usr/bin:$PATH
export PATH=$HOME/Library/Haskell/bin:$PATH
export PATH=$HOME/.local/old-ghc/bin:$PATH
export PATH=$HOME/.local/ghc/bin:$PATH
export PATH=$HOME/.cabal/bin:$PATH

# Hackage bins installed by cabal-dev
export PATH=$HOME/.yesod/bin:$PATH
export PATH=$HOME/.pointfree/bin:$PATH
export PATH=$HOME/.hsenv/bin:$PATH
export PATH=$HOME/.hoogle/bin:$PATH

export MANPATH=/opt/local/man:$MANPATH


if [ -d ~/.rsense-0.3 ]; then
    export RSENSE_HOME=~/.rsense-0.3
fi

if [ -d ~/.rbenv ]; then
    export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"
    eval "$(rbenv init -)"
fi

if [ -f ~/.rbenv/completions/rbenv.zsh ]; then
    source ~/.rbenv/completions/rbenv.zsh
fi

if [ -d ~/.pyenv ]; then
    export PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(pyenv init -)"
    source ~/.pyenv/completions/pyenv.zsh
fi
