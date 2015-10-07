set directory=~/.vim/swap/

command! -nargs=* Eupath execute "!eutask" <q-args>

" disabled plugins are added here
let g:pathogen_disabled = [ 'syntastic' ]

execute pathogen#infect()

let mapleader=","

set encoding=utf-8
set number
set autoindent
set cursorline
set showmatch
set incsearch
set laststatus=2
set ruler
set hlsearch
set list listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮,nbsp:×
syntax on
filetype plugin indent on
colorscheme molokai

" Open file with cursor at last position...
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif

" JSX in .js files
let g:jsx_ext_required = 0

" fenced code blocks in markdown
let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml']

" ctrl-p
let g:ctrlp_working_path_mode = ''
" let g:ctrlp_cmd = 'CtrlPMixed'

set wildignore+=*.swp

" vim-rest-console
let g:vrc_cookie_jar = '/tmp/vrc_cookie_jar'
let g:vrc_follow_redirects = 1


" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:notes_directories = ['~/Dropbox/Notes']

let g:Powerline_stl_path_style = 'short'
"let g:Powerline_symbols = 'unicode'
"let g:airline_powerline_fonts = 1

let g:airline_left_sep=''
let g:airline_right_sep=''

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']

" by default, {N}gs will put vim to sleep for N seconds
map gs :call Stringify()<CR>

" Filetype specific stuff.
set ts=2 sw=2 expandtab
"autocmd FileType text         : Prose

" mapping of extensions to filetypes
"au BufNewFile,BufRead *.tag set filetype=jsp
au BufNewFile,BufRead *.json set filetype=javascript
au BufNewFile,BufRead *.handlebars set filetype=mustache
au BufNewFile,BufRead *.md set filetype=markdown textwidth=80
au BufRead,BufNewFile Capfile set ft=ruby


nnoremap <F5> :GundoToggle<CR>

command! Prose inoremap <buffer> . .<C-G>u|
            \ inoremap <buffer> ! !<C-G>u|
            \ inoremap <buffer> ? ?<C-G>u|
            \ setlocal spell spelllang=sv,en
            \     nolist wrap linebreak tw=80
            \     foldcolumn=0 fo=t1 nonu|
            \ augroup PROSE|
"            \   autocmd InsertEnter <buffer> set fo+=a|
"            \   autocmd InsertLeave <buffer> set fo-=a|
            \ augroup END

command! Code silent! iunmap <buffer> .|
            \ silent! iunmap <buffer> !|
            \ silent! iunmap <buffer> ?|
            \ setlocal nospell nowrap
            \     tw=0 fo=cqr1 showbreak=… nu|
            \ silent! autocmd! PROSE * <buffer>

set exrc "replaces stuff below 
