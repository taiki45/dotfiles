"Neobundle setup
"
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
NeoBundle 'Shougo/neosnippet'

NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'git://github.com/Shougo/vim-vcs.git'
NeoBundle 'git://github.com/Shougo/vimfiler.git'
NeoBundle 'git://github.com/Shougo/vimshell.git'
NeoBundle 'git://github.com/Shougo/vinarise.git'
NeoBundle 'git://github.com/vim-scripts/sudo.vim.git'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'git://github.com/skwp/vim-rspec.git'
NeoBundle 'taka84u9/vim-ref-ri'
NeoBundle 'thinca/vim-ref'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'groenewege/vim-less'
NeoBundle 'dag/vim2hs.git'
NeoBundle 'ujihisa/neco-ghc'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'b4winckler/vim-objc'
NeoBundle 'vim-scripts/cocoa.vim'

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
