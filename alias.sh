alias ll='ls -l'
alias 'cd..'='cd ..'
alias b='bundle'
alias be='bundle exec'
alias bi='bundle install'
alias biwp='bundle install --without production'
alias ea='envchain aws'
alias eabe='envchain aws bundle exec'
alias g='git'
alias gti='git'
alias gt='git'
alias gg='git grep -E'
alias gcd='cd `git rev-parse --show-toplevel`'
alias agg='ag -S --stats'
alias gvim='open -a MacVim'
alias v='mvim'
alias workcd='cd ~/work/$(ls ~/work/ |peco)'
alias beshow=$'bundle show $(bundle list | peco |awk \'{ print $2 }\')'

func ff() {
    find . -name "*$1*"
}
