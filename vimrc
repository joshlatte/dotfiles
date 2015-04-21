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

Plugin 'ntpeters/vim-better-whitespace'
Plugin 'slim-template/vim-slim.git'
Plugin 'kchmck/vim-coffee-script'
Plugin 'digitaltoad/vim-jade'
Plugin 'pangloss/vim-javascript'
Plugin 'groenewege/vim-less'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'vim-scripts/LustyExplorer'

Plugin 'scrooloose/syntastic'

Plugin 'altercation/vim-colors-solarized'
Plugin 'fugalh/desert.vim'
Plugin 'croaker/mustang-vim'

Plugin 'OmniSharp/omnisharp-vim'
" Plugin 'Valloric/YouCompleteMe'

Plugin 'christoomey/vim-tmux-navigator'

call vundle#end()
filetype plugin indent on

" Remap leader
let mapleader = ","

" Set hidden
set hid

" Set longer line history
set history=1000

" Disable newline at EOF
set binary
set noeol

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
let g:NERDTreeMapOpenSplit='s'
let g:NERDTreeMapOpenVSplit='v'


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

" Omnisharp
" (Experimental - uses vim-dispatch or vimproc plugin) - Start the omnisharp server for the current solution
let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']

" Whitelist only .cs files for YouCompleteMe
let g:ycm_filetype_whitelist = { 'cs': 1 }

" Move the preview window (code documentation) to the bottom of the screen, so it doesn't move the code!
set splitbelow

nnoremap <leader>w :StripWhitespace<cr>
nnoremap <leader>ts :set tabstop=2 shiftwidth=2 expandtab<cr>
nnoremap <leader>rt :retab<cr>

nnoremap <leader>ss :OmniSharpStartServer<cr>
nnoremap <leader>sp :OmniSharpStopServer<cr>

" Force OmniSharp to reload the solution. Useful when switching branches etc.
nnoremap <leader>rl :OmniSharpReloadSolution<cr>
nnoremap <leader>cf :OmniSharpCodeFormat<cr>

" Add syntax highlighting for types and interfaces
nnoremap <leader>th :OmniSharpHighlightTypes<cr>

augroup omnisharp_commands
  autocmd!

  " Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
  " autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

  " Asyncronous build with vim-dispatch
  autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
augroup END