set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
set nocompatible              " be iMproved, required
filetype off                  " required

:lua require('dxas90')