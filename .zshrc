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
fpath=( "$HOME/.zfunctions" $fpath )
autoload -U promptinit && promptinit
prompt pure


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
source /autosuggestions.zsh

# Enable autosuggestions automatically
zle-line-init() {
    zle autosuggest-start
}

zle -N zle-line-init

# use ctrl+t to toggle autosuggestions(hopefully this wont be needed as
# zsh-autosuggestions is designed to be unobtrusive)
bindkey '^T' autosuggest-toggle
