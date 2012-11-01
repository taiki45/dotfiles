## General
# ENV
export SHELL=/opt/local/bin/zsh

# Emacs like key bind
bindkey -e


## Complettion
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

# Auto completion
if [ -d "$HOME/.zsh" ]; then
  source "$HOME/.zsh/auto-fu.zsh"
  function zle-line-init ()
  {
    auto-fu-init
  }
  zle -N zle-line-init
  zstyle ':completion:*' completer _oldlist _complete
fi


## History
HISTFILE=~/.zsh_histor
HISTSIZE=10000
SAVEHIST=10000
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

    PROMPT='${PR_BASE}[${USER}@%m:${PR_DIR}%(5~,%-2~/.../%2~,%~)% ${PR_BASE}] ${RESET}${WHITE}$ ${RESET}'
    PROMPT2="%{[36m%}[%_%%]%{[m%} $ "
    SPROMPT="${YELLOW} correct:${GREEN} %R ${CYAN}=> ${YELLOW} %r? ${CYAN}[y,n,a,e]:${RESET} "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
        PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
    ;;
esac

# Show VCS info
source ~/.zsh/git-prompt

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

# Color complettion
zstyle ':completion:*' list-colors di=34 fi=0


## Ailias
source ~/.dotfiles/alias.sh


## Movig
# Move word and backword
bindkey "^W" forward-word
bindkey "^B" backward-word
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
setopt no_clobber

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


# AutoJump setting
export FPATH="$FPATH:/opt/local/share/zsh/site-functions/"
if [ -f /opt/local/etc/profile.d/autojump.sh ]; then
  . /opt/local/etc/profile.d/autojump.sh
fi
