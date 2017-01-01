export LANG=en_US.UTF-8
export LESSCHARSET=utf-8

export EDITOR=vim

export LS_COLORS="di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32";

if [ -d /opt/local ]; then
    export SHELL=/opt/local/bin/zsh
elif [ -f /usr/local/bin/zsh ]; then
    export SHELL=/usr/local/bin/zsh
elif [ -f /bin/zsh ]; then
    export SHELL=/bin/zsh
fi

export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/bin:$PATH

# cpad is setup tool ref: http://secondlife.hatenablog.jp/entry/2013/02/21/210807
if [ -d ~/.cpad2 ]; then
    source /Users/taiki-ono/.cpad2/profile
fi

export GOPATH=$HOME/.go
export GOROOT=/usr/local/opt/go/libexec/

export PATH=$HOME/.nodebrew/current/bin:$HOME/.local/bin:$PATH
export PATH=$HOME/.dotfiles/git/contrib/diff-highlight:$HOME/.dotfiles/git/contrib/git-jump:$PATH
export PATH=$HOME/.dotfiles/bin:$PATH
export PATH=$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$PATH
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
export PATH=$HOME/.cabal/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH

# Hackage bins installed by cabal-dev
export PATH=$HOME/.yesod/bin:$PATH
export PATH=$HOME/.pointfree/bin:$PATH
export PATH=$HOME/.hsenv/bin:$PATH
export PATH=$HOME/.hoogle/bin:$PATH
export PATH=$HOME/.hlint/bin:$PATH
export PATH=$HOME/.hasktags/bin:$PATH
export PATH=$HOME/.hothasktags/bin:$PATH

if [ -d ~/.rsense-0.3 ]; then
    export RSENSE_HOME=~/.rsense-0.3
fi

if [ -d ~/.rbenv ]; then
    export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"
    if [ ! -d ~/.cpad ]; then
        eval "$(rbenv init - $SHELL)"
    fi
fi

if [ -f ~/.rbenv/completions/rbenv.zsh ]; then
    source ~/.rbenv/completions/rbenv.zsh
elif [ -f /usr/local/Cellar/rbenv/0.4.0/completions/rbenv.zsh ]; then
    source /usr/local/Cellar/rbenv/0.4.0/completions/rbenv.zsh
fi

if [ -f ~/.local/.zshenv ]; then
    source ~/.local/.zshenv
fi
