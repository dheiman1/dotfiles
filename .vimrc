"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible                            " Don't try to be vi compatible
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
set scrolloff=1                             " Sets minimum number of screen lines to keep above/below cursor
set updatetime=200                          " Reduce delays (default 4000ms)
set shortmess+=c                            " Don't pass messages to ins-completion-menu

" Turn on the wild menu
set wildmenu
set wildignorecase
set wildignore+=**/node_modules/**

" Configure backspace to work as expected
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Disable error sounds
set noerrorbells
set novisualbell

" Checks if using truecolor terminal
if (has("termguicolors"))
  set termguicolors
endif

" Set number of colors
if !has('gui_running')
  set t_Co=256
  set t_ut=
endif

" 1 tab = 4 spaces
set shiftwidth=4
set tabstop=4

" Set ruler at 120 characters
set colorcolumn=120

" Set line break at 500 characters
set linebreak
set textwidth=500

" Create undo directory
set undodir=~/.vim/undodir
set undofile

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set showtabline=2
catch
endtry

" Set to auto read when a file is changed from the outside
set autoread
autocmd FocusGained,BufEnter * checktime

" Disable automatic comment insertion for all filetypes
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Remove trailing whitespace on save
" https://makandracards.com/makandra/11541-how-to-not-leave-trailing-whitespace-using-your-editor-or-git
autocmd BufWritePre * :%s/\s\+$//e

" Return to the last edit position when opening files
autocmd BufReadPost * if line("'\'") > 1 && line("'\'") <= line("$") | exe "normal! g'\"" | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Installation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')                    " Specify a directory for plugins

Plug 'neoclide/coc.nvim', {'branch': 'release'}      " Intellisense engine
Plug 'scrooloose/nerdtree'                           " NERDTree file tree
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }  " Fuzzy File Finder
Plug 'junegunn/fzf.vim'                              " Integrate fuzzy file finder with Vim
Plug 'tpope/vim-fugitive'                            " Git wrapper
Plug 'airblade/vim-gitgutter'                        " Display git diff in sign column
Plug 'sheerun/vim-polyglot'                          " Syntax highlighting for various languages
Plug 'vim-airline/vim-airline'                       " Vim statusline
Plug 'vim-airline/vim-airline-themes'                " Statusline themes
Plug 'ap/vim-css-color'                              " Color name highlighter
Plug 'sainnhe/gruvbox-material'                      " Gruvbox-material theme
Plug 'bagrat/vim-buffet'                             " Buffer navigation
Plug 'edkolev/tmuxline.vim'                          " Tmux statusline generator
Plug 'mattn/emmet-vim'                               " Emmet
Plug 'christoomey/vim-tmux-navigator'                " Vim/Tmux Navigation
Plug 'justinmk/vim-sneak'                            " Minimal motion plugin
Plug 'wincent/terminus'                              " Improve terminal integration with tmux in iTerm/Konsole
Plug 'tpope/vim-commentary'                          " Comment Line
Plug 'jiangmiao/auto-pairs'                          " Insert or delete brackets, parens, quotes, etc in pairs
Plug 'Yggdroot/indentline'                           " Display vertical line at each indentation level
Plug 'ryanoasis/vim-devicons'                        " File icons for NERDTree

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set colorscheme and background
let g:gruvbox_material_background = 'hard'
colorscheme gruvbox-material
set background=dark

" Set Airline theme
let g:airline_theme='gruvbox_material'

" Enable powerline font glyphs
let g:airline_powerline_fonts = 1

" Display all buffers when there's only one tab open
let g:airline#extensions#tabline#enabled = 1

" Close vim if NERDTree is the last open window
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists ('b:NERDTree') && b:NERDTree.isTabTree() |
  \ quit | endif

" Enable label-mode for vim-sneak
let g:sneak#label = 1

" Customize vim-buffet tabline
let g:buffet_powerline_separators = 1
let g:buffet_tab_icon = "\uf00a"
let g:buffet_left_trunc_icon = "\uf0a8"
let g:buffet_right_trunc_icon = "\uf0a9"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set leader key
let mapleader=" "
let g:mapleader=" "

" Change Emmet trigger key
let g:user_emmet_leader_key=','

" Smart way to move between windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Customize vim-tmux-navigator hotkeys
let g:tmux_navigator_no_mappings = 1

" Map Tmux Navigation hotkeys
nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-j> :TmuxNavigateDown<CR>
nnoremap <silent> <C-k> :TmuxNavigateUp<CR>
nnoremap <silent> <C-l> :TmuxNavigateRight<CR>

" Bind to toggle NERDTree
nnoremap <C-\> :NERDTreeToggle<CR>

" Switch buffers with vim-buffet
nmap <leader>1 <Plug>BuffetSwitch(1)
nmap <leader>2 <Plug>BuffetSwitch(2)
nmap <leader>3 <Plug>BuffetSwitch(3)
nmap <leader>4 <Plug>BuffetSwitch(4)
nmap <leader>5 <Plug>BuffetSwitch(5)
nmap <leader>6 <Plug>BuffetSwitch(6)
nmap <leader>7 <Plug>BuffetSwitch(7)
nmap <leader>8 <Plug>BuffetSwitch(8)
nmap <leader>9 <Plug>BuffetSwitch(9)
nmap <leader>0 <Plug>BuffetSwitch(10)

" Extra buffer navigation mappings
noremap <Tab> :bn<CR>                               " Next buffer
noremap <S-Tab> :bp<CR>                             " Previous buffer
noremap <Leader><Tab> :Bw<CR>                       " Erase current buffer
noremap <Leader><S-Tab> :Bw!<CR>                    " Force erase of current buffer
" noremap <C-t> :tabnew split<CR>

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

" Use tab to trigger completion with characters ahead and navigate
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
