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

"Tags
noremap  

"Reload
noremap <C-L> :checktime<Enter>


""" Plugins

""unite
"show recent open files
noremap :uh :Unite file_mru -buffer-name=file_mru

"show buffer and files
noremap :ub :Unite buffer -buffer-name=buffer
noremap :ua :Unite buffer file file_mru -buffer-name=all_stuff

"show current dir files
noremap :uf :Unite file -buffer-name=file
noremap :ufa :Unite file_rec buffer -buffer-name=file_rec
