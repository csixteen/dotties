syntax on


set nocompatible
set number
set autoindent
set showcmd         " Shows the command I'm executing
set relativenumber
set autoread        " Auto reads a file if it was changed from the outside
set showmatch       " Shows matching brackets when cursor is hovering
set cursorline
set ruler
set encoding=utf-8
set expandtab       " Use spaces instead of tabs


" -----------------------------------
"             File Search

set path+=**
set wildmenu
set wildignore+=bin\*,.git\*,*.o,*.pyc,*~,*.class,*.hi,*.ho


" ------------------------------------
"      Netrw (File Browser) Tweaks

let g:netrw_banner=0     " Disable banner
let g:netrw_altv=1       " Open splits to the right
let g:netrw_liststyle=3  " Tree view


" -----------------------------------
"             Text Search
             
set hlsearch
set incsearch


" ------------------------------------
"          Removing clutter

set nobackup
set directory=~/.vim/tmp
if !isdirectory(&directory)
        call mkdir(&directory, "p")
endif


"--------------------------------------
"       Vundle Plugin Manager

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Plugins go here
Plugin 'fatih/vim-go'

call vundle#end()

"     End of Vundle Plugin Manager
"--------------------------------------


filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

" -------------------------------------
"               Go stuff

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
