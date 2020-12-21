"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Tree explorer plugin
Plug 'scrooloose/nerdtree'

" Integrate fuzzy file finding with Vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Syntax hightighting for various languages
Plug 'sheerun/vim-polyglot'

" One Dark colorscheme
Plug 'joshdick/onedark.vim'

" Emmet
Plug 'mattn/emmet-vim'

" Lightline
Plug 'itchyny/lightline.vim'

" Comment line
Plug 'tpope/vim-commentary'

" Insert or delete brackets, parens, quotes, etc in pairs
Plug 'jiangmiao/auto-pairs'

" Whitespace highlighting/deletion
Plug 'ntpeters/vim-better-whitespace'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Don't try to be vi compatible
set nocompatible

" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" Set leader key
let mapleader=","

" Enable mouse support
set mouse=a

" Enable line numbers
set number relativenumber

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn on the Wild menu
set wildmenu
set wildignorecase

" Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set incsearch

" Don't redraw while executing macros (good perfomance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax on

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" Set colorscheme and background
colorscheme onedark
set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Always show the status line
set laststatus=2

" Configure Lightline to use One Dark theme
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups, and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn backup off
set nobackup
set nowb
set noswapfile

" Create undo directory
set undodir=~/.vim/undodir
set undofile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab, and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use spaces instead of tabs
set expandtab

" Enable smart tabs
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

" Auto indent, Smart indent, wrap lines
set ai
set si
set wrap

" Remap vim-commentary to <C-/>
nmap <C-/> gcc
vmap <C-/> gcc

" Close vim if NERDTree is the last open window
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists ('b:NERDTree') && b:NERDTree.isTabTree() |
  \ quit | endif

" Enable trim whitespace on save
let g:strip_whitespace_on_save = 1
let g:strip_whitespace_confirm=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows, and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Bind <C-\> to toggle NERDTree
nnoremap <C-\> :NERDTreeToggle<CR>

" Bind <C-p> for file search
nnoremap <C-p> :GFiles<CR>

