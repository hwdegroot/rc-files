set nocompatible              " be iMproved, required
set hidden
filetype off                  " required
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs

" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')
" Python autocompletion
Plug 'davidhalter/jedi-vim'
" Vim airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Vim rails
Plug 'tpope/vim-rails'
" Git plugin
Plug 'tpope/vim-fugitive'
" Powershell highlight
Plug 'PProvost/vim-ps1'
" Ansible plugin
Plug 'chase/vim-ansible-yaml'
" docker
Plug 'docker/docker', {'rtp': '/contrib/syntax/vim/'}
" sbt & scala syntax
Plug 'derekwyatt/vim-sbt'
Plug 'derekwyatt/vim-scala'
" html
Plug 'docunext/closetag.vim'
" Fancy file browser
Plug 'vim-scripts/LustyJuggler'
Plug 'vim-scripts/LustyExplorer'
" PHP stuf
Plug 'Shougo/vimproc.vim'
Plug 'Shougo/unite.vim'
Plug 'shawncplus/phpcomplete.vim'
"Plug 'm2mdas/phpcomplete-extended'
"Plug 'm2mdas/phpcomplete-extended-laravel'
Plug 'joonty/vdebug'
Plug 'StanAngeloff/php.vim'
" Theming
Plug 'morhetz/gruvbox'
" Completion
Plug 'ervandew/supertab'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'scrooloose/nerdtree'
Plug 'pangloss/vim-javascript'
"BAMBAMBAM SQL support
Plug 'tpope/vim-dadbod'
call plug#end()            " required

filetype plugin indent on    " required

" Change end-of-line, space and tab characters.
set list
set listchars=eol:↲,trail:·,tab:»·,extends:»,precedes:«
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
"colorscheme molokai
set background=dark
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_bold = 1
let g:gruvbox_italic = 1
let g:gruvbox_underline = 1
let g:gruvbox_undercurl = 1

" redraw only when we need to.
" set lazyredraw
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
"let hlstate=0
"nnoremap <F3> :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1<cr>
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
"nnoremap <F12> :exe ':silent !chromium-browser %'<CR

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


set laststatus=2


" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='powerlineish'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"


" Put at the very end of your .vimrc file.
"let $PATH=$PATH . ':' . expand('./vendor/bin') . ':' . expand('~/.composer/vendor/bin')
"autocmd  FileType php setlocal omnifunc=phpcomplete_extended#CompletePHP
"let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
"let g:phpcomplete_index_composer_command = "composer"
"function! PhpSyntaxOverride()
"  hi! def link phpDocTags  phpDefine
"  hi! def link phpDocParam phpType
"endfunction
"
"augroup phpSyntaxOverride
"  autocmd!
"  autocmd FileType php call PhpSyntaxOverride()
"augroup END

" Completion
let g:neocomplete#enable_at_startup = 0

" File browser
let g:netrw_liststyle = 3

" NERDTree
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd VimEnter * if &filetype !=# 'gitcommit' | NERDTree | endif
let NERDTreeShowHidden=1
set modifiable

" Allows Vdebug to bind to all interfaces.
"let g:vdebug_options = {}
"
"" Stops execution at the first line.
"let g:vdebug_options['break_on_open'] = 1
"let g:vdebug_options['max_children'] = 128
"
"" Use the compact window layout.
"let g:vdebug_options['watch_window_style'] = 'compact'
