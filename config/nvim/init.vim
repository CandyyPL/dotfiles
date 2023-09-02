" NeoVim config by Candyy
" Created 01.09.2023

set tabstop=2
set expandtab
set softtabstop=2
set shiftwidth=2

set autoindent
set smartindent

set noswapfile

set number
set mouse=a
set cursorline

syntax on

map <F1> :w<CR>
map <F2> :wa<CR>
map <F3> :q<CR>
map <F4> :qa<CR>
map <F5> :PlugInstall<CR>
map <F6> :NERDTreeToggle<CR>

call plug#begin()

  Plug 'Townk/vim-autoclose'
  Plug 'preservim/nerdtree'
  Plug 'navarasu/onedark.nvim'
  Plug 'itchyny/lightline.vim'
  Plug 'ryanoasis/vim-devicons'

call plug#end()

colorscheme onedark

set laststatus=2
set noshowmode
set encoding=UTF-8

let g:lightline = {
  \ 'colorscheme': 'one',
  \ }

