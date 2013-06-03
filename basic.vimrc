"#General settings
"Set utf8
set enc=utf8
set termencoding=utf-8
set fileencoding=utf-8

"open other file if did not save current file
set hidden

"enable backspace in specific case
set backspace=indent,eol,start

"ignore upper case when search lower case
set smartcase

"setting for crontab
set backupskip=/tmp/*,/private/tmp/*


"open other file if did not save current file
set hidden

"set status lines
set laststatus=2
set statusline=%<%F\ %r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%4v(ASCII=%03.3b,HEX=%02.2B)\ %l/%L(%P)%m
"show command in status line
set showcmd

"set backup & backup dir
set backup
set backupdir=~/.vim/backups/

"set swap file dir
set noswapfile
"set directory=~/.vim/tmp

"enable backspace in specific case
set backspace=indent,eol,start

"set yanked text to clipboard
:set clipboard+=unnamed

" no auto resizing
set noequalalways

"-Tab setiings
set tabstop=4
set shiftwidth=4

"expand tab
set expandtab

"auto indent
"set autoindent

set smartindent
set cindent
set cinkeys-=0#

"use easy tab
set et


"#Display settings

"show '(' when input ')'
set showmatch

"display row num
set number

"show title
set title

"show ruler
set ruler

"show inbisible chars
"set list
"set listchars=tab:\ \ ,eol:¬,trail:_
set list listchars=tab:>_,trail:_

"show complete
set wildmenu
set wildmode=list:full


"enable mode line
set modeline

"show comand at status line
set showcmd

"show mode
set showmode

"highlight Zenkaku space
if &background ==# 'dark'
  hi WideSpace ctermbg=DarkCyan
else
  hi WideSpace ctermbg=Cyan
endif
match WideSpace /　/

"set search highlight
set hlsearch

"search when as soon as you tyoed
set incsearch
