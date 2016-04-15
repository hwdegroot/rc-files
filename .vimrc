
set nocompatible              " be iMproved, required
filetype off                  " required
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugin from a git* repo
"Plugin 'Valloric/YouCompleteMe'

" Puppet syntax highlighting
Plugin 'puppetlabs/puppet-syntax-vim'

" Python autocompletion
Plugin 'davidhalter/jedi-vim'

"Vim powerline
Plugin 'Lokaltog/vim-powerline'
call vundle#end()            " required
filetype plugin indent on    " required

au BufNewFile,BufRead,BufEnter *.groovy,Jenkinsfile  setf groovy

set number
set nocp

"Use monokai colorscheme for vim
"see: https://github.com/sickill/vim-monokai
syntax enable
colorscheme monokai

" size of a hard tabstop
set tabstop=2

" size of an "indent"
set shiftwidth=2

" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=2

" make "tab" insert indents instead of tabs at the beginning of a line
set smarttab

" " always uses spaces instead of tab characters
set expandtab

" Git highlighting in vim
set backspace=2
autocmd Filetype gitcommit setlocal textwidth=72

" Change end-of-line, space and tab characters.
set list
set listchars=eol:$,trail:·,tab:»·,extends:>,precedes:<
hi NonText ctermfg=238 ctermbg=None guifg=#000000 guibg=None
hi SpecialKey ctermfg=130 ctermbg=None guifg=#af5f00 guibg=None

" enable all Python syntax highlighting features
let python_highlight_all = 1

" show the matching part of the pair for [] {} and ()
set showmatch

" Use silent for previous and next buffer (switch tabs as you will)
nnoremap <silent> <F11> :bprev<cr>
nnoremap <silent> <F12> :bnext<cr>

vnoremap y "+y
map <C-s> :w<CR>

" Jedi autocompletion stuff for vim
" https://github.com/davidhalter/jedi-vim
let g:jedi#use_splits_not_buffers = "right"
