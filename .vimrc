"set no vi compatible
set nocompatible

set t_Co=256
set guifont=Consolas\ for\ Powrline:h12

source ~/.dotfiles/basic.vimrc
source ~/.dotfiles/bundle.vimrc
source ~/.dotfiles/remap.vimrc

"auto reload when overwitten in other
set autoread
augroup vimrc-checktime
  autocmd!
  autocmd WinEnter * checktime
augroup END

"#Other settings
syntax on

"filetype on
"
"
""" Color setting

"set background=dark
"colorscheme molokai
"let g:solarized_termcolors=256

"hi Pmenu ctermfg=black ctermbg=darkgreen cterm=none
"hi PmenuSel ctermfg=black ctermbg=yellow cterm=none
"hi PmenuSbar ctermfg=yellow ctermbg=black cterm=none
"hi PmenuThumb ctermfg=white ctermbg=yellow cterm=none
""current window's status line color
"hi StatusLine ctermfg=black ctermbg=darkcyan cterm=none
""otherwindow status line color
"hi StatusLineNC ctermfg=black ctermbg=grey cterm=none
"
"hi WarningMsg ctermfg=black ctermbg=red cterm=none
"
"hi VertSplit  ctermfg=black ctermbg=blue cterm=none
