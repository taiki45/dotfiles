# Env setup here because macOS's pathhelper breaks $PATH orders in .zshenv
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LESSCHARSET=utf-8

export EDITOR="code --wait --new-window"

if [ -d /opt/local ]; then
    export SHELL=/opt/local/bin/zsh
elif [ -f /opt/homebrew/bin/zsh ]; then
    export SHELL=/opt/homebrew/bin/zsh
elif [ -f /usr/local/bin/zsh ]; then
    export SHELL=/usr/local/bin/zsh
elif [ -f /bin/zsh ]; then
    export SHELL=/bin/zsh
fi

case "$(uname)" in
  "Linux")
    export GPG_TTY=$(tty)
    export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
    alias ls='ls --color=auto'
    ;;
  "Darwin")
    export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:$PATH

    export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
    export PATH="${HOME}/Library/Python/3.7/bin:${PATH}"
    export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:${PATH}"
    export LS_COLORS="di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32";
    alias ls='ls -G'

    if [ -n "${REMOTEHOST}${SSH_CONNECTION}" ]; then
      if [ ! -e "${SSH_AUTH_SOCK}" ]; then
        mkdir -p "$(dirname ${SSH_AUTH_SOCK})"
        eval "$(ssh-agent -s -a ${SSH_AUTH_SOCK})"
      fi
    fi

    export PATH="${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin:$PATH"
    ;;
esac

export PATH="${HOME}/bin:${PATH}"
export PATH="${HOME}/.local/bin:${PATH}"

export GOPATH=$HOME/.go

# Official Go tarball installs land in /usr/local/go. Guarded and appended, so
# it stays a no-op where Homebrew already put go on PATH.
[ -d /usr/local/go/bin ] && export PATH=$PATH:/usr/local/go/bin

export PATH=$GOPATH/bin:$PATH
export PATH=$HOME/.cabal/bin:$PATH
export XDG_CONFIG_HOME=~/.config

if [ -d ~/.rbenv ]; then
    export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"
    eval "$(rbenv init - $SHELL)"
fi

if [ -f $HOME/.cargo/env ]; then
    source $HOME/.cargo/env
fi

if [ -f $HOME/.local/.zshrc ]; then
    source $HOME/.local/.zshrc
fi

## General
# Emacs like key bind
bindkey -e

# Don't match globs
setopt no_nomatch

## History
HISTFILE=~/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000
setopt hist_ignore_dups
setopt hist_reduce_blanks
setopt share_history

# ignore history started with space
setopt hist_ignore_space

# Add history when command executed
setopt inc_append_history

# Remove (fc -L) commnad
setopt hist_no_store

# Add zsh start and end in history
setopt extended_history

setopt no_flow_control

autoload history-search-end

# ヒストリを呼び出してから実行する間に一旦編集可能
setopt hist_verify

autoload -U compinit && compinit

[[ -r ~/.zshrc.private ]] && source ~/.zshrc.private

if command -v mise > /dev/null 2>&1; then
    eval "$(mise activate zsh)"
fi
