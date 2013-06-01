"set no vi compatible
set nocompatible

set t_Co=256

source ~/.dotfiles/basic.vimrc
source ~/.dotfiles/color.vimrc
source ~/.dotfiles/remap.vimrc

" load neo bundle config
source ~/.dotfiles/bundle.vimrc
source ~/.dotfiles/complcache.vimrc
source ~/.dotfiles/plugin.vimrc

"auto reload when overwitten in other
set autoread
augroup vimrc-checktime
  autocmd!
  autocmd WinEnter * checktime
augroup END

"#Other settings
syntax on

"filetype on
