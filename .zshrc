## .zshenv
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LESSCHARSET=utf-8

export EDITOR=nvim

export PATH=/usr/local/sbin:/usr/sbin:/usr/local/bin:$PATH

if [ -d /opt/local ]; then
    export SHELL=/opt/local/bin/zsh
elif [ -f /opt/homebrew/bin/zsh ]; then
    export SHELL=/opt/homebrew/bin/zsh
    export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:$PATH
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
    export PATH="/sbin:${PATH}"

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

    eval "$(atuin init zsh --disable-up-arrow)"

    export PATH="${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin:$PATH"
    ;;
esac

export PATH="${HOME}/bin:${PATH}"
export PATH="${HOME}/.local/bin:${PATH}"

export GOPATH=$HOME/.go

export PATH=$HOME/.dotfiles/bin:$PATH
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
export PATH=$HOME/.cabal/bin:$PATH
export XDG_CONFIG_HOME=~/.config

if [ -d ~/.rbenv ]; then
    export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"
    eval "$(rbenv init - $SHELL)"
fi

if [ -f $HOME/.cargo/env ]; then
    source $HOME/.cargo/env
fi

if [ -f ~/.local/.zshenv ]; then
    source ~/.local/.zshenv
fi

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

export PATH="${HOME}/.claude/local:${PATH}"

## .zshrc

## General
# Emacs like key bind
bindkey -e

# Don't match globs
setopt no_nomatch

## Functions
function ghqcd() {
    cd $(ghq list -p | peco --query=$@)
}

function ghb() {
    value=$(echo "${PWD}" | sed -e "s#/#\\\/#g")
    gh browse $(echo $@ | sed "s/${value}\///")
}

export FZF_DEFAULT_OPTS='--layout=reverse'

## Complettion
# Set fpath
[ -d $HOME/.zsh/zsh-completions/src ] && fpath=($HOME/.zsh/zsh-completions/src $fpath)

# Enable completions
autoload -U compinit && compinit

# Shift Tab to back comp
bindkey "^[[Z" reverse-menu-complete

# Less space complettion list
setopt list_packed

# Show file kind like `ls -F`
setopt list_types

# Show list when same suggestion exists
#setopt auto_list
# Enable Tab tapping complettion
setopt auto_menu

# Complemet parentheses
setopt auto_param_keys

# 語の途中でもカーソル位置で補完
#setopt complete_in_word

# カーソル位置は保持したままファイル名一覧を順次その場で表示
setopt always_last_prompt

# Setting for option completion
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections true

# Grouping completion list
#   %B...%b: make bold '...'
#   %d: label
#zstyle ':completion:*' format '%B%d%b'
zstyle ':completion:*' group-name ''

# Cache completion list
zstyle ':completion:*' use-cache yes

# _oldlist
# _complete
# _match: don't expand glob
# _history: use history
# _ignored: Show ignored ones
# _approximate: Show same ones
# _prefix
zstyle ':completion:*' completer _complete _match _prefix

zstyle ':completion:*' verbose yes

# Select by <-, ->
#zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' menu select interactive
setopt menu_complete

zstyle ':completion:*:messages' format $YELLOW'%d'$DEFAULT
zstyle ':completion:*:warnings' format $RED'No matches for:'$YELLOW' %d'$DEFAULT
#zstyle ':completion:*:descriptions' format $YELLOW'completing %B%d%b'$DEFAULT
zstyle ':completion:*:corrections' format $YELLOW'%B%d '$RED'(errors: %e)%b'$DEFAULT
#zstyle ':completion:*:options' description 'yes'


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


# === PROMPT
# Show VCS info
autoload -Uz add-zsh-hook
autoload -Uz colors
colors
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git svn hg bzr
zstyle ':vcs_info:*' formats '(%b %s)'
zstyle ':vcs_info:*' actionformats '(%b|%a)'
zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
zstyle ':vcs_info:bzr:*' use-simple true

autoload -Uz is-at-least
if is-at-least 4.3.10; then
  zstyle ':vcs_info:git:*' check-for-changes true
  zstyle ':vcs_info:git:*' stagedstr '%F{2}M%f'
  zstyle ':vcs_info:git:*' unstagedstr '%F{3}M%f'
  zstyle ':vcs_info:git:*' formats '%F{6}%b %c%u'
  zstyle ':vcs_info:git:*' actionformats '%F{2}%b%F{3}|%F{1}%a%f '
  zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
fi

+vi-git-untracked() {
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        [[ $(git ls-files --other --exclude-standard | sed q | wc -l | tr -d ' ') == 1 ]] ; then
        hook_com[unstaged]+='%F{1}??%f'
    fi
}

precmd () { vcs_info }

source ~/.dotfiles/.zsh/zsh-kubectl-prompt/kubectl.zsh

## Set prompt
setopt prompt_subst
autoload -Uz colors
colors

case ${UID} in
0)
    DEFAULT=$'%{\e[1;0m%}'
    RESET="%{${reset_color}%}"
    GREEN="%{${fg[green]}%}"
    BLUE="%{${fg[blue]}%}"
    RED="%{${fg[red]}%}"
    YELLOW="%{${fg[yellow]}%"
    CYAN="%{${fg[cyan]}%}"
    MAGENTA="%{$fg[magenta]%}"
    WHITE="%{${fg[white]}%}"

    PROMPT="%B%{[31m%}%/#%{[m%}%b "
    PROMPT2="%B%{[31m%}%_#%{[m%}%b "
    SPROMPT="${YELLOW} correct:${GREEN} %R ${CYAN}=> ${YELLOW} %r? ${CYAN}[y,n,a,e]:${RESET} "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
        PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
    ;;
*)
    DEFAULT=$'%{\e[1;0m%}'
    RESET="%{${reset_color}%}"
    GREEN="%{${fg[green]}%}"
    BLUE="%{${fg[blue]}%}"
    RED="%{${fg[red]}%}"
    YELLOW="%{${fg[yellow]}%}"
    CYAN="%{${fg[cyan]}%}"
    MAGENTA="%{${fg[magenta]}%}"
    WHITE="%{${fg[white]}%}"

    # Only show k8s context in work directory to avoid leaking cluster names in public recordings
    # Set K8S_PROMPT_WORK_DIR in ~/.local/.zshenv (e.g. K8S_PROMPT_WORK_DIR="$HOME/src/github.com/mycompany")
    function _k8s_prompt() {
        [[ -n "$K8S_PROMPT_WORK_DIR" && "$PWD" == "$K8S_PROMPT_WORK_DIR"* ]] && echo "$ZSH_KUBECTL_PROMPT"
    }
    PROMPT='
${BLUE}%(10~,%-2~/.../%2~,%~) ${BLUE}[%*] ${vcs_info_msg_0_} ${MAGENTA}$(_k8s_prompt)${RESET}
%(?,${GREEN}$,${RED}$)${RESET} '
    PROMPT2="${CYAN}[%_%%]${RESET} > "
    SPROMPT="${CYAN}correct: ${RED}%R ${CYAN}=> ${GREEN}%r ${CYAN}? [y,n,a,e]${RESET} > "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && PROMPT="${CYAN}${HOST%%.*}${RESET} ${PROMPT}"
esac

function prompt_cmd() {
    echo -ne "\e]1;$(pwd | sed -e "s,^$HOME,~,")\a"
}
add-zsh-hook precmd prompt_cmd


## Color
# Coloring errors and normal message
e_normal=`echo -e "¥033[0;30m"`
e_RED=`echo -e "¥033[1;31m"`
e_BLUE=`echo -e "¥033[1;36m"`

function make() {
    LANG=C command make "$@" 2>&1 | sed -e "s@[Ee]rror:.*@$e_RED&$e_normal@g" -e "s@cannot¥sfind.*@$e_RED&$e_normal@g" -e "s@[Ww]arning:.*@$e_BLUE&$e_normal@g"
}
function cwaf() {
    LANG=C command ./waf "$@" 2>&1 | sed -e "s@[Ee]rror:.*@$e_RED&$e_normal@g" -e "s@cannot¥sfind.*@$e_RED&$e_normal@g" -e "s@[Ww]arning:.*@$e_BLUE&$e_normal@g"
}

# Use same colors for autocompletion
zmodload -a colors
zmodload -a autocomplete
zmodload -a complist
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}


## Ailias
source ~/.dotfiles/alias.sh


## Movig
# Set backword
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " _-./;@"
zstyle ':zle:*' word-style unspecified

## Options
#
# Press only directory auto cd
setopt auto_cd

# `#` as comment
setopt interactive_comments

# Dir list complettion
setopt auto_pushd

# Ignore same dir name
setopt pushd_ignore_dups

# Enable command spell checks
setopt correct

# Complemet after '='
setopt magic_equal_subst

# Enable expantion
#setopt brace_ccl

# Auto cat, tee when multi redirect or pipe
setopt multios

# No beeps
setopt nolistbeep

# zsh editor
autoload zed

# Prediction configuration
#autoload predict-on

# Show background changes
setopt notify

REPORTTIME=3

# AutoJump setting
#export FPATH="$FPATH:/opt/local/share/zsh/site-functions/"
#if [ -f /opt/local/etc/profile.d/autojump.sh ]; then
#  . /opt/local/etc/profile.d/autojump.sh
#fi

# use ctrl+t to toggle autosuggestions(hopefully this wont be needed as
# zsh-autosuggestions is designed to be unobtrusive)
#bindkey '^C' autosuggest-toggle

autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[p" history-beginning-search-backward-end
bindkey "^[n" history-beginning-search-forward-end

function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
#bindkey '^r' peco-select-history
setopt hist_ignore_all_dups

#function peco-find-file() {
#    if git rev-parse 2> /dev/null; then
#        source_files=$(git ls-files)
#    else
#        source_files=$(find . -type f)
#    fi
#    selected_files=$(echo $source_files | peco --prompt "[find file]")
#
#    BUFFER="${BUFFER}$(echo $selected_files | tr '\n' ' ')"
#    CURSOR=$#BUFFER
#    zle redisplay
#}
#zle -N peco-find-file
#bindkey '^q' peco-find-file

function peco-buffer() {
    BUFFER=$(eval ${BUFFER} | peco)
    CURSOR=0
}
zle -N peco-buffer
bindkey "^q" peco-buffer

# Recent dirs
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

zstyle ':completion:*' recent-dirs-insert both
zstyle ':chpwd:*' recent-dirs-max 50000
zstyle ':chpwd:*' recent-dirs-default true
zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/shell/chpwd-recent-dirs"
zstyle ':chpwd:*' recent-dirs-pushd true

function peco-cdr() {
    local selected_dir=$(cdr -l | awk '{ print $2 }' | peco)
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-cdr
bindkey "^o" peco-cdr


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/onotaiki/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/onotaiki/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/onotaiki/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/onotaiki/google-cloud-sdk/completion.zsh.inc'; fi

# For VPN environment
export ARGOCD_GRPC_WEB=true
