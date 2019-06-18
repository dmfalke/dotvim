set directory=~/.vim/swap/

command! -nargs=* Eupath execute "!eutask" <q-args>

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
set list
set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮,nbsp:×
set mouse=

" set conceallevel=1

if has("nvim")
  set inccommand=nosplit
endif

" disable Background Color Erase (BCE)
if &term =~ '256color'
  set t_ut=
endif

if has("termguicolors") && match($TERM, "screen") == -1
  set termguicolors
endif

syntax enable

" Colors
" ======

" I like VertSplit without a background
colo tender
hi VertSplit ctermbg=NONE ctermfg=gray guibg=NONE guifg=gray
hi Visual cterm=NONE ctermbg=gray gui=NONE guibg=#383838
hi clear SignColumn
let g:airline_theme='tender'
set fillchars=vert:\|

" colo OceanicNext
" let g:airline_theme='minimalist'

" set background=light
" colo snow
" let g:airline_theme = 'snow_light'

" set background=light
" colo off
" let g:airline_theme='pencil'

" set background=light
" colo off
" let g:airline_theme='minimalist'

" set background=light
" colo github
" hi clear SignColumn
" hi LineNr guibg=#F8F8FF

let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_powerline_fonts = 1
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" Open file with cursor at last position...
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

" fenced code blocks in markdown
let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json', 'jsx=javascript.jsx', 'ruby', 'sass', 'typescript', 'xml']

set wildignore+=*.swp
set wildignorecase
set wildmenu
set wildmode=full

" vim-rest-console
let g:vrc_curl_opts = {
  \ '-b': '/tmp/vrc_cookie_jar',
  \ '-LSsi': ''
\}

" === start_coc ===

set signcolumn=yes
set cmdheight=2
set updatetime=300

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Remap keys for coc gotos
" nmap <silent> <C-]> <Plug>(coc-definition)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" === end_coc ===

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
cnoremap <C-A> <Home>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>

" use ack
set grepprg=ack\ --nogroup\ --column\ $*
set grepformat=%f:%l:%c:%m

nnoremap <F5> :GundoToggle<CR>
" nnoremap <F9> :Dispatch<CR>
nnoremap <C-P> :FZF<CR>

let g:fzf_history_dir = '~/.local/share/fzf-history'

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
