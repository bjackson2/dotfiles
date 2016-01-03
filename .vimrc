" Basic Settings
set encoding=utf-8
set noswapfile
set ruler
set history=500
set laststatus=2
set autowrite

" Leader key
let mapleader = "\<Space>"

" Spacing
set shiftwidth=2
set backspace=2
set tabstop=2
set expandtab
set shiftround
filetype plugin indent on

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
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
set hlsearch
set incsearch

" Numbers
set number
set numberwidth=5

" Colors and highlighting
syntax on
colorscheme railscasts
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline
set cursorline

" Trailing whitespace
set list listchars=tab:»·,trail:·

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Run pathogen
execute pathogen#infect()

" Key mapping
map <F10> :NERDTreeToggle<CR>
map <F9> :NERDTreeFind<CR>

" Window switching
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" CtrlP key mapping
let g:ctrlp_map = '<c-p>'
let g:ctrlp_regexp = 1

let g:ctrlp_abbrev = {
\ 'gmode': 't',
\ 'abbrevs': [
\   {
\     'pattern': '\(^@.\+\|\\\@<!:.\+\)\@<! ',
\     'expanded': '_',
\     'mode': 'pfrz',
\   },
\ ]
\}