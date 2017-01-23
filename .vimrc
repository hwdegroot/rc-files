
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

" Typescript
Plugin 'leafgarland/typescript-vim'
" Plugin vim puppet
Plugin 'rodjek/vim-puppet.git'

" Puppet syntax highlighting
Plugin 'puppetlabs/puppet-syntax-vim'

" Python autocompletion
Plugin 'davidhalter/jedi-vim'

" Vim powerline
Bundle 'powerline/powerline', { 'rtp': 'powerline/bindings/vim/' }

" Coffee script
Plugin 'kchmck/vim-coffee-script'

" Vim rails
Plugin 'tpope/vim-rails'

" Git plugin
Plugin 'tpope/vim-fugitive'

" Clojure plugins inc fireplace
Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-clojure-highlight'

" Erlang autocompletion
Plugin 'vim-erlang/vim-erlang-omnicomplete'

call vundle#end()            " required
filetype plugin indent on    " required

" Change end-of-line, space and tab characters.
set list
set listchars=eol:$,trail:·,tab:»·,extends:»,precedes:«
hi NonText ctermfg=238 ctermbg=NONE guifg=#000000 guibg=NONE
hi SpecialKey ctermfg=130 ctermbg=NONE guifg=#af5f00 guibg=NONE
" Show trailing whitepace and spaces before a tab:
"autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
autocmd InsertLeave * redraw!
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWritePre * :%s/\s\+$//e
"Use monokai colorscheme for vim
"see: https://github.com/sickill/vim-monokai
syntax on
colorscheme monokai


" set linenumbers
set number

" Do not use vi mode
set nocompatible
" Always indent spaces
set expandtab

" size of a hard tabstop
set tabstop=2

" size of an indent
set shiftwidth=2

" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=2

" Enable mouse scrolling
set mouse=a

" Use system clipboard iso vim cut buffer
set clipboard=unnamed
"vnoremap y "*y

" Search options
set hlsearch
set incsearch
nnoremap <F3> :set hlsearch!<CR>

" show the matching part of the pair for [] {} and ()
set showmatch

" Insert date
nnoremap <C-t> "=strftime("%Y/%m/%d")<CR>p
nnoremap <C-Shift-t> "=strftime("%Y/%m/%d %H:%M:%S")<CR>p

set cursorline

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
nnoremap <C-Down> :m .+1<CR>==
nnoremap <C-Up> :m .-2<CR>==
inoremap <C-Down> <Esc>:m .+1<CR>==gi
inoremap <C-UP> <Esc>:m .-2<CR>==gi
vnoremap <C-Down> :m '>+1<CR>gv=gv
vnoremap <C-Up> :m '<-2<CR>gv=gv
noremap <silent> <C-Left> :bprev!<CR>
noremap <silent> <C-Right> :bnext!<CR>
nnoremap <C-l> :buffers!<CR>:buffer<Space>
noremap <silent> <C-d>b :diffg BA<CR>
noremap <silent> <C-d>r :diffg RE<CR>
noremap <silent> <C-d>l :diffg LO<CR>
inoremap <S-Tab> <C-V><Tab>
map <C-c> :bd<CR>
"================================================================="
"                    PLUGIN CONFIGURATION
"================================================================="
" Git highlighting in vim
set backspace=2
autocmd Filetype gitcommit setlocal textwidth=72

" Set ruby syntax for Vagrantfile
au BufNewFile,BufRead,BufEnter Vagrantfile setf ruby

" Set groovy syntax for Jenkinsfile
autocmd BufNewFile,BufRead,BufEnter *.groovy,Jenkinsfile  setf groovy

" Evaluate Clojure buffers on load
autocmd BufNewFile,BufRead,BufEnter *.clj(s?) try | silent! Require | catch /^Fireplace/ | endtry

" Typescript
au BufRead,BufNewFile,BufRead,BufEnter *.ts,*.tsx setf typescript

" clojure edit mode
let g:paredit_mode = 1

" clojure static
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
  \ ['darkmagenta', 'DarkOrchid3'],
  \ ['darkgreen',   'RoyalBlue3'],
  \ ['darkcyan',    'SeaGreen3'],
  \ ['darkred',     'DarkOrchid3'],
  \ ['red',         'firebrick3'],
  \ ]
let g:rbpt_max = 14
let g:rbpt_loadcmd_toggle = 0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

