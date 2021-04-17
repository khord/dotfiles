set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ervandew/supertab'
Plugin 'PProvost/vim-ps1'

call vundle#end()            " required
filetype plugin on           " required

set number
set ruler
set cursorline
set hlsearch
syntax on

let g:solarized_termtrans = 1
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
set background=dark
colorscheme solarized
highlight Visual cterm=reverse ctermbg=NONE
set t_Co=256
