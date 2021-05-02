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
" set colorcolumn=120                         " Set ruler at 120 characters

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

Plug 'neoclide/coc.nvim', {'branch': 'release'}      " Intellisense engine
Plug 'scrooloose/nerdtree'                           " NERDTree file tree
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }  " Fuzzy File Finder
Plug 'junegunn/fzf.vim'                              " Integrate fuzzy file finder with Vim
Plug 'junegunn/vim-easy-align'                       " Text alignment plugin
Plug 'tpope/vim-fugitive'                            " Git wrapper
Plug 'airblade/vim-gitgutter'                        " Display git diff in sign column
Plug 'sheerun/vim-polyglot'                          " Syntax highlighting for various languages
Plug 'vim-airline/vim-airline'                       " Vim statusline
Plug 'vim-airline/vim-airline-themes'                " Statusline themes
Plug 'edkolev/tmuxline.vim'                          " Tmux statusline generator
Plug 'AndrewRadev/tagalong.vim'                      " Auto rename HTML/XML tags
Plug 'rakr/vim-one'                                  " One dark colorscheme
Plug 'kaicataldo/material.vim'                       " Material colorscheme
Plug 'mattn/emmet-vim'                               " Emmet
Plug 'christoomey/vim-tmux-navigator'                " Vim/Tmux Navigation
Plug 'justinmk/vim-sneak'                            " Minimal motion plugin
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
let g:material_terminal_italics = 1
let g:material_theme_style = 'darker'
colorscheme material
set background=dark

" Set Airline theme
let g:airline_theme='one'
let g:airline_powerline_fonts = 1

" Enable Airline's buffer/tab line
let g:airline#extensions#tabline#enabled = 1

" Enable label-mode for vim-sneak
let g:sneak#label = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set leader key
let mapleader=" "
let g:mapleader=" "

" Don't use Ex mode, use Q for formatting
nnoremap Q gq

" Map Y to y$
map Y y$

" Change Emmet trigger key
let g:user_emmet_leader_key='<leader>,'

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
nnoremap <C-\> :NERDTreeToggle<CR>
nnoremap <leader>ft :NERDTreeToggle<CR>

" Extra buffer navigation mappings
noremap <Tab> :bn<CR>                               " Next buffer
noremap <leader>bn :bn<CR>                               " Next buffer
noremap <S-Tab> :bp<CR>                             " Previous buffer
noremap <leader>bp :bp<CR>                             " Previous buffer
noremap <leader><Tab> :bd<CR>                       " Erase current buffer
noremap <leader>bd :bd<CR>                       " Erase current buffer

" Bind to file search
nnoremap <C-p> :GFiles<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CoC Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if filereadable(expand("~/.vim/plugged/coc.nvim"))

  " Use tab for trigger completion with characters ahead and navigate.
  " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
  " other plugin before putting this into your config.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> to trigger completion.
  if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
  else
    inoremap <silent><expr> <c-@> coc#refresh()
  endif

  " Make <CR> auto-select the first completion item and notify coc.nvim to
  " format on enter, <cr> could be remapped by other vim plugin
  inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

  " Use `[g` and `]g` to navigate diagnostics
  " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " GoTo code navigation.
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Use K to show documentation in preview window.
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

  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Symbol renaming.
  nmap <leader>rn <Plug>(coc-rename)

  " Formatting selected code.
  xmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)

  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Applying codeAction to the selected region.
  " Example: `<leader>aap` for current paragraph
  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap keys for applying codeAction to the current buffer.
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Apply AutoFix to problem on the current line.
  nmap <leader>qf  <Plug>(coc-fix-current)

  " Map function and class text objects
  " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
  xmap if <Plug>(coc-funcobj-i)
  omap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap af <Plug>(coc-funcobj-a)
  xmap ic <Plug>(coc-classobj-i)
  omap ic <Plug>(coc-classobj-i)
  xmap ac <Plug>(coc-classobj-a)
  omap ac <Plug>(coc-classobj-a)

  " Remap <C-f> and <C-b> for scroll float windows/popups.
  if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  endif

  " Use CTRL-S for selections ranges.
  " Requires 'textDocument/selectionRange' support of language server.
  nmap <silent> <C-s> <Plug>(coc-range-select)
  xmap <silent> <C-s> <Plug>(coc-range-select)

  " Add `:Format` command to format current buffer.
  command! -nargs=0 Format :call CocAction('format')

  " Add `:Fold` command to fold current buffer.
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " Add `:OR` command for organize imports of the current buffer.
  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

  " Add (Neo)Vim's native statusline support.
  " NOTE: Please see `:h coc-status` for integrations with external plugins that
  " provide custom statusline: lightline.vim, vim-airline.
  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

  " Mappings for CoCList
  " Show all diagnostics.
  nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
  " Manage extensions.
  nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
  " Show commands.
  nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
  " Find symbol of current document.
  nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
  " Search workspace symbols.
  nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
  " Resume latest coc list.
  nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

endif
