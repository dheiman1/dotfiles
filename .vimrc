"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible             " Don't try to be vi compatible
syntax on                    " Enable syntax highlighting
set history=500              " Sets how many lines of history vim has to remember
filetype plugin on           " Enable filetype plugins
filetype indent on           " Enable loading of indents based on filetype
set mouse=a                  " Enable mouse support
set number relativenumber    " Enable line numbers
set laststatus=2             " Always show the status line
set expandtab                " Use spaces instead of tab
set smarttab                 " Enable smart tabs
set autoindent               " Enable auto indent
set smartindent              " Enable smart indent
set nowrap                   " Disable word wrapping
set nobackup                 " Turn backup off
set noswapfile               " Don't create swap files
set ruler                    " Always show current position
set cmdheight=1              " Height of the command bar
set hidden                   " A buffer becomes hidden when it is abandoned
set ignorecase               " Ignore case when searching
set smartcase                " When searching try to be smart about cases
set incsearch                " Highlight search results
set lazyredraw               " Don't redraw while executing macros
set magic                    " Enable regex magic
set showmatch                " Show matching brackets when cursor is over them
set mat=2                    " Tenths of a second to blink when matching brackets
set encoding=utf-8           " Set utf8 as standard encoding and en_US as standard language
set clipboard=unnamed        " Use system clipboard as default register

" Disable automatic comment insertion for all filetypes
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Remove trailing whitespace on save
" https://makandracards.com/makandra/11541-how-to-not-leave-trailing-whitespace-using-your-editor-or-git
autocmd BufWritePre * :%s/\s\+$//e

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" 1 tab = 2 spaces
set shiftwidth=2
set tabstop=2

" Enable line break at 500 characters
set linebreak
set tw=500

" Set custom cursor in Konsole
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Create undo directory
set undodir=~/.vim/undodir
set undofile

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to the last edit position when opening files
au BufReadPost * if line("'\'") > 1 && line("'\'") <= line("$") | exe "normal! g'\"" | endif

" Turn on the wild menu
set wildmenu
set wildignorecase

" Configure backspace to work as expected
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Disable error sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Installation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" NERDTree file tree
Plug 'scrooloose/nerdtree'

" Integrate fuzzy file finding with vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Syntax highlighting for various languages
Plug 'sheerun/vim-polyglot'

" One Dark Colorscheme
Plug 'joshdick/onedark.vim'

" Emmet
Plug 'mattn/emmet-vim'

" Configurable statusline
Plug 'itchyny/lightline.vim'

" Minimal motion plug
Plug 'justinmk/vim-sneak'

" Comment Line
Plug 'tpope/vim-commentary'

" Insert or delete brackets, parens, quotes, etc in pairs
Plug 'jiangmiao/auto-pairs'

" Display vertical line at each indentation level
Plug 'Yggdroot/indentline'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set colorscheme and background
colorscheme onedark
set background=dark

" Configure Lightline to use One Dark theme
let g:lightline = {
  \ 'colorscheme': 'onedark'
  \ }

" Close vim if NERDTree is the last open window
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists ('b:NERDTree') && b:NERDTree.isTabTree() |
  \ quit | endif

" Enable label-mode for vim-sneak
let g:sneak#label=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set leader key
let mapleader=" "
let g:mapleader=" "

" Smart way to move between windows
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" Remap vim-commentary
" nmap <C-/> gcc
" imap <C-/> gcc
" vmap <C-/> gcc

" Bind to toggle NERDTree
nnoremap <C-\> :NERDTreeToggle<CR>
inoremap <C-\> :NERDTreeToggle<CR>
vnoremap <C-\> :NERDTreeToggle<CR>

" Bind to file search
nnoremap <C-p> :GFiles<CR>

" Extra indent mappings
vmap <Tab> >gv
vmap <S-Tab> <gv
