"Neobundle setup
"
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))


"==========
"Plugin Settings

"" ruby and html bracket match
source $VIMRUNTIME/macros/matchit.vim

"" Gauche
autocmd FileType scheme :let is_gauche=1
"==========


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

let g:unite_enable_start_insert = 1
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" grep
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
" grep on cursor word
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
" recall result
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>

" use ag instead of grep
if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
    let g:unite_source_grep_recursive_opt = ''
endif


NeoBundle 'thinca/vim-quickrun'
let g:quickrun_config = {}
let g:quickrun_config.haskell = {'command' : 'runghc'}

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
NeoBundleLazy 'kchmck/vim-coffee-script', { 'autoload' : {'filetypes' : 'coffee-script', }}
NeoBundleLazy 'groenewege/vim-less', { 'autoload' : {'filetypes' : 'less', }}

NeoBundle 'godlygeek/tabular'

NeoBundle 'dag/vim2hs'
let g:haskell_conceal_wide = 0
let g:haskell_conceal = 0
let g:haskell_conceal_enumerations = 0
autocmd FileType haskell
    \ vnoremap <buffer> <silent> \pf
    \ :PointFree!<CR>

NeoBundleLazy 'ujihisa/neco-ghc', { 'autoload' : {'filetypes' : 'haskell', }}
let g:necoghc_enable_detailed_browse = 1
NeoBundleLazy 'kana/vim-filetype-haskell', { 'autoload' : {'filetypes' : 'haskell', }}
NeoBundleLazy 'eagletmt/ghcmod-vim', { 'autoload' : {'filetypes' : 'haskell', }}
noremap \t :GhcModType<CR>
noremap \c :GhcModTypeClear<CR>
noremap \i :GhcModTypeInsert<CR>
noremap \g :GhcModCheckAsync<CR>
noremap \l :GhcModLintAsync<CR>
noremap \? :GhcModInfo<CR>
let g:ghcmod_type_highlight = 'DiffAdd'

NeoBundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'haskell']

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * : highlight IndentGuidesOdd  ctermbg=236
autocmd VimEnter,Colorscheme * : highlight IndentGuidesEven ctermbg=234

NeoBundle 'bling/vim-airline'
let g:airline_theme= "jellybeans"
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" old vim-powerline symbols
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'


NeoBundle 'b4winckler/vim-objc'
NeoBundle 'vim-scripts/cocoa.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'guns/xterm-color-table.vim'
NeoBundle 'ujihisa/unite-haskellimport'
NeoBundle 'avakhov/vim-yaml'
NeoBundle 'elzr/vim-json'
NeoBundle 'tpope/vim-cucumber'

NeoBundle 'chrisbra/csv.vim'

NeoBundle 'sjl/gundo.vim'
nnoremap <C-X><C-R> :GundoToggle<CR>

NeoBundle 'scrooloose/nerdtree'
nnoremap <C-X><C-W> :NERDTreeToggle<CR>

NeoBundle 'kien/ctrlp.vim'
nnoremap <C-X><C-P> :CtrlP<CR>

NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tomasr/molokai'
NeoBundle 'w0ng/vim-hybrid'

colorscheme jellybeans
set cursorline

NeoBundle 'ujihisa/unite-colorscheme'
"NeoBundle 'lukerandall/haskellmode-vim'
"let g:ghc="/usr/bin/ghc"
"let g:haddock_browser="/Applications/Google\ Chrome.app"

NeoBundleLazy 'eagletmt/unite-haddock', { 'autoload' : {'filetypes' : 'haskell', }}
call unite#custom_default_action('haddock', 'browse_remote')
noremap :hoogle :Unite hoogle
noremap :haddock :Unite haddock



" =================================================
" NeoBundle setting

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



"================================================
" neocomplcache SETUP

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
" Disable open preview on completing
set completeopt=menuone

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
imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR> neocomplcache#close_popup()."\<CR>"
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



" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePhp

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

if !exists('g:neocomplcache_member_prefix_patterns')
  let g:neocomplcache_member_prefix_patterns = {}
endif
let g:neocomplcache_member_prefix_patterns['php'] = ''


" Rsense settings
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:rsenseUseOmniFunc = 1
if filereadable(expand('~/.rsense-0.3/bin/rsense'))
  let g:rsenseHome = expand('~/.rsense-0.3')
  let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
endif
