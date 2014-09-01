"search result as middle of scren
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz
nmap G Gzz

" Normal function
noremap <Space>h ^
noremap <Space>l $
nnoremap <Space>/ *

imap <C-b> <Left>
imap <C-f> <Right>

" Tab
" next tab
noremap ) gt
" prev tab
noremap ( gT

" nohl
noremap <Space>n :nohl<CR>

" tag jump
noremap  :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Tag new
noremap <C-N> :tab split<CR>
noremap  :vs<CR>
noremap  :sp<CR>

"Reload
noremap <C-x><C-l> :checktime<Enter>

"window moving
noremap <C-h> <C-W>h
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-l> <C-W>l

"Copy current word to clipboard
noremap @ viw"*y
