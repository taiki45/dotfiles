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
