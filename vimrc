set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-dispatch'

Plugin 'wesQ3/vim-windowswap'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'

Plugin 'slim-template/vim-slim.git'
Plugin 'kchmck/vim-coffee-script'
Plugin 'digitaltoad/vim-jade'
Plugin 'pangloss/vim-javascript'
Plugin 'vim-scripts/LustyExplorer'

Plugin 'scrooloose/syntastic'

Plugin 'altercation/vim-colors-solarized'
Plugin 'fugalh/desert.vim'
Plugin 'croaker/mustang-vim'

Plugin 'christoomey/vim-tmux-navigator'

call vundle#end()
filetype plugin indent on

" Remap leader
let mapleader = ","

" Set hidden
set hid

" Set longer line history
set history=1000

" Wildmenu for more search results
set wildmenu

" Current position
set ruler

" Set line numbers
set number

" Show matching brackets when cursor is over
set showmatch

" Search
set hlsearch " highlight search results
set ignorecase " case insensitive
set smartcase " case sensitive if using mixed case
set incsearch " show search matches as inputted
" clears search with leader (,)/
nmap <silent> <leader>/ :nohlsearch<CR>

" No swap or backup
set noswapfile
set nobackup

" NERDTree toggle = ctrl-n
map <C-n> :NERDTreeToggle<CR>

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Vim split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Spaces / tabs settings
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2

" Colorscheme desert || solarized || mustang
syntax enable
let g:solarized_termcolors=256
colorscheme desert
set background=dark

if has('gui_running')
  set transparency=20
endif

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif
