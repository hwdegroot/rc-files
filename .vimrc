set nocompatible              " be iMproved, required
filetype off                  " required
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs

" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')
" Colorschemes \o/
Plug 'flazz/vim-colorschemes'
" Typescript
Plug 'leafgarland/typescript-vim'
" Plugin vim puppet
Plug 'rodjek/vim-puppet'
" Puppet syntax highlighting
Plug 'puppetlabs/puppet-syntax-vim'
" Python autocompletion
Plug 'davidhalter/jedi-vim'
" Vim powerline
Plug 'powerline/powerline', { 'rtp': 'powerline/bindings/vim/' }
" Coffee script
Plug 'kchmck/vim-coffee-script'
" Vim rails
Plug 'tpope/vim-rails'
" Git plugin
Plug 'tpope/vim-fugitive'
" Clojure plugins inc fireplace
Plug 'tpope/vim-fireplace'
Plug 'guns/vim-clojure-static'
Plug 'guns/vim-clojure-highlight'
" Erlang autocompletion
Plug 'vim-erlang/vim-erlang-omnicomplete'
" Powershell highlight
Plug 'PProvost/vim-ps1'
" Javascript development
Plug 'pangloss/vim-javascript'
Plug 'crusoexia/vim-javascript-lib'
" undo vim
Plug 'sjl/gundo.vim'
" Haskell
Plug 'eagletmt/ghcmod-vim'
Plug 'neovimhaskell/haskell-vim'
call plug#end()            " required
filetype plugin indent on    " required

" Change end-of-line, space and tab characters.
set list
set listchars=eol:$,trail:·,tab:»·,extends:»,precedes:«
hi NonText ctermfg=238 ctermbg=NONE guifg=#000000 guibg=NONE
hi SpecialKey ctermfg=130 ctermbg=NONE guifg=#af5f00 guibg=NONE
" Show trailing whitepace and spaces before a tab:
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
autocmd InsertLeave * redraw!
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWritePre * :%s/\s\+$//e

" Highlight current line
set cursorline
" Colorscheme
colorscheme monokai
colorscheme molokai
"colorscheme badwolf
"let g:badwolf_darkgutter = 1
"let g:badwolf_tabline = 2

" redraw only when we need to.
"set lazyredraw
" visual autocomplete for command menu
set wildmenu
" Enable syntax highlighting
syntax on
" set linenumbers
set number
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
" highlight matches
set hlsearch
" Start searching as soon as characters are entered
set incsearch
" turn off search highlight
let hlstate=0
nnoremap <F3> :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1<cr>
" show the matching part of the pair for [] {} and ()
set showmatch

" Folding
" enable folding
set foldenable
" 10 nested fold max
set foldnestmax=10
" open most folds by default
set foldlevelstart=10
" space open/closes folds
nnoremap <space> za
" fold based on indent level
set foldmethod=indent

" toggle gundo
nnoremap <C-u> :GundoToggle<CR>

" Insert date
nnoremap <C-t> "=strftime("%Y/%m/%d")<CR>p
nnoremap <C-T> "=strftime("%Y/%m/%d %H:%M:%S")<CR>p
nnoremap <F12> :exe ':silent !chromium-browser %'<CR

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
au BufNewFile,BufRead,BufEnter *.groovy,Jenkinsfile setf groovy

" Evaluate Clojure buffers on load
au BufNewFile,BufRead,BufEnter *.clj(s?) try | silent! Require | catch /^Fireplace/ | endtry

" Typescript
au BufRead,BufNewFile,BufEnter *.ts,*.tsx setf typescript

" Nginx files
au BufRead,BufNewFile,BufEnter /etc/nginx/*,/usr/local/nginx/conf/*,*.conf setf nginx

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

