## General
# Emacs like key bind
bindkey -e

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

# Select completions via emacs key-binds
#zstyle ':completion:*:default' menu select=1

# Show list when same suggestion exists
setopt auto_list

# Auto completion
if [ -d "$HOME/.zsh/auto-fu" ]; then
  source "$HOME/.zsh/auto-fu/auto-fu.zsh"
  zstyle ':auto-fu:var' postdisplay $'\n➥'
  function zle-line-init ()
  {
    auto-fu-init
  }
  zle -N zle-line-init
  zstyle ':completion:*' completer _oldlist _complete
fi

# zaw, anthing like plugin
if [ -d "$HOME/.zsh/zaw" ]; then
  source "$HOME/.zsh/zaw/zaw.zsh"
  zstyle ':filter-select' case-insensitive yes

  # Key-map
  bindkey -r ''
  bindkey '' zaw
  bindkey 'k' zaw

  bindkey 'h' zaw-history
  bindkey '' zaw-history
  bindkey 'b' zaw-git-branches
  bindkey '' zaw-git-branches
  bindkey 'rb' zaw-git-recent-branches
  bindkey '' zaw-git-recent-branches
  bindkey 'rab' zaw-git-recent-all-branches
  bindkey '' zaw-git-recent-all-branches
  bindkey 's' zaw-git-status
  bindkey 'f' zaw-git-files

  # Dir setting
  autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
  add-zsh-hook chpwd chpwd_recent_dirs
  zstyle ':chpwd:*' recent-dirs-max 5000
  zstyle ':chpwd:*' recent-dirs-default yes
  zstyle ':completion:*' recent-dirs-insert both
fi


## History
HISTFILE=~/.zsh_histor
HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_ignore_dups
setopt hist_reduce_blanks
setopt share_history

# Add history when command executed
setopt inc_append_history

# Remove (fc -L) commnad
setopt hist_no_store

# Add zsh start and end in history
setopt extended_history

autoload history-search-end


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
# Show how expand and execute command
#setopt xtrace

# Press only directory auto cd
setopt auto_cd

# Dir list complettion
setopt auto_pushd

# Ignore same dir name
setopt pushd_ignore_dups

# Enable command spell checks
setopt correct
#setopt correct_all

# Restrict overwritting redirect
#setopt no_clobber

# Complemet after '='
setopt magic_equal_subst

# Complemet parentheses
setopt auto_param_keys

# Auto add suffix slash
#setopt auto_param_slash

# Enable expantion
setopt brace_ccl

# Enable Tab tapping complettion
setopt auto_menu

# Complemet sudo
#zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin

# Auto cat, tee when multi redirect or pipe
setopt multios

# Disable auto remove last slash
#setopt noautoremoveslash

# No beeps
setopt nolistbeep

# Auto escape URL
#autoload -Uz url-quote-magic
#zle -N self-insert url-quote-magic

# zsh editor
autoload zed

# Prediction configuration
#autoload predict-on

# Show background changes
setopt notify

# Set min report time
REPORTTIME=3

# AutoJump setting
#export FPATH="$FPATH:/opt/local/share/zsh/site-functions/"
#if [ -f /opt/local/etc/profile.d/autojump.sh ]; then
#  . /opt/local/etc/profile.d/autojump.sh
#fi

