"set no vi compatible
set nocompatible

"Neobundle setup
filetype off


if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundle 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc'

" My Bundles here:
"
NeoBundle 'rails.vim'
"NeoBundle 'git://github.com/Shougo/echodoc.git'
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
"NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'Shougo/neocomplcache-snippets-complete'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/Shougo/vim-vcs.git'
NeoBundle 'git://github.com/Shougo/vimfiler.git'
NeoBundle 'git://github.com/Shougo/vimshell.git'
NeoBundle 'git://github.com/Shougo/vinarise.git'
NeoBundle 'git://github.com/vim-scripts/sudo.vim.git'
"NeoBundle 'vim-ruby/vim-ruby'

filetype plugin on
filetype indent on
filetype plugin indent on     " Required!
"
" Installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
endif


"END neobundle setup



"auto reload when overwitten in other
set autoread

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
set swapfile
set directory=~/.vim/tmp

"enable backspace in specific case
set backspace=indent,eol,start




"" Color setting
""
hi Pmenu ctermfg=black ctermbg=darkgreen cterm=none
hi PmenuSel ctermfg=black ctermbg=yellow cterm=none
hi PmenuSbar ctermfg=yellow ctermbg=black cterm=none
hi PmenuThumb ctermfg=white ctermbg=yellow cterm=none
"current window's status line color
hi StatusLine ctermfg=black ctermbg=darkcyan cterm=none
"otherwindow status line color
hi StatusLineNC ctermfg=black ctermbg=grey cterm=none

hi WarningMsg ctermfg=black ctermbg=red cterm=none

hi VertSplit  ctermfg=black ctermbg=blue cterm=none



"-Tab setiings

set tabstop=2
set shiftwidth=2

"expand tab
set expandtab

"auto indent
set autoindent

"新しい行を作ったときに高度な自動インデントを行う。
set smartindent
set cindent
set cinkeys-=0#

"Insertモードで: <Tab> を挿入するのに、適切な数の空白を使う。
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
set list

"補完候補を表示する
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


"move fast with shift key
noremap H 3h
noremap J 3j
noremap K 3k
noremap L 3l

"search result as middle of scren

nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz
nmap G Gzz


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


"Plugin Settings



" neocomplcache SETUP
"

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"


" Rsense settings
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:rsenseUseOmniFunc = 1
if filereadable(expand('~/.rsense-0.3/bin/rsense'))
  let g:rsenseHome = expand('~/.rsense-0.3')
  let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
endif



" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'



"END
"
"
"#Other settings
syntax on
filetype on
