" Plugins
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'tpope/vim-surround'
Plugin 'thoughtbot/vim-rspec'

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

" Navigation
runtime macros/matchit.vim

" Font
set gfn=Monaco:h12

" Leader commands
let mapleader = "\<Space>"
let g:rspec_command = "bin/rspec {spec}"

map <leader>vr :sp $MYVIMRC<cr>
map <leader>so :source $MYVIMRC<cr>
map <leader>bd :bp\|bd #<cr>
map <leader>/ /<C-R><C-W><cr>
map <leader>i mmgg=G`m
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Spacing
set shiftwidth=2
set backspace=indent,eol,start
set tabstop=2
set expandtab
set shiftround
set list listchars=tab:»·,trail:·

" Tab completion
set wildmode=list:longest,list:full
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Search
set nohlsearch
set incsearch
set smartcase
set ignorecase

" Don't use caching with CtrlP
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0

" Numbers
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
set winwidth=84
set winheight=5
set winminheight=5
set winheight=999

execute pathogen#infect()

" Mappings
map <F10> :NERDTreeToggle<CR>
map <F9> :NERDTreeFind<CR>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
let g:ctrlp_map = '<c-p>'
