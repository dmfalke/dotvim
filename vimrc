" Must appear before "filetype on"
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set nu
set ai
set ts=4
set sw=4
set expandtab
set laststatus=2
set showmatch
set incsearch
set ruler
syn on
set t_Co=256
"set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized
"colorscheme ir_black
colorscheme default

filetype on

set tags+=$HOME/.vim/tags/python.ctags

" Open file with cursor at last position...
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif


" Filetype specific stuff.
" I generally like 4-space indentation...
autocmd FileType *                  : set ts=4 sw=4
" ... but here are some exceptions
autocmd FileType html               : set ts=2 sw=2
autocmd FileType htmldjango         : set ts=2 sw=2
autocmd FileType javascript         : set ts=2 sw=2
autocmd FileType yaml               : set ts=2 sw=2
