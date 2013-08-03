"Plugin Settings

"" ruby and html bracket match
source $VIMRUNTIME/macros/matchit.vim

"" coffe script
"autocmd BufWritePost *.coffee silent CoffeeMake! -cb | cwindow | redraw!

"" Gauche
autocmd FileType scheme :let is_gauche=1


"" RSpec and quickrun setting
let g:quickrun_config = {}

let g:quickrun_config['ruby.rspec'] = {'command': 'rspec'}

augroup UjihisaRSpec
    autocmd!
    autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END


"" neko-ghc
let $PATH = $PATH . ':' . expand("~/.cabal/bin")

"" indent-guides
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * : highlight IndentGuidesOdd  ctermbg=236
autocmd VimEnter,Colorscheme * : highlight IndentGuidesEven ctermbg=234


"" Vim Powerline
let g:Powerline_symbols = 'fancy'
set ambiwidth=double
