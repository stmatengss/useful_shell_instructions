set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'

Bundle 'taglist.vim'    
Bundle 'scrooloose/nerdtree' " 加入NERDTree
Bundle 'git@github.com:Lokaltog/vim-powerline.git'
Bundle 'Visual-Mark'


call vundle#end()            " required
filetype plugin indent on    " required
