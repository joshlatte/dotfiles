" check syntax
" help syntime
set nocompatible
filetype off
set ttyfast
set lazyredraw
set updatetime=750

set rtp+=/opt/homebrew/opt/fzf

" Install Plug if not present
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()

Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-rails'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'benmills/vimux'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'

" Nav and Control
Plug 'wesQ3/vim-windowswap'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
"Plug 'sjbach/lusty'
Plug 'christoomey/vim-tmux-navigator'

" Syntax and style
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ntpeters/vim-better-whitespace'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'ekalinin/Dockerfile.vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'

" Color schemes
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'fugalh/desert.vim'
Plug 'croaker/mustang-vim'
Plug 'NLKNguyen/papercolor-theme'

call plug#end()
filetype plugin indent on

set re=1

" Colorscheme gruvbox || desert || solarized || mustang
if !exists("g:syntax_on")
  syntax enable
endif

set background=dark

" enable 256 colors
"set t_Co=256

"set termguicolors
"let g:solarized_termcolors=256
"let g:gruvbox_termcolors=256
let g:gruvbox_contrast_light='soft'
let g:gruvbox_contrast_dark='hard'

colorscheme gruvbox
"colorscheme PaperColor

highlight Normal ctermbg=NONE guibg=Black
highlight NonText ctermbg=NONE

" Airline
"let g:airline_theme='papercolor'
let g:airline_theme='gruvbox'

" Fix backspace for insert mode
set backspace=indent,eol,start

" Remap leader
let mapleader = ","

" Automatically reload file if timestamps change
set autoread

" Redraw screen
nnoremap <leader>rd :redraw!<cr>

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

" Statusline config
"set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P

" Fugitive git bindings
nnoremap <leader>ga :Git add -p<cr><cr>
nnoremap <leader>gs :Git<cr>
nnoremap <leader>gc :Gcommit -v -q %:p<cr>
nnoremap <leader>gd :Git diff<cr>
nnoremap <leader>ge :Gedit<cr>
nnoremap <leader>gr :Gread<cr>
nnoremap <leader>gw :Gwrite<cr><cr>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>

" Tabs
set showtabline=1
nnoremap <leader>T :tabnew<cr>
nnoremap <leader>tq :tabclose<cr>
nnoremap <leader>tt :tabs<cr>

" Close window
nnoremap <leader>wq :q<cr>

" Hilight line
"set cursorline

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
let NERDTreeShowHidden=1
let g:NERDTreeMapOpenSplit='s'
let g:NERDTreeMapOpenVSplit='v'
map <silent> <C-n> :NERDTreeToggle<CR>

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Automatically resize splits if window size changes
autocmd VimResized * wincmd =

" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

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
  set transparency=20
endif

" System Clipboard
set clipboard=unnamed

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

" ============== Plug Settings ==============
" Silver Searcher (ag)
let g:ackprg = 'ag --nogroup --nocolor --column'
" Ack with open input
nnoremap <leader>a :Ack!<Space>
" Ack with selected word
nnoremap <leader>A :Ack!<cr>
"nnoremap <leader>A :Ag!<cr>

" fzf.vim
nnoremap <leader>f :Files<cr>
nnoremap <leader>F :Files<cr>

" Vimux
" Open with prompt command
nnoremap <leader>vp :VimuxPromptCommand<cr>

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1

" Rspec with Dispatch
let g:rspec_command = "Dispatch bundle exec rspec {spec}"
" let g:rspec_command = "Dispatch docker-compose run web rspec {spec}"

" RSpec.vim mappings
let line=getline('.')
"nnoremap <leader>rf :ter rails test %<cr>

nnoremap <leader>rf :call RunCurrentSpecFile()<cr>
nnoremap <leader>rl :call RunNearestSpec()<cr>
nnoremap <leader>rp :call RunLastSpec()<cr>
nnoremap <leader>rs :call RunAllSpecs()<cr>
nmap ; :Buffers<CR>
nmap <leader>t :Files<CR>
nmap <leader>r :Tags<CR>

" Indent Guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1

" Ctrl-p custom ignore
set wildignore+=*/tmp/*,*/node_modules/*,*/bin/*,*/images/*,*/vendor/*,*.so,*.swp,*.zip,*/jenkins_home/*     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" JSX syntax highlighting for .js files
let g:jsx_ext_required = 0

" Reset spaces & expand tabs
nnoremap <leader>ts :set tabstop=2 shiftwidth=2 expandtab<cr>
nnoremap <leader>rt :retab<cr>

" Emmet keymappings
let g:user_emmet_leader_key=','

" Move the preview window (code documentation) to the bottom of the screen, so it doesn't move the code!
set splitbelow