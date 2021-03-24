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

" Let NeoBundle manage NeoBundle
NeoBundle 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc'

" My Bundles here:
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
"show recent open files
NeoBundle 'Shougo/neomru.vim'
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
noremap <C-X><C-K> :<C-u>Unite file_rec/git:--cached:--others:--exclude-standard -buffer-name=file_rec -no-split<CR>
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

"let g:unite_source_grep_default_opts = '-E'

" use rg or ag instead of grep
if executable('rg')
    let g:unite_source_grep_command = 'rg'
    let g:unite_source_grep_default_opts = '--hidden --no-heading --vimgrep -S'
    let g:unite_source_grep_recursive_opt = ''
elseif executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
    let g:unite_source_grep_recursive_opt = ''
endif

"" Ruby
"au BufRead,BufNewFile,BufReadPre *.iam set filetype=ruby
NeoBundleLazy 'vim-ruby/vim-ruby', { 'autoload' : {'filetypes' : 'ruby', }}
autocmd FileType ruby set expandtab
autocmd FileType ruby set tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType ruby set autoindent
autocmd FileType eruby set tabstop=2 shiftwidth=2 softtabstop=2

NeoBundleLazy 'dag/vim2hs', { 'autoload' : {'filetypes' : 'haskell', }}
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

NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tomasr/molokai'
NeoBundle 'w0ng/vim-hybrid'

NeoBundleLazy 'vim-scripts/hlint', { 'autoload' : {'filetypes' : 'haskell', }}

NeoBundle 'w0rp/ale'
let g:ale_sign_column_always = 0
let g:ale_fix_on_save = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_save = 1
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"let g:ale_maximum_file_size = 0
nmap <silent> <C-x><C-p> <Plug>(ale_previous_wrap)
nmap <silent> <C-x><C-n> <Plug>(ale_next_wrap)
fun! SetupCommandAlias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun
call SetupCommandAlias('af','ALEFix')
let g:ale_linters = {
\ 'javascript': ['eslint'],
\ 'ruby': ['ruby'],
\ 'go': ['gosimple', 'golangserver', 'go build', 'gotype', 'gofmt', 'staticcheck', 'goimports', 'golint'],
\}
" 'go': ['gofmt', 'goimports', 'go mod', 'golint', 'gotype', 'gometalinter', 'go build', 'gosimple', 'staticcheck', 'golangserver', 'golangci-lint'],
let g:ale_fixers = {
\ 'javascript': ['eslint'],
\ 'cpp': ['clang-format'],
\ 'ruby': ['rubocop'],
\ 'rust': ['rustfmt'],
\}
let g:ale_pattern_options = {
\   '.*git-rebase-todo$': {'ale_enabled': 0},
\}


NeoBundle 'vim-scripts/copypath.vim'

"NeoBundleLazy 'vim-jp/vim-go-extra', { 'autoload' : {'filetypes' : 'go', }}
NeoBundle 'fatih/vim-go' ", { 'autoload' : {'filetypes' : 'go', }}
au FileType go setlocal sw=4 ts=4 sts=4 noet
"au FileType go nmap <C-T> <C-O>
"au FileType go nmap <C-]> gd
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
"autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
let g:go_metalinter_enabled = ['golint', 'errcheck']
let g:go_metalinter_disabled = ['vet']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['golint', 'errcheck']
let g:go_metalinter_deadline = "5s"
"autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
"autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
"autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
"autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

NeoBundle 'rhysd/committia.vim'
let g:committia_hooks = {}
function! g:committia_hooks.edit_open(info)
    " Additional settings
    setlocal spell
endfunction

NeoBundle 'tpope/vim-fugitive'

NeoBundle 'zhisheng/visualmark.vim'

NeoBundle 'rust-lang/rust.vim'
let g:rustfmt_autosave = 1
let g:rustfmt_fail_silently = 1
NeoBundleLazy 'racer-rust/vim-racer', { 'autoload' : {'filetypes' : 'ust', }}
NeoBundleLazy 'cespare/vim-toml', { 'autoload' : {'filetypes' : 'toml', }}

NeoBundleLazy 'jdevera/vim-protobuf-syntax', {'autoload':{'filetypes':['proto']}}

NeoBundleLazy 'hashivim/vim-terraform' , {'autoload':{'filetypes':['terraform', 'tf']}}
let g:terraform_fmt_on_save = 0

NeoBundle 'bazelbuild/vim-ft-bzl', {'autoload':{'filetypes':['bzl', 'bazel']}}

NeoBundleLazy 'vim-scripts/a.vim', {'autoload':{'filetypes':['cpp', 'c']}}
NeoBundleLazy 'vim-jp/vim-cpp', {'autoload':{'filetypes':['cpp', 'c']}}
NeoBundleLazy 'octol/vim-cpp-enhanced-highlight', {'autoload':{'filetypes':['cpp']}}
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_concepts_highlight = 1
"let g:cpp_no_function_highlight = 1
let g:cpp_class_scope_highlight = 1

NeoBundleLazy 'google/vim-jsonnet', {'autoload':{'filetypes':['jsonnet']}}

"NeoBundle 'k0kubun/vim-open-github'

""endneobundle


" =================================================
" NeoBundle setting

call neobundle#end()
filetype plugin indent on     " Required!
NeoBundleCheck


" =============================================
" Colorscheme
colorscheme jellybeans
"set cursorline


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
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

if !exists('g:neocomplcache_member_prefix_patterns')
  let g:neocomplcache_member_prefix_patterns = {}
endif
let g:neocomplcache_member_prefix_patterns['php'] = ''
