
" Auto reload vimrc when edited
autocmd! bufwritepost .vimrc source ~/.vimrc

""""""""""""
" Settings "
""""""""""""

" General Settings
set encoding=utf-8
set backspace=indent,eol,start " make backspace work better
set hidden " allow buffer switching before saving
set clipboard=unnamed " Use the system clipboard for copy and paste
set visualbell " Blink cursor on error instead of beeping
set wildmenu " visual autocomplete for command menu
set scrolloff=5

" Mouse Settings
set mouse=a " Enable mouse
map <ScrollWheelUp> <C-Y>| " Smoother scrolling
map <ScrollWheelDown> <C-E>

" Visual Settings
syntax enable " enable syntax processing
set background=dark
colorscheme gruvbox
set cursorline " highlight current line
set colorcolumn=80 " mark column 80 with vertical line
set number relativenumber " show relative line numbers, except current line
set showmatch " highlight matching braces, parentheses, etc
set mat=2 " How many tenths of a second to blink when matching brackets
set lazyredraw " redraw only when needed
set showcmd " show command in bottom bar
set ruler " show file stats
set laststatus=2 " Status bar

" Tab Settings
filetype indent on " load filetype-specific indent files
set tabstop=4 " number of visual spaces per TAB
set softtabstop=4 " number of spaces in tab when editing
set expandtab " typed tabs are treated as spaces

" Search Settings
set ignorecase " case insensitive searching...
set smartcase " ...unless the query includes uppercase letters
set incsearch " search as characters are entered
set hlsearch " highlight matches

" Folding Settings
set foldenable " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10 " 10 nested folds max
set foldmethod=indent " this is good for python, fold based on indents

""""""""""""
" Mappings "
""""""""""""

" Critical Mappings
let mapleader=" "
let g:maplocalleader = ','
inoremap jk <esc>
nnoremap U <C-R>
nnoremap <Leader>w :update<CR>

" Mappings to move by visual lines when wrapped
nnoremap k gk
nnoremap j gj
nnoremap <up> gk
nnoremap <down> gj

" Mappings for moving around buffers
nnoremap <C-n> :bprevious<CR>
nnoremap <C-m> :bnext<CR>
nnoremap <leader>bc :bdelete<CR>

" Mappings for motion
nnoremap H g^
nnoremap L g$
nnoremap K <C-b> " page up
nnoremap J <C-f> " page down
nnoremap M J

" Mapping to make Y work like C and D
nnoremap Y y$

" Mapping to indent without exiting visual mode
vnoremap > >gv
vnoremap < <gv

" Mappings for tabs (TBD)
nnoremap <leader>tn :tabnew<CR>| " Quickly open new tab

" Mappings for moving between panes
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Open help files in the right pane of a vertical split
cabbrev h vert rightb h

"""""""""""
" Plugins "
"""""""""""

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Load plugins with vim-plug
call plug#begin('~/.vim/plugged')
" NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive' " need to create mappings
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'romainl/vim-cool' " auto clear search highlighting
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Raimondi/delimitMate'
Plug 'tell-k/vim-autopep8'
" Plug 'scrooloose/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" --Airline Configuration--
let g:airline#extensions#tabline#enabled = 1 " add tabline

" --NERDTree Configuration--
map <leader>ft :NERDTreeToggle<CR>
let NERDTreeWinPos="right"
let NERDTreeMinimalUI=1
let NERDTreeStatusline=-1 " use global status line
let NERDTreeShowHidden=1
let NERDTreeMouseMode=2 " single click to open directories

" --Easymotion configuration--
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Jump to anywhere you want with `f{char}{label}`
nmap f <Plug>(easymotion-s)
let g:EasyMotion_smartcase = 1 " Turn on case-insensitive feature
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" --Commentary Configuration--
map <Leader>cc <Plug>CommentaryLine
map <Leader>c <Plug>Commentary

" --DelimitMate Configuration--
let delimitMate_expand_cr = 2 " Expand return inside brackets

" --FZF Configuration--
nnoremap <silent> <leader>bo :Files<CR>|   " Open new Buffer
nnoremap <silent> <leader>bl :Buffers<CR>| " Buffer List
nnoremap <silent> <leader>fa :Rg<CR>|      " Find in All files
nnoremap <silent> <leader>ff :BLines<CR>|  " Find in current File

" --Autoformat Configuration--
autocmd FileType python noremap <buffer> <leader>p :call Autopep8()<CR>
let g:autopep8_disable_show_diff=1 " don't show changes

" --Syntastic Configuration--
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
