" Must appear before "filetype on"
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set encoding=utf-8
set nu
" set relativenumber
set ai
" set scrolloff=3
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
colorscheme distinguished

let mapleader=","

filetype plugin indent on

" Set filetypes
au BufRead,BufNewFile Capfile set ft=ruby


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

" Filetype specific stuff.
" I generally like 2-space indentation [no TABs at all]...
set ts=2 sw=2 expandtab
" ... but here are some exceptions
"autocmd FileType css          : set ts=2 sw=2
"autocmd FileType html         : set ts=2 sw=2
"autocmd FileType htmldjango   : set ts=2 sw=2
"autocmd FileType java         : set ts=2 sw=2
"autocmd FileType javascript   : set ts=2 sw=2
"autocmd FileType jsp          : set ts=2 sw=2
"autocmd FileType ruby         : set ts=2 sw=2
"autocmd FileType yaml         : set ts=2 sw=2
"autocmd FileType xml          : set ts=2 sw=2
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

" display output of shell in new buffer
" http://vim.wikia.com/wiki/Display_output_of_shell_commands_in_new_window
" Use like :Shell cmd
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
command! -complete=file -nargs=* Svn call s:RunShellCommand('svn '.<q-args>)

function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction

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
