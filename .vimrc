"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible                            " Don't try to be vi compatible
syntax on                                   " Enable syntax highlighting
set history=500                             " Sets how many lines of history vim has to remember
filetype plugin on                          " Enable filetype plugins
filetype indent on                          " Enable loading of indents based on filetype
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
set ruler                                   " Always show current position
set cmdheight=1                             " Height of the command bar
set hidden                                  " A buffer becomes hidden when it is abandoned
set ignorecase                              " Ignore case when searching
set smartcase                               " When searching try to be smart about cases
set incsearch                               " Highlight search results
set lazyredraw                              " Don't redraw while executing macros
set magic                                   " Enable regex magic
set showmatch                               " Show matching brackets when cursor is over them
set mat=2                                   " Tenths of a second to blink when matching brackets
set encoding=utf-8                          " Set utf8 as standard encoding and en_US as standard language
set clipboard=unnamed                       " Use system clipboard as default register
set noshowmode                              " Hide mode message on bottom of screen
set ttimeoutlen=0                           " Reduce time to exit insert mode
set signcolumn=yes                          " Merge signcolumn and number column into one

" Disable automatic comment insertion for all filetypes
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Remove trailing whitespace on save
" https://makandracards.com/makandra/11541-how-to-not-leave-trailing-whitespace-using-your-editor-or-git
autocmd BufWritePre * :%s/\s\+$//e

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" 1 tab = 4 spaces
set shiftwidth=4
set tabstop=4

" Set ruler at 120 characters
set colorcolumn=120

" Set line break at 500 characters
set linebreak
set tw=500

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

call plug#begin('~/.vim/plugged')                   " Specify a directory for plugins

Plug 'neoclide/coc.nvim', {'branch': 'release'}     " Vim Intellisense engine
Plug 'scrooloose/nerdtree'                          " NERDTree file tree
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Integrate fuzzy file finding with vim
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'                           " Git wrapper
Plug 'airblade/vim-gitgutter'                       " Display git diff in sign column
Plug 'sheerun/vim-polyglot'                         " Syntax highlighting for various languages
Plug 'itchyny/lightline.vim'                        " Configurable statusline
Plug 'joshdick/onedark.vim'                         " One Dark Colorscheme
Plug 'mattn/emmet-vim'                              " Emmet
Plug 'christoomey/vim-tmux-navigator'               " Vim/Tmux Navigation
Plug 'justinmk/vim-sneak'                           " Minimal motion plug
Plug 'wincent/terminus'                             " Improve terminal integration with tmux in iTerm and Konsole
Plug 'tpope/vim-commentary'                         " Comment Line
Plug 'jiangmiao/auto-pairs'                         " Insert or delete brackets, parens, quotes, etc in pairs
Plug 'Yggdroot/indentline'                          " Display vertical line at each indentation level
Plug 'ryanoasis/vim-devicons'                       " File icons for NERDTree

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set colorscheme and background
colorscheme onedark
set background=dark

" Configure Lightline to use One Dark theme and integrate with CoC
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

" Close vim if NERDTree is the last open window
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists ('b:NERDTree') && b:NERDTree.isTabTree() |
  \ quit | endif

" Enable label-mode for vim-sneak
let g:sneak#label = 1

" Customize vim-tmux-navigator hotkeys
let g:tmux_navigator_no_mappings = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set leader key
let mapleader=" "
let g:mapleader=" "

" Smart way to move between windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Map Tmux Navigation hotkeys
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

" Bind to toggle NERDTree
nnoremap <C-\> :NERDTreeToggle<CR>
inoremap <C-\> :NERDTreeToggle<CR>
vnoremap <C-\> :NERDTreeToggle<CR>

" Bind to file search
nnoremap <C-p> :GFiles<CR>

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
   if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Extra indent mappings
vmap <Tab> >gv
vmap <S-Tab> <gv
