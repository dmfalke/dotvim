" Must appear before "filetype on"
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set encoding=utf-8
set nu
set ai
set laststatus=2
set showmatch
set incsearch
set ruler
set hlsearch
set tags=~/.tags
set list listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮,nbsp:×
set t_Co=256
" set wildmenu
" set wildmode=list
syn on
colorscheme jellybeans

let mapleader=" "

filetype plugin indent on

" Set filetypes
au BufRead,BufNewFile Capfile set ft=ruby


" Open file with cursor at last position...
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif


" ctrl-p stuff - see http://kien.github.com/ctrlp.vim/
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_working_path_mode = 0
" set wildignore+=*.swp

let g:Powerline_stl_path_style = 'short'
"let g:Powerline_symbols = 'unicode'

" Filetype specific stuff.
" I generally like 4-space indentation [no TABs at all]...
set ts=4 sw=4 expandtab
" ... but here are some exceptions
autocmd FileType css          : set ts=2 sw=2
autocmd FileType html         : set ts=2 sw=2
autocmd FileType htmldjango   : set ts=2 sw=2
autocmd FileType java         : set ts=2 sw=2
autocmd FileType javascript   : set ts=2 sw=2
autocmd FileType jsp          : set ts=2 sw=2
autocmd FileType ruby         : set ts=2 sw=2
autocmd FileType yaml         : set ts=2 sw=2
autocmd FileType xml          : set ts=2 sw=2
"autocmd FileType text         : set wrap linebreak spell
autocmd FileType text         : Prose

" mapping of extensions to filetypes
" au BufNewFile,BufRead *.tag set filetype=jsp
au BufNewFile,BufRead *.json set filetype=javascript


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

set exrc
" ====================== BEGIN ==============================
" let s:wdir = $PROJECT_HOME
" if match(getcwd(), s:wdir) != -1
"     let s:project_vimrc=findfile(".vimrc", ".;" . $PROJECT_HOME)
"     if exists("s:project_vimrc") && filereadable(expand(s:project_vimrc))
"         execute "source ".s:project_vimrc
"     endif
" endif
" ====================== END ================================
