alias ll='ls -l'
alias be='bundle exec'
alias g='git'
alias gti='git'
alias gt='git'
alias gcd='cd `git rev-parse --show-toplevel`'
alias jqc='jq -C . |less -R'

if [[ "$(command -v exa)" ]]; then
  alias ls='exa'
  alias la='exa -a'
  alias ll='exa -aal'
  alias lt='exa -T -L 3 -a -I "node_modules|.git|.cache"'
  alias lta='exa -T -a -I "node_modules|.git|.cache" --color=always | less -r'
fi
