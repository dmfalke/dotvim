" Must appear before "filetype on"
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set nu
set ai
set laststatus=2
set showmatch
set incsearch
set ruler
set hlsearch
syn on
colorscheme default
set bg=dark

set t_Co=256

set tags=~/.tags

filetype on

" Open file with cursor at last position...
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif

" Filetype specific stuff.
" I generally like 4-space indentation [no TABs at all]...
set ts=4 sw=4 expandtab
" ... but here are some exceptions
autocmd FileType html               : set ts=2 sw=2
autocmd FileType htmldjango         : set ts=2 sw=2
autocmd FileType java               : set ts=2 sw=2
autocmd FileType javascript         : set ts=2 sw=2
autocmd FileType jsp                : set ts=2 sw=2
autocmd FileType ruby               : set ts=2 sw=2
autocmd FileType yaml               : set ts=2 sw=2
autocmd FileType text               : set wrap linebreak spell

" mapping of extensions to filetypes
au BufNewFile,BufRead *.tag set filetype=jsp
