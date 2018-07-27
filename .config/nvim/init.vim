set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin("~/.config/nvim/bundle")

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Gruvbox theme
Plugin 'morhetz/gruvbox'

" Status bar
Plugin 'vim-airline/vim-airline'

" Git wrapper
Plugin 'tpope/vim-fugitive'

call vundle#end()            " required
filetype plugin indent on    " required

" Set vim theme
colorscheme gruvbox

" Gruvbox theme settings
set background=dark
let g:gruvbox_contrast_dark  = "soft"
let g:gruvbox_contrast_light = "soft"

" Make sure syntax highlighting is on
syntax on

" Make sure tab is 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Enable line numbers
set number

