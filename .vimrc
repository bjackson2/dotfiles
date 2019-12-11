le *.md set filetype=markdown

" Plugins
set nocompatible
filetype off
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
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'prettier/vim-prettier'
Plugin 'pbrisbin/vim-colors-off'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'jgdavey/tslime.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()
filetype plugin indent on

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
call plug#end()

" Basic Settings
set encoding=utf-8
set noswapfile
set nobackup
set nowritebackup
set ruler
set history=500
set laststatus=2
set autowrite
set scrolloff=5
set timeoutlen=1000 ttimeoutlen=0

" Status line
let g:airline_theme='minimalist'

" Change cursor in insert mode
let &t_SI.="\e[6 q" "SI = INSERT mode
let &t_SR.="\e[6 q" "SR = REPLACE mode
let &t_EI.="\e[2 q" "EI = NORMAL mode (ELSE)

" Set .eslintrc to format as JSON
autocmd BufNewFile,BufRead .eslintrc   set syntax=json

" JSX formatting in .js files
let g:jsx_ext_required = 0

" Navigation
runtime macros/matchit.vim

" Font
set gfn=Monaco:h12

" Leader commands
let mapleader = "\<Space>"
let g:rspec_command = 'call Send_to_Tmux("spring rspec {spec}\n")'

map <leader>vr :sp $MYVIMRC<cr>
map <leader>so :source $MYVIMRC<cr>
map <leader>bd :bp\|bd #<cr>
map <leader>ba :bufdo bd<cr>
map <leader>/ /<C-R><C-W><cr>
map <leader>w <C-W><C-=>
nnoremap <silent> <Leader>= :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
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
set cursorcolumn

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
noremap <C-c> :w !pbcopy<CR><CR>
noremap <C-v> :r !pbpaste<CR><CR>

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
command! -bang -range=% -complete=file -nargs=* W <line1>,<line2>write<bang> <args>
command! -bang Q quit<bang>

" Grep word under cursor
nnoremap S :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

"" NERDTree

" Open current file
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

" Toggle open/close
map <C-n> :NERDTreeToggle<CR>

let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"" Prettier

" Auto-format on buffer save
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.es6,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

set mouse=a

"" Tmux integration
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1

"" CoC config

set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"" fzf
let $FZF_DEFAULT_COMMAND = 'ag -g "" --hidden'

nnoremap <C-p> :Files<cr>
map <Leader>f :Ag<CR>
map <Leader>q <C-a><C-q>

let g:fzf_files_options =
  \ '--reverse ' .
\ '--preview "(bat --theme="1337" --style=numbers --color always {}) 2> /dev/null | head -'.&lines.'"'
let g:fzf_layout = { 'down': '~60%' }

"" Adds preview to Ag
command! -bang -nargs=? -complete=dir Ag
\ call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" Ack
let g:ackprg = 'ag --nogroup --nocolor --column'

nnoremap K :Ack! '<C-r><C-w>'<cr>
nmap \ :Ack!<space>
