# Lang
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8

# ENV
export SHELL=/opt/local/bin/zsh
#export NODEBREW_ROOT=$HOME:.nodebrew
export PYTHONDONTWRITEBYTECODE=1

export PATH=/Library/Java/JavaVirtualMachines/jdk1.7.0_13.jdk/Contents/Home/bin:$HOME/.nodebrew/current/bin:$HOME/.local/bin:/opt/local/bin:/opt/local/share/mysql5/mysql:/usr/local/bin:/opt/local/sbin/:$PATH
export MANPATH=/opt/local/man:$MANPATH
export RSENSE_HOME=~/.rsense-0.3

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
source ~/.rbenv/completions/rbenv.zsh

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
source ~/.pyenv/completions/pyenv.zsh

if [ -f ~/.local/bin/hub ]; then
    eval "$(hub alias -s)"
fi

export TERM=xterm-color

# Editor
export EDITOR=vim

