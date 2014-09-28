set nocompatible
filetype off

" Vundle setup
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Bundle 'gmarik/Vundle.vim'
filetype plugin indent on

" gui-ness
"Bundle 'scrooloose/nerdtree.git'
"Bundle 'Lokaltog/vim-powerline.git'
Bundle 'bling/vim-airline.git'
"Bundle 'kien/ctrlp.vim.git'
"Bundle 'mikewest/vimroom'
Bundle 'tpope/vim-vinegar.git'

" syntax and language
" Bundle 'tpope/vim-haml.git'
" Bundle 'tpope/vim-markdown.git'
" Bundle 'pangloss/vim-javascript'
" Bundle 'groenewege/vim-less.git'
" Bundle 'mustache/vim-mustache-handlebars'
Bundle 'sheerun/vim-polyglot.git'

Bundle 'Shutnik/jshint2.vim.git'
Bundle 'moll/vim-node.git'


" conveniences
Bundle 'godlygeek/tabular.git'
Bundle 'terryma/vim-multiple-cursors.git'
Bundle 'tpope/vim-fugitive.git'
Bundle 'tpope/vim-surround.git'
Bundle 'tpope/vim-unimpaired.git'
Bundle 'sjl/gundo.vim'
Bundle 'vim-scripts/vcscommand.vim'
Bundle '29decibel/vim-stringify.git'
Bundle 'tpope/vim-ragtag.git'
"Bundle 'tpope/vim-classpath.git'

" external integration
Bundle 'mileszs/ack.vim.git'
Bundle 'tpope/vim-dispatch.git'

" colors
" Bundle 'altercation/vim-colors-solarized.git'
Bundle 'flazz/vim-colorschemes.git'
Bundle 'Lokaltog/vim-distinguished'
Bundle 'vim-scripts/molokai'
Bundle 'goatslacker/mango.vim.git'

call vundle#end()
