" Must appear before "filetype on"
" call pathogen#runtime_append_all_bundles()
" call pathogen#helptags()

source ~/.vim/bundles.vim

let mapleader=","

set encoding=utf-8
set nu
set ai
set laststatus=2
set showmatch
set incsearch
set ruler
set hlsearch
set list listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮,nbsp:×
syn on
colorscheme molokai

" Open file with cursor at last position...
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif


" ctrl-p stuff - see http://kien.github.com/ctrlp.vim/
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_root_markers = ['Capfile']
set wildignore+=*.swp

let g:notes_directories = ['~/Dropbox/Notes']

let g:Powerline_stl_path_style = 'short'
"let g:Powerline_symbols = 'unicode'
"let g:airline_powerline_fonts = 1

let g:airline_left_sep=''
let g:airline_right_sep=''

" by default, {N}gs will put vim to sleep for N seconds
map gs :call Stringify()<CR>

" Filetype specific stuff.
set ts=2 sw=2 expandtab
"autocmd FileType text         : Prose

" mapping of extensions to filetypes
"au BufNewFile,BufRead *.tag set filetype=jsp
au BufNewFile,BufRead *.json set filetype=javascript
au BufNewFile,BufRead *.handlebars set filetype=mustache
au BufNewFile,BufRead *.md set filetype=markdown
au BufRead,BufNewFile Capfile set ft=ruby


nnoremap <F5> :GundoToggle<CR>

command! Prose inoremap <buffer> . .<C-G>u|
            \ inoremap <buffer> ! !<C-G>u|
            \ inoremap <buffer> ? ?<C-G>u|
            \ setlocal spell spelllang=sv,en
            \     nolist wrap linebreak tw=74
            \     foldcolumn=0 fo=t1 nonu|
            \ augroup PROSE|
"            \   autocmd InsertEnter <buffer> set fo+=a|
"            \   autocmd InsertLeave <buffer> set fo-=a|
            \ augroup END

command! Code silent! iunmap <buffer> .|
            \ silent! iunmap <buffer> !|
            \ silent! iunmap <buffer> ?|
            \ setlocal nospell nowrap
            \     tw=74 fo=cqr1 showbreak=… nu|
            \ silent! autocmd! PROSE * <buffer>

set exrc "replaces stuff below 
