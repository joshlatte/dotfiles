set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-dispatch'

" Nav and Control
Plugin 'wesQ3/vim-windowswap'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/LustyExplorer'
Plugin 'christoomey/vim-tmux-navigator'

" Syntax and style
Plugin 'scrooloose/syntastic'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'slim-template/vim-slim.git'
Plugin 'kchmck/vim-coffee-script'
Plugin 'digitaltoad/vim-jade'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'groenewege/vim-less'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'othree/javascript-libraries-syntax.vim'

" Color schemes
Plugin 'morhetz/gruvbox'
Plugin 'altercation/vim-colors-solarized'
Plugin 'fugalh/desert.vim'
Plugin 'croaker/mustang-vim'

call vundle#end()
filetype plugin indent on

" enable 256 colors
set t_Co=256

" Colorscheme gruvbox || desert || solarized || mustang

" Enable True Color Terminal
"set t_8f=[38;2;%lu;%lu;%lum
"set t_8b=[48;2;%lu;%lu;%lum
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
colorscheme gruvbox
set background=dark
syntax enable
highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
" set termguicolors
let g:solarized_termcolors=256
let g:gruvbox_termcolors=256
let g:gruvbox_contrast_light='medium'
let g:gruvbox_contrast_dark='hard'
" hi Normal ctermbg=none

" Remap leader
let mapleader = ","

" Automatically reload file if timestamps change
set autoread

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

" Tabs
set showtabline=1
nnoremap <leader>T :tabnew<cr>
nnoremap <leader>tq :tabclose<cr>
nnoremap <leader>tt :tabs<cr>

" Close window
nnoremap <leader>wq :q<cr>

" Hilight line
" set cursorline

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

" Automatically resize splits if window size changes
autocmd VimResized * wincmd =

" Vim split navigation
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>

" Spaces / tabs settings
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

if has("mac") && has('gui_running')
  set transparency=10
endif

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <S-j> mz:m+<cr>`z
nmap <S-k> mz:m-2<cr>`z
vmap <S-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <S-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac")|| has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Remap join line with leader
vmap <leader>j :j<cr>

" Clean whitespace
nnoremap <leader>w :StripWhitespace<cr>

" Indent Guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1

" Ctrl-p custom ignore
set wildignore+=*/tmp/*,*/node_modules/*,*/lib/*,*/bin/*,*/vendor/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" JSX syntax highlighting for .js files
let g:jsx_ext_required = 0

" Syntastic ESLint setting
let g:syntastic_javascript_checkers = ['eslint']

" JS libraries to syntax highlight
let g:used_javascript_libs = 'underscore,react,flux,jquery'

" Reset spaces & expand tabs
nnoremap <leader>ts :set tabstop=2 shiftwidth=2 expandtab<cr>
nnoremap <leader>rt :retab<cr>

" Move the preview window (code documentation) to the bottom of the screen, so it doesn't move the code!
set splitbelow

nnoremap <leader>w :StripWhitespace<cr>
nnoremap <leader>ts :set tabstop=2 shiftwidth=2 expandtab<cr>
nnoremap <leader>rt :retab<cr>