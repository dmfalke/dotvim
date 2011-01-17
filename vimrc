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
filetype on

if has("gui_running")
    "set t_Co=256
    colorscheme darkspectrum
    set guifont=Menlo\ Regular:h13
    set guioptions-=T
    set columns=128
    set lines=64
else
    "colorscheme zellner
endif

set tags+=$HOME/.vim/tags/python.ctags

" Filetype specific stuff

" I generally like 4-space indentation...
autocmd FileType * :set ts=4 sw=4
" ... but here are some exceptions
autocmd FileType html :set ts=2 sw=2
autocmd FileType htmldjango :set ts=2 sw=2
autocmd FileType javascript :set ts=2 sw=2
autocmd FileType yaml :set ts=2 sw=2
