
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible                            " Don't try to be Vi compatible
syntax on                                   " Enable syntax highlighting
set history=500                             " Sets how many lines of history vim has to remember
filetype plugin on                          " Enable plugins
filetype indent on                          " Enable file-type specific indentation
set mouse=a                                 " Enable mouse support
set number relativenumber                   " Enable line numbers
set laststatus=2                            " Always show the status line
set expandtab                               " Use spaces instead of tab
set smarttab                                " Enable smart tabs
set autoindent                              " Enable auto indent
set smartindent                             " Enable smart indent
set nowrap                                  " Disable word wrapping
set nobackup                                " Turn backup off
set noswapfile                              " Don't create swap files
set cmdheight=1                             " Height of the command bar
set hidden                                  " Enables hidden buffers
set ignorecase                              " Ignore case when searching
set smartcase                               " When searching try to be smart about cases
set incsearch                               " While searching show where the pattern matches so far
set nohlsearch                              " Don't highlight search results
set lazyredraw                              " Don't redraw while executing macros
set magic                                   " Enable regex magic
set showmatch                               " Show matching brackets when cursor is over them
set mat=2                                   " Tenths of a second to blink when matching brackets
set encoding=utf-8                          " Set utf8 as standard encoding and en_US as standard language
set clipboard=unnamed                       " Use system clipboard as default register
set noshowmode                              " Hide mode message on bottom of screen
set ttimeoutlen=0                           " Reduce time to exit insert mode
set scrolloff=1                             " Sets minimum number of screen lines to keep above/below cursor
set updatetime=100                          " Reduce delays (default 4000ms)
set shortmess+=c                            " Avoid ins-completion-menu messages with <C-c>
set wildmenu                                " Turn on the wild menu
set wildignorecase                          " Don't make wild menu search case-sensitive
set wildignore+=**/node_modules/**          " Never search in node_modules directory
set signcolumn=yes                          " Always show signcolumn
set colorcolumn=120                         " Set ruler at 120 characters

" 1 tab = 4 spaces
set shiftwidth=4
set tabstop=4

" Set line break at 500 characters
set nolinebreak
set textwidth=500

" Configure backspace to work as expected
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Disable error sounds
set noerrorbells visualbell t_vb=

" Disable error sounds in gVim
autocmd GUIEnter * set noerrorbells visualbell t_vb=

" gVim Settings
if has('gui_running')
  set guifont=JetBrainsMono_NF:h12          " Set font in gVim
  autocmd GUIEnter * simalt ~x              " Start maximized
endif

" Remove gVim widgets
set guioptions-=T                           " Remove toolbar
set guioptions-=r                           " Remove right scroll bar
set guioptions-=L                           " Remove left scroll bar
set guioptions-=e                           " Share tab style with terminal Vim

" Checks if using truecolor terminal
if (has("termguicolors"))
  set termguicolors
endif

" Change cursor based on mode
let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"

" Create undo directory
set undodir=~/.vim/undodir
set undofile

" Set to auto read when a file is changed from the outside
set autoread
autocmd FocusGained,BufEnter * checktime

" Disable automatic comment insertion for all filetypes
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Return to the last edit position when opening files
autocmd BufReadPost * if line("'\'") > 1 && line("'\'") <= line("$") | exe "normal! g'\"" | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Installation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')                    " Specify a directory for plugins

Plug 'scrooloose/nerdtree'                           " NERDTree file tree
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }  " Fuzzy File Finder
Plug 'junegunn/fzf.vim'                              " Integrate fuzzy file finder with Vim
Plug 'junegunn/vim-easy-align'                       " Text alignment plugin
Plug 'tpope/vim-fugitive'                            " Git wrapper
Plug 'airblade/vim-gitgutter'                        " Display git diff in sign column
Plug 'sheerun/vim-polyglot'                          " Syntax highlighting for various languages
Plug 'vim-airline/vim-airline'                       " Vim statusline
Plug 'vim-airline/vim-airline-themes'                " Statusline themes
Plug 'AndrewRadev/tagalong.vim'                      " Auto rename HTML/XML tags
Plug 'rakr/vim-one'                                  " One dark colorscheme
Plug 'kaicataldo/material.vim'                       " Material colorscheme
Plug 'tomasiser/vim-code-dark'                       " Dark+ colorscheme
Plug 'christoomey/vim-tmux-navigator'                " Vim/Tmux Navigation
Plug 'tpope/vim-commentary'                          " Comment Line
Plug 'tpope/vim-surround'                            " Easily add, delete, or change (), [], '', and more
Plug 'jiangmiao/auto-pairs'                          " Automatically insert or delete (), '', [], {} in pairs
Plug 'Yggdroot/indentline'                           " Display vertical line at each indentation level
Plug 'ryanoasis/vim-devicons'                        " File icons for NERDTree

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set colorscheme and background
colorscheme one
set background=dark

" Set Airline theme
let g:airline_theme='one'
let g:airline_powerline_fonts = 1

" Enable Airline's buffer/tab line
let g:airline#extensions#tabline#enabled = 1

" Prevent indentline from concealing symbols in json and markdown
let g:indentLine_fileTypeExclude = ['json', 'markdown']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set leader key
let mapleader=" "

" Don't use Ex mode, use Q for formatting
nnoremap Q gq

" Map Y to y$
map Y y$

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Resize current Vim split
nnoremap <C-left> :vertical resize -5<CR>
nnoremap <C-down> :resize -5<CR>
nnoremap <C-up> :resize +5<CR>
nnoremap <C-right> :vertical resize +5<CR>

" Map Tmux Navigation hotkeys
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-j> :TmuxNavigateDown<CR>
nnoremap <silent> <C-k> :TmuxNavigateUp<CR>
nnoremap <silent> <C-l> :TmuxNavigateRight<CR>

" Bind to toggle NERDTree
nnoremap <Esc>1 :NERDTreeToggle<CR>

" Bind to open second terminal
nnoremap <C-;> :terminal<CR>

" Extra buffer navigation mappings
noremap <Esc>l :bn<CR>                               " Next buffer
noremap <Esc>h :bp<CR>                               " Previous buffer

" Bind to file search
nnoremap <C-p> :GFiles<CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
