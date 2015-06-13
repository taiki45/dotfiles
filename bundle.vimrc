"Neobundle setup
"
filetype off
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))


"==========
"Plugin Settings

"" ruby and html bracket match
source $VIMRUNTIME/macros/matchit.vim

"" Gauche
autocmd FileType scheme :let is_gauche=1
"==========

"" Ruby
au BufRead,BufNewFile,BufReadPre *.iam set filetype=ruby

" Let NeoBundle manage NeoBundle
NeoBundle 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc'

" My Bundles here:
"
"NeoBundle 'git://github.com/Shougo/echodoc.git'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

NeoBundle 'Shougo/unite.vim'
"show recent open files
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/vimfiler'

" Use vimfiler instead of default filer.
let g:vimfiler_as_default_explorer = 1
" Open filer
noremap <silent> :tree :VimFilerBufferDir -split -simple -winwidth=45 -no-quit
noremap <C-X><C-T> :VimFilerBufferDir -split -simple -winwidth=45 -no-quit<ENTER>
" Don't let <CR> enter the directory but let it open the directory
autocmd FileType vimfiler nmap <buffer> <CR> <Plug>(vimfiler_expand_or_edit)
autocmd FileType vimfiler nmap <buffer> <C-N> <Plug>(vimfiler_loop_cursor_down)
autocmd FileType vimfiler nmap <buffer> <C-P> <Plug>(vimfiler_loop_cursor_up)
" Automatically open vimfiler on start
"autocmd VimEnter * VimFilerExplorer
" If no files are specified, open vimfiler
autocmd VimEnter * if !argc() | VimFiler | endif

NeoBundle 'sorah/unite-ghq'
NeoBundleLazy 'sorah/unite-bundler', { 'autoload' : {'filetypes' : ['ruby', 'rake'] }}
NeoBundle 'Shougo/unite-outline'
NeoBundle 'thinca/vim-unite-history'

command! Uh Unite file_mru -buffer-name=file_mru -no-split
"noremap <silent> :uh :<C-u>Unite file_mru -buffer-name=file_mru -no-split
nnoremap <C-X><C-H> :<C-u>Unite file_mru -buffer-name=file_mru -no-split<CR>

"show buffer and files
command! Ub :Unite buffer -buffer-name=buffer -no-split
nnoremap <C-X><C-B> :<C-u>Unite buffer -buffer-name=buffer -no-split<CR>

"show current dir files
command! Uf :Unite file -buffer-name=file -no-split
nnoremap <C-X><C-F> :<C-u>Unite file -buffer-name=file -no-split<CR>
"noremap :ufa :Unite file_rec buffer -buffer-name=file_rec
command! Ufa :Unite file_rec/git:--cached:--others:--exclude-standard -buffer-name=file_rec -no-split
nnoremap <C-X><C-A> :<C-u>Unite file_rec/git:--cached:--others:--exclude-standard -buffer-name=file_rec -no-split<CR>

command! Gem :Unite bundler

"call unite#custom#source('file,file/new,buffer,file_rec', 'matchers', 'matcher_fuzzy')

let g:unite_enable_start_insert = 1
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

let g:unite_source_history_yank_enable = 1
command! Uy :Unite history/yank


" grep
command! Ug :Unite grep -buffer-name=search-buffer -no-split
nnoremap <C-X><C-G> :Unite grep -buffer-name=search-buffer -no-split<CR>
" recall result
command! Ur :UniteResume search-buffer -no-split
nnoremap <C-X><C-R> :UniteResume search-buffer -no-split<CR>

" use ag instead of grep
if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
    let g:unite_source_grep_recursive_opt = ''
endif

" unite mark
" https://github.com/tacroe/unite-mark
" http://d.hatena.ne.jp/tacroe/20101119/1290115586
NeoBundle 'tacroe/unite-mark'
nnoremap <silent> ,m :Unite mark<CR>
" mark auto reg
" http://saihoooooooo.hatenablog.com/entry/2013/04/30/001908
if !exists('g:markrement_char')
    let g:markrement_char = [
    \     'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
    \     'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
    \ ]
endif
nnoremap <silent>m :<C-u>call <SID>AutoMarkrement()<CR>
function! s:AutoMarkrement()
    if !exists('b:markrement_pos')
        let b:markrement_pos = 0
    else
        let b:markrement_pos = (b:markrement_pos + 1) % len(g:markrement_char)
    endif
    execute 'mark' g:markrement_char[b:markrement_pos]
    echo 'marked' g:markrement_char[b:markrement_pos]
endfunction
autocmd BufReadPost * delmarks!


NeoBundle 'git://github.com/vim-scripts/sudo.vim.git'

au BufRead,BufNewFile,BufReadPre *.coffee set filetype=coffee
autocmd FileType coffee setlocal sw=2 sts=2 ts=2 et
NeoBundleLazy 'kchmck/vim-coffee-script', { 'autoload' : {'filetypes' : 'coffee', }}

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

NeoBundle 'rking/ag.vim'

NeoBundleLazy 'avakhov/vim-yaml', { 'autoload' : {'filetypes' : 'yaml', }}
NeoBundleLazy 'tpope/vim-cucumber', { 'autoload' : {'filetypes' : 'cucumber', }}

NeoBundleLazy 'chrisbra/csv.vim', { 'autoload' : {'filetypes' : 'csv', }}

NeoBundle 'kien/ctrlp.vim'
nnoremap <C-X><C-P> :CtrlP<CR>

NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tomasr/molokai'
NeoBundle 'w0ng/vim-hybrid'

"NeoBundle 'ujihisa/unite-colorscheme'

NeoBundle 'ujihisa/unite-haskellimport', { 'autoload' : {'filetypes' : 'haskell', }}

NeoBundleLazy 'eagletmt/unite-haddock', { 'autoload' : {'filetypes' : 'haskell', }}
noremap :hoogle :Unite hoogle
noremap :haddock :Unite haddock

NeoBundle 'gcmt/wildfire.vim'
" This selects the next closest text object.
let g:wildfire_fuel_map = "<ENTER>"
" This selects the previous closest text object.
"let g:wildfire_water_map = "<S-Enter>"
let g:wildfire_objects = ["i'", 'i"', 'i)', 'i]', 'i}', 'ip', 'it', 'i>']

NeoBundle 'szw/vim-tags'
NeoBundle 'tpope/vim-surround'

NeoBundleLazy 'vim-scripts/hlint', { 'autoload' : {'filetypes' : 'haskell', }}

augroup UjihisaUML
    autocmd!
    autocmd BufWinEnter,BufNewFile *.uml set filetype=plantuml
augroup END
NeoBundleLazy 'aklt/plantuml-syntax', { 'autoload' : {'filetypes' : 'plantuml', }}

NeoBundle 'scrooloose/syntastic'
noremap \s :SyntasticCheck<CR>
noremap \f :SyntasticToggleMode<CR>
noremap \r :SyntasticReset<CR>
function! ToggleErrors()
    if empty(filter(tabpagebuflist(), 'getbufvar(v:val, "&buftype") is# "quickfix"'))
        " No location/quickfix list shown, open syntastic error location panel
        Errors
    else
        lclose
    endif
endfunction
nnoremap <silent> \e :<C-u>call ToggleErrors()<CR>

NeoBundle 'derekwyatt/vim-scala'

NeoBundle 'rodjek/vim-puppet'

NeoBundle 'vim-scripts/copypath.vim'

NeoBundleLazy 'solarnz/thrift.vim', { 'autoload' : {'filetypes' : 'thrift', }}
NeoBundle 'ekalinin/Dockerfile.vim'

NeoBundleLazy 'fatih/vim-go', { 'autoload' : {'filetypes' : 'go', }}

NeoBundle 'rhysd/committia.vim'
let g:committia_hooks = {}
function! g:committia_hooks.edit_open(info)
    " Additional settings
    setlocal spell
endfunction

NeoBundle 'tpope/vim-fugitive'

NeoBundle 'zhisheng/visualmark.vim'

"NeoBundle 'phildawes/racer', { 'build' : { 'mac': 'cargo build --release', 'unix': 'cargo build --release' } }

NeoBundleLazy 'wting/rust.vim', { 'autoload' : {'filetypes' : 'rust', }}

NeoBundle 'thinca/vim-quickrun'
"let g:quickrun_config = { "_" : { "runner": "vimproc", "runner/vimproc/updatetime" : 50, "outputter/buffer/close_on_empty": 1, "outputter/buffer/split": ":botright 10sp", "outputter": "error", "outputter/error/success": "buffer", "outputter/error": "quickfix" } }
let g:quickrun_config = { "_" : { "runner": "vimproc", "runner/vimproc/updatetime" : 50, "outputter/buffer/close_on_empty": 1, "outputter/buffer/split": ":botright 10sp", "outputter": "error", "outputter/error/success": "buffer", "outputter/error": "quickfix" } }
noremap <leader>q :QuickRun<CR>
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

""end_neobundle


" =================================================
" NeoBundle setting

call neobundle#end()
filetype plugin indent on     " Required!
NeoBundleCheck


" =============================================
" Colorscheme
colorscheme jellybeans
set cursorline


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
