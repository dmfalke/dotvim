set directory=~/.vim/swap/

command! -nargs=* Eupath execute "!eutask" <q-args>

" disabled plugins are added here
let g:pathogen_disabled = [ 'neomake', 'nvim-typescript' ]

execute pathogen#infect()

set rtp+=~/repos/fzf

let mapleader=","
filetype plugin indent on

set nowrap
set encoding=utf-8
set guifont=Knack\ Regular\ Nerd\ Font\ Complete:h11
set number
set relativenumber
set autoindent
set cursorline
set showmatch
set ignorecase
set smartcase
set incsearch
set laststatus=2
set ruler
set hlsearch
set list listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮,nbsp:×
set mouse=
" set conceallevel=1

" disable Background Color Erase (BCE)
if &term =~ '256color'
  set t_ut=
endif

if has("termguicolors")
  set termguicolors
endif

syntax enable
colo tender

" I like VertSplit without a background
hi VertSplit ctermbg=NONE ctermfg=gray guibg=NONE guifg=gray
hi Visual cterm=NONE ctermbg=gray gui=NONE guibg=#383838

" Open file with cursor at last position...
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

" fenced code blocks in markdown
let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json', 'jsx=javascript.jsx', 'ruby', 'sass', 'typescript', 'xml']

set wildignore+=*.swp

" vim-rest-console
let g:vrc_curl_opts = {
  \ '-b': '/tmp/vrc_cookie_jar',
  \ '-LSsi': ''
\}

let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme = 'tender'
let g:airline_powerline_fonts = 1

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_typescript_checkers = ['tsuquyomi']

let g:tsuquyomi_disable_quickfix = 1
let g:tsuquyomi_javascript_support = 1
let g:tsuquyomi_definition_split = 2
let g:tsuquyomi_single_quote_import = 1

" neomake
" autocmd! BufWritePost,BufEnter * Neomake
" let g:neomake_javascript_enabled_makers = ['eslint']
" let g:neomake_typescript_enabled_makers = ['tsc']

let g:javascript_conceal_function       = "ƒ"
let g:javascript_conceal_null           = "ø"
let g:javascript_conceal_this           = "@"
let g:javascript_conceal_return         = "⇚"
let g:javascript_conceal_undefined      = "¿"
let g:javascript_conceal_NaN            = "ℕ"
let g:javascript_conceal_prototype      = "¶"
let g:javascript_conceal_static         = "•"
let g:javascript_conceal_super          = "Ω"
let g:javascript_conceal_arrow_function = "⇒"

" let g:javascript_plugin_jsdoc = 1

" by default, {N}gs will put vim to sleep for N seconds
map gs :call Stringify()<CR>

" Filetype specific stuff.
set ts=2 sw=2 expandtab
"autocmd FileType text         : Prose

" mapping of extensions to filetypes
"au BufNewFile,BufRead *.tag set filetype=jsp
"au BufNewFile,BufRead *.json set filetype=javascript
au BufNewFile,BufRead *.handlebars set filetype=mustache
au BufNewFile,BufRead *.md set filetype=markdown textwidth=80
au BufNewFile,BufRead Capfile set ft=ruby

" emacs-style command-line shortcuts
:cnoremap <C-A> <Home>
:cnoremap <C-F> <Right>
:cnoremap <C-B> <Left>
:cnoremap <Esc>b <S-Left>
:cnoremap <Esc>f <S-Right>

" use ack
set grepprg=ack\ --nogroup\ --column\ $*
set grepformat=%f:%l:%c:%m

nnoremap <F5> :GundoToggle<CR>
nnoremap <F9> :Dispatch<CR>
nnoremap <C-P> :FZF<CR>

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

set exrc
set secure
