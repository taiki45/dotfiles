export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8

export EDITOR=vim
export TERM=xterm-color


if [ -d /opt/local ]; then
    export SHELL=/opt/local/bin/zsh
else
    export SHELL=/usr/bin/zsh
fi

#export NODEBREW_ROOT=$HOME:.nodebrew
#export PYTHONDONTWRITEBYTECODE=1

export PATH=/Library/Java/JavaVirtualMachines/jdk1.7.0_13.jdk/Contents/Home/bin:$HOME/.nodebrew/current/bin:$HOME/.local/bin:/opt/local/bin:/opt/local/share/mysql5/mysql:/usr/local/bin:/opt/local/sbin/:$PATH
export MANPATH=/opt/local/man:$MANPATH


if [ -d ~/.rsense-0.3 ]; then
    export RSENSE_HOME=~/.rsense-0.3
fi

if [ -d ~/.rbenv ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
    source ~/.rbenv/completions/rbenv.zsh
fi

if [ -d ~/.pyenv ]; then
    export PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(pyenv init -)"
    source ~/.pyenv/completions/pyenv.zsh
fi

if [ -f ~/.local/bin/hub ]; then
    eval "$(hub alias -s)"
fi
