alias ls='ls -G'
alias l='ls -G'
alias 'cd..'='cd ..'
alias be='bundle exec'
alias bi='bundle install'
alias biwp='bundle install --without production'
alias g='git'
alias gti='git'
alias gt='git'
alias agg='ag -S --stats'
alias gvim='open -a MacVim'
alias v='mvim'
alias ghqcd='cd $(ghq list -p | peco)'
alias workcd='cd ~/work/$(ls ~/work/ |peco)'
alias beshow=$'bundle show $(bundle list | peco |awk \'{ print $2 }\')'

func ff() {
    find . -name "*$1*"
}
