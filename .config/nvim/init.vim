set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin("~/.local/share/nvim/plugged")

" Gruvbox theme
Plug 'morhetz/gruvbox'

" Status bar
Plug 'itchyny/lightline.vim'

" Git wrapper
Plug 'tpope/vim-fugitive'

" File explorer
Plug 'scrooloose/nerdtree'

call plug#end()
filetype plugin indent on

" Set vim theme
"
try
    colorscheme gruvbox
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
endtry

" Gruvbox theme settings
"
set background=dark
let g:gruvbox_contrast_dark  = "soft"
let g:gruvbox_contrast_light = "soft"
" Comment this out once terminal theme is different from gruvbox
autocmd VimEnter * hi Normal ctermbg=none

" Make sure syntax highlighting is on
"
syntax on

" Make sure tab is 4 spaces
"
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Enable line numbers
"
set number

" NERDtree settings
"
map <C-n> :NERDTreeToggle<CR>

" Lightline settings
"
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ }

" Enable noshowmode
"
set noshowmode

