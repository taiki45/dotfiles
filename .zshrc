## General
# Emacs like key bind
bindkey -e

## Functions
func gorun() {
    local name="go-tmp-build-$RANDOM"
    go build -o $name
    ./$name
    rm ./$name
}

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
setopt auto_list

# Grouping completion list
#   %B...%b: make bold '...'
#   %d: label
#zstyle ':completion:*' format '%B%d%b'
#zstyle ':completion:*' group-name ''

# Cache completion list
zstyle ':completion:*' use-cache yes

# Smart completion
#   m:{a-z}={A-Z}: ignore case
#   r:|[._-]=*: Put wildcard before `.`, `_`, `-`
#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[._-]=*'

# _oldlist 
# _complete
# _match: don't expand glob
# _history: use history
# _ignored: Show ignored ones
# _approximate: Show same ones
# _prefix
zstyle ':completion:*' completer _oldlist _complete _match _history _approximate _prefix


## History
HISTFILE=~/.zsh_histor
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


## notification
#source ~/.zsh/zsh-notify/notify.plugin.zsh
#export NOTIFY_COMMAND_COMPLETE_TIMEOUT=30


# === PROMPT
# Show VCS info
autoload -Uz add-zsh-hook
autoload -Uz colors
colors
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git svn hg bzr
#zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' formats '(%b)'
zstyle ':vcs_info:*' actionformats '(%b|%a)'
zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
zstyle ':vcs_info:bzr:*' use-simple true

autoload -Uz is-at-least
if is-at-least 4.3.10; then
  zstyle ':vcs_info:git:*' check-for-changes true
  zstyle ':vcs_info:git:*' stagedstr "+"
  zstyle ':vcs_info:git:*' unstagedstr "-"
  #zstyle ':vcs_info:git:*' formats '(%s)-[%b] %c%u'
  zstyle ':vcs_info:git:*' formats '%b'
  zstyle ':vcs_info:git:*' actionformats '%b %a'
fi

function _update_vcs_info_msg() {
    psvar=()
    LANG=ja_JP.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
add-zsh-hook precmd _update_vcs_info_msg

# Show Ruby version
if `which rbenv >/dev/null 2>&1` && [ -z "$RBENV_ROOT" ]; then
    export RBENV_ROOT=`rbenv root`
fi

rbenv_version() {
    if [ -n "$RBENV_ROOT" ]; then
        VERSION=''
        NOTFOUND=''
        if [ -r .ruby-version ]; then
            VERSION=`cat .ruby-version`
            ls "${RBENV_ROOT}/versions" | egrep "^$VERSION$" >/dev/null 2>&1 || NOTFOUND='{?}'
        else
            VERSION=`cat "${RBENV_ROOT}/version"`
        fi
        echo "$VERSION$NOTFOUND"
    fi
}

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
    YELLOW="%{${fg[yellow]}%"
    CYAN="%{${fg[cyan]}%}"
    MAGENTA="%{$fg[magenta]%}"
    WHITE="%{${fg[white]}%}"
    PR_BASE="%{${fg[cyan]}%}"
    PR_DIR="%{${fg[yellow]}%}"

    #PROMPT='${PR_BASE}[${USER}:${PR_DIR}%(5~,%-2~/.../%2~,%~)% ${PR_BASE}]${RESET}%1(v|%F{blue}%1v%f|)${RESET}
#    PROMPT='${PR_BASE}[${USER}:${PR_DIR}%(10~,%-2~/.../%2~,%~)% ${PR_BASE}]${RESET}%1(v|%F{blue}%1v%f|)${RESET}
#${WHITE}$ ${RESET}'
#    PROMPT='${PR_BASE}[${USER}:${PR_DIR}%(10~,%-2~/.../%2~,%~)% ${PR_BASE}]${RESET}%1(v|%F{blue}%1v%f|)${RESET}
#%(?,${GREEN}✔,${RED}✗) ${RESET}'

    PROMPT='%F{22}%K{70} ${USER} %k%f%F{70}%K{238}⮀⮁ %k%f%F{238}%K{208}⮀  %k%f%F{208}%K{236}⮀%k%f%F{214}%K{236} %(10~,%-2~/.../%2~,%~)%  %k%f%F{236}%K{208}⮀ %k%f%F{208}%K{240}⮀ %k%f%F{240}%K{39}⮀%F{39}%K{240}⮀%F{240}%K{39}⮀%F{24}%K{39} %1(v|%1v|) %F{39}%K{67}⮀%F{67}%K{239}⮀%F{239}%K{0}⮀ %f%k
%(?,%F{248}%K{244}⮀%F{244}%K{240}⮀%F{70}%K{240} ✔ %F{240}%K{238}⮀%F{238}%K{0}⮀%f%k,%F{248}%K{244}⮀%F{244}%K{240}⮀%F{197}%K{240} ✗ %F{240}%K{238}⮀%F{238}%K{0}⮀%f%k) ${RESET}'
    PROMPT2="%{[36m%}[%_%%]%{[m%} $ "
    RPROMPT='%{$fg[cyan]%}$(rbenv_version) %{$reset_color%}%{$fg[red]%}❤%{$reset_color%} ${CYAN}%*-%W${RESET}'
    SPROMPT="${YELLOW} correct:${GREEN} %R ${CYAN}=> ${YELLOW} %r? ${CYAN}[y,n,a,e]:${RESET} "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
        PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
    ;;
esac


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

# syntax hilighting
if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi


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

# Dir list complettion
setopt auto_pushd

# Ignore same dir name
setopt pushd_ignore_dups

# Enable command spell checks
setopt correct

# Complemet after '='
setopt magic_equal_subst

# Complemet parentheses
setopt auto_param_keys

# Enable expantion
setopt brace_ccl

# Enable Tab tapping complettion
setopt auto_menu

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

# Setup zsh-autosuggestions
source ~/.dotfiles/.zsh/zsh-autosuggestions/autosuggestions.zsh

# Enable autosuggestions automatically
zle-line-init() {
    zle autosuggest-start
}

zle -N zle-line-init

# use ctrl+t to toggle autosuggestions(hopefully this wont be needed as
# zsh-autosuggestions is designed to be unobtrusive)
bindkey '^C' autosuggest-toggle

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
bindkey '^r' peco-select-history
setopt hist_ignore_all_dups

function git-find-pr() {
    git show $( \
        perl -ne 'print if ($seen{$_} .= @ARGV) =~ /10$/' \
        <(git rev-list --ancestry-path $1..master ) \
        <(git rev-list --first-parent $1..master ) \
        | tail -1 \
    ) \
    | grep 'pull request' \
    | ruby -ne 'id = $_.scan(/#\d+/).first.sub("#", ""); repo = `hub browse -u`.chomp; puts "#{repo}/pull/#{id}"'
}
