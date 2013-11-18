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
"show recent open files
noremap :uh :Unite file_mru -buffer-name=file_mru
nnoremap <C-X><C-H> :Unite file_mru -buffer-name=file_mru<CR>

"show buffer and files
noremap :ub :Unite buffer -buffer-name=buffer
nnoremap <C-X><C-B> :Unite buffer -buffer-name=buffer<CR>
noremap :uba :Unite buffer file file_mru -buffer-name=all_stuff

"show current dir files
noremap :uf :Unite file -buffer-name=file
nnoremap <C-X><C-F> :Unite file -buffer-name=file<CR>
noremap :ufa :Unite file_rec buffer -buffer-name=file_rec


NeoBundle 'thinca/vim-quickrun'
NeoBundle 'git://github.com/Shougo/vimfiler.git'
NeoBundle 'git://github.com/Shougo/vimshell.git'
NeoBundle 'git://github.com/Shougo/vinarise.git'
NeoBundle 'git://github.com/vim-scripts/sudo.vim.git'
NeoBundle 'vim-ruby/vim-ruby'

NeoBundle 'git://github.com/skwp/vim-rspec.git'
"" RSpec and quickrun setting
let g:quickrun_config = {}
let g:quickrun_config['ruby.rspec'] = {'command': 'rspec'}

augroup UjihisaRSpec
    autocmd!
    autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END

NeoBundle 'taka84u9/vim-ref-ri'
NeoBundle 'thinca/vim-ref'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'groenewege/vim-less'
NeoBundle 'dag/vim2hs'

NeoBundle 'ujihisa/neco-ghc'
let g:haskell_conceal = 0
let g:haskell_conceal_enumerations = 0

NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * : highlight IndentGuidesOdd  ctermbg=236
autocmd VimEnter,Colorscheme * : highlight IndentGuidesEven ctermbg=234

NeoBundle 'bling/vim-airline'
let g:airline_theme= "powerlineish"
"let g:airline_theme= "molokai"
let g:airline_powerline_fonts = 1
"set ambiwidth=double

NeoBundle 'b4winckler/vim-objc'
NeoBundle 'vim-scripts/cocoa.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'guns/xterm-color-table.vim'
NeoBundle 'ujihisa/unite-haskellimport'
NeoBundle 'avakhov/vim-yaml'
NeoBundle 'elzr/vim-json'
NeoBundle 'tpope/vim-cucumber'

NeoBundle 'vim-scripts/Align'
let g:Align_xstrlen=3

NeoBundle 'chrisbra/csv.vim'

NeoBundle 'sjl/gundo.vim'
nnoremap <C-X><C-R> :GundoToggle<CR>

NeoBundle 'scrooloose/nerdtree'
nnoremap <C-X><C-W> :NERDTreeToggle<CR>

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
