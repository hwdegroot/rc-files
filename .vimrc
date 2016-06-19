
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

" Vagrant highlightinh
Plugin 'hashivim/vim-vagrant'

" Plugin vim puppet
Plugin 'rodjek/vim-puppet.git'

" Puppet syntax highlighting
Plugin 'puppetlabs/puppet-syntax-vim'

" Python autocompletion
Plugin 'davidhalter/jedi-vim'

"Vim powerline
Plugin 'Lokaltog/vim-powerline'

" Clojure plugins inc fireplace
Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-clojure-highlight'
call vundle#end()            " required
filetype plugin indent on    " required

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

" Change end-of-line, space and tab characters.
set list
set listchars=eol:$,trail:·,tab:»·,extends:>,precedes:<
hi NonText ctermfg=238 ctermbg=NONE guifg=#000000 guibg=NONE
hi SpecialKey ctermfg=130 ctermbg=NONE guifg=#af5f00 guibg=NONE

" show the matching part of the pair for [] {} and ()
set showmatch

"================================================================="
"                    MAPPING CONFIGURATION
"================================================================="

" Use silent for previous and next buffer (switch tabs as you will)
map <Esc>[1;5A <C-Up>
map <Esc>[1;5B <C-Down>
map <Esc>[1;5C <C-Right>
map <Esc>[1;5D <C-Left>
map <Esc>[1;2A <S-Up>
map <Esc>[1;2B <S-Down>
map <Esc>[0;2C <S-Right>
map <Esc>[1;2D <S-Left>
map <Esc>[1;3A <Alt-Up>
map <Esc>[1;3B <Alt-Down>
map <Esc>[1;3C <Alt-Right>
map <Esc>[1;3D <Alt-Left>
vnoremap y "*y
nnoremap <silent> <C-Up> dd<Up>P
nnoremap <silent> <C-Down> dd<Down>P
nnoremap <silent> <C-Left> :bprev!<cr>
nnoremap <silent> <C-Right> :bnext!<cr>

"================================================================="
"                    PLUGIN CONFIGURATION
"================================================================="
" Git highlighting in vim
set backspace=2
autocmd Filetype gitcommit setlocal textwidth=72

autocmd BufNewFile,BufRead,BufEnter *.groovy,Jenkinsfile  setf groovy
" Evaluate Clojure buffers on load
autocmd BufNewFile,BufRead,BufEnter *.clj(s?) try | silent! Require | catch /^Fireplace/ | endtry

" clojure
let g:clojure_align_multiline_strings = 1

" enable all Python syntax highlighting features
let python_highlight_all = 1

" Jedi autocompletion stuff for vim
" https://github.com/davidhalter/jedi-vim
let g:jedi#use_splits_not_buffers = "right"

" Rainbow parenthesis
let g:rbpt_colorpairs = [
  \ ['brown',       'RoyalBlue3'],
  \ ['Darkblue',    'SeaGreen3'],
  \ ['darkgray',    'DarkOrchid3'],
  \ ['darkgreen',   'firebrick3'],
  \ ['darkcyan',    'RoyalBlue3'],
  \ ['darkred',     'SeaGreen3'],
  \ ['darkmagenta', 'DarkOrchid3'],
  \ ['brown',       'firebrick3'],
  \ ['gray',        'RoyalBlue3'],
  \ ['black',       'SeaGreen3'],
  \ ['darkmagenta', 'DarkOrchid3'],
  \ ['Darkblue',    'firebrick3'],
  \ ['darkgreen',   'RoyalBlue3'],
  \ ['darkcyan',    'SeaGreen3'],
  \ ['darkred',     'DarkOrchid3'],
  \ ['red',         'firebrick3'],
  \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

