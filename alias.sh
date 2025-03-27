alias ll='ls -l'
alias be='bundle exec'
alias g='git'
alias gti='git'
alias gt='git'
alias gcd='cd `git rev-parse --show-toplevel`'
alias ghqget='ghq get --shallow'
alias jqc='jq -C . |less -R'

if [[ "$(command -v eza)" ]]; then
  alias ls='eza'
  alias la='eza -a'
  alias ll='eza -aal'
  alias lt='eza -T -L 3 -a -I "node_modules|.git|.cache"'
  alias lta='eza -T -a -I "node_modules|.git|.cache" --color=always | less -r'
fi
