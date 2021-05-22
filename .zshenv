export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LESSCHARSET=utf-8

export EDITOR=vim

if [ -d /opt/local ]; then
    export SHELL=/opt/local/bin/zsh
elif [ -f /usr/local/bin/zsh ]; then
    export SHELL=/usr/local/bin/zsh
elif [ -f /bin/zsh ]; then
    export SHELL=/bin/zsh
fi

export PATH=/usr/local/sbin:/usr/sbin:/usr/local/bin:$PATH

case "$(uname)" in
  "Linux")
    export GPG_TTY=$(tty)
    export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
    alias ls='ls --color=auto'
    ;;
  "Darwin")
    export PATH="/sbin:${PATH}"

    export PATH="${HOME}/Library/Python/3.7/bin:${PATH}"
    export LS_COLORS="di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32";
    alias ls='ls -G'
    ;;
esac

#if which brew > /dev/null && brew --prefix coreutils > /dev/null; then
#  export PATH="`brew --prefix coreutils`/libexec/gnubin:$PATH"
#  export MANPATH="`brew --prefix coreutils`/libexec/gnuman:$MANPATH"
#fi

export GOPATH=$HOME/.go

export PATH=$HOME/.dotfiles/git/contrib/diff-highlight:$HOME/.dotfiles/git/contrib/git-jump:$PATH
export PATH=$HOME/.dotfiles/bin:$PATH
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
export PATH=$HOME/.cabal/bin:$PATH
if [ -f $HOME/.cargo/env ]; then
    source $HOME/.cargo/env
fi

export XDG_CONFIG_HOME=~/.config

if [ -d ~/.rbenv ]; then
    export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"
    eval "$(rbenv init - $SHELL)"
fi

if [ -f ~/.local/.zshenv ]; then
    source ~/.local/.zshenv
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f "${HOME}/.local/google-cloud-sdk/path.zsh.inc" ]; then . "${HOME}/.local/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "${HOME}/.local/google-cloud-sdk/completion.zsh.inc" ]; then . "${HOME}/.local/google-cloud-sdk/completion.zsh.inc"; fi

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
