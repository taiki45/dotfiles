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
source ~/.zsh/zsh-notify/notify.plugin.zsh
export NOTIFY_COMMAND_COMPLETE_TIMEOUT=30


# === PROMPT
fpath=( "$HOME/.zfunctions" $fpath )
autoload -U promptinit && promptinit
prompt pure

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
        elif [ -f "${RBENV_ROOT}/version" ]; then
            VERSION=`cat "${RBENV_ROOT}/version"`
        else
            VERSION="NotFound"
        fi
        echo "$VERSION$NOTFOUND"
    fi
}

RPROMPT='%F{red}❤%f %F{cyan}$(rbenv_version)%f'
# Delete RPROMPT for copy-and-paste
setopt transient_rprompt

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
