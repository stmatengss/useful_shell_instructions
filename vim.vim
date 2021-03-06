set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'

Bundle 'taglist.vim'    
Bundle 'scrooloose/nerdtree' " 加入NERDTree
Bundle 'git@github.com:Lokaltog/vim-powerline.git'
Bundle 'Visual-Mark'
Plugin 'oplatek/Conque-Shell' " A useful tool to open a commandline in vim

call vundle#end()            " required
filetype plugin indent on    " required

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
