le *.md set filetype=markdown

" Plugins
set nocompatible
filetype off
set runtimepath^=~/.vim/bundle/ctrlp.vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'ervandew/supertab'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-fugitive'
Plugin 'thoughtbot/vim-rspec'
Plugin 'jpo/vim-railscasts-theme'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'scrooloose/nerdtree'
Plugin 'prettier/vim-prettier'

call vundle#end()
filetype plugin indent on

" Basic Settings
set encoding=utf-8
set noswapfile
set ruler
set history=500
set laststatus=2
set autowrite
set scrolloff=5

" Set .eslintrc to format as JSON
autocmd BufNewFile,BufRead .eslintrc   set syntax=json

" Set start-up directory
cd /Users/bjackson/Documents/ezcater/store

" JSX formatting in .js files
let g:jsx_ext_required = 0

" Navigation
runtime macros/matchit.vim

" Font
set gfn=Monaco:h12

" Leader commands
let mapleader = "\<Space>"
let g:rspec_command = "spring rspec {spec}"

map <leader>vr :sp $MYVIMRC<cr>
map <leader>so :source $MYVIMRC<cr>
map <leader>bd :bp\|bd #<cr>
map <leader>ba :bufdo bd<cr>
map <leader>/ /<C-R><C-W><cr>
map <leader>w <C-W><C-=>
map <leader>i mmgg=G`m
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
map <Leader>gh :!open /Applications/GitHub\ Desktop.app<CR><CR>
map <Leader>gd :Gdiff<CR>
nmap <silent> <leader>c :set spell!<CR>
nmap <silent> <leader>x :set nospell<CR>

" Spacing
set shiftwidth=2
set backspace=indent,eol,start
set tabstop=2
set expandtab
set shiftround
set list listchars=tab:»·,trail:·

" Search
set nohlsearch
set incsearch
set smartcase
set ignorecase

" Use silver searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

" Numbers
set relativenumber
set number
set numberwidth=5

" Colors and highlighting
syntax on
colorscheme railscasts
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline
set cursorline

" Splits
set splitbelow
set splitright

" Mappings
nnoremap j gj
nnoremap k gk
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap H :bp <CR>
nnoremap K :bn <CR>
let g:ctrlp_map = '<c-p>'
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
command! -bang -range=% -complete=file -nargs=* W <line1>,<line2>write<bang> <args>
command! -bang Q quit<bang>

" Grep shortcut
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>\"\"<Left><Left>

" Grep word under cursor
nnoremap S :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

