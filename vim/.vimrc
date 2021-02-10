
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
set signcolumn=yes " always show sign column on left side
set listchars=tab:¦\ ,trail:~,space:·
set list
set splitright " Open new vertical split panes on the right

" Tab Settings
filetype indent on " load filetype-specific indent files
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
autocmd FileType json setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType go setlocal tabstop=4 shiftwidth=4 softtabstop=0 noexpandtab
autocmd FileType yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
"tabstop: number of visual spaces per TAB
"softtabstop: number of spaces in tab when editing
"expandtab: typed tabs are treated as spaces

" Search Settings
set ignorecase " case insensitive searching...
set smartcase " ...unless the query includes uppercase letters
set incsearch " search as characters are entered
set hlsearch " highlight matches

" Folding Settings
set foldenable " enable folding
set foldlevelstart=20 " open most folds by default
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
nnoremap <Leader>s :update<CR>

" Mappings to move by visual lines when wrapped
nnoremap k gk
nnoremap j gj
nnoremap <up> gk
nnoremap <down> gj
onoremap k gk
onoremap j gj
onoremap <up> gk
onoremap <down> gj

" Mappings for moving around buffers
nnoremap <C-n> :bprevious<CR>
nnoremap <C-m> :bnext<CR>
nnoremap <leader>fc :bdelete<CR>

" Mappings for motion
nnoremap H g^
onoremap H g^
nnoremap L g$
onoremap L g$
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

" Mappings for paging and scrolling
nnoremap K 5k
nnoremap J 5j
nnoremap <C-k> <C-y>
nnoremap <C-j> <C-e>
nnoremap M J

" Mappings to make Y work like C and D
nnoremap Y y$

" Mappings to indent without exiting visual mode
vnoremap > >gv
vnoremap < <gv

" Mappings for tabs (TBD)
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tc :tabclose<CR>

" Remove search highlighting
nnoremap <leader><CR> :nohl<CR>

" Mappings for moving between panes
" map <C-j> <C-W>j
" map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Insert blank line
noremap [<space> O<Esc>j
noremap ]<space> o<Esc>k

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
Plug 'justinmk/vim-sneak'
Plug 'romainl/vim-cool' " auto clear search highlighting
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/tagbar'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'yggdroot/indentline'
Plug 'tell-k/vim-autopep8'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" --Airline Configuration--
let g:airline#extensions#tabline#enabled = 1 " add tabline
let g:airline#extensions#coc#enabled = 1 " integrate with coc
let g:airline#extensions#tagbar#enabled = 1 " integrate with tagbar

" --NERDTree Configuration--
map <leader>ft :NERDTreeToggle<CR>
let NERDTreeWinPos="right"
let NERDTreeMinimalUI=1
let NERDTreeStatusline=-1 " use global status line
let NERDTreeShowHidden=1
let NERDTreeMouseMode=2 " single click to open directories

" --Easymotion configuration--
let g:EasyMotion_smartcase = 1 " Turn on case-insensitive feature

" --Commentary Configuration--
map <Leader>cc <Plug>CommentaryLine
map <Leader>c <Plug>Commentary

" --FZF Configuration--
nnoremap <silent> <leader>fo :Files<CR>|   " Open new Buffer
nnoremap <silent> <leader>fl :Buffers<CR>| " Buffer List
nnoremap <silent> <leader>fa :Rg<CR>|      " Find in All files
nnoremap <silent> <leader>ff :BLines<CR>|  " Find in current File

" --Autoformat Configuration--
autocmd FileType python noremap <buffer> <leader>p :call Autopep8()<CR>
let g:autopep8_disable_show_diff=1 " don't show changes

" --Vim-Go Configuration--
let g:go_term_enabled = 1 " Open terminal on GoRun, GoTest, etc.
let g:go_term_mode = "vsplit"
let g:go_term_reuse = 1 " Reuse open terminal windows
let g:go_term_close_on_exit = 0 " Don't close the terminal automatically
let g:go_auto_type_info = 1 " Show type info in status bar
let g:go_fmt_command = "goimports" " Clean up imports when formatting
let g:go_doc_popup_window = 1 " Use popup window for GoDoc
let g:go_doc_keywordprg_enabled = 0 " Disable default mapping
let g:go_def_mapping_enabled = 0 " Disable default mapping
autocmd FileType go nmap <leader>gr <Plug>(go-run)
autocmd FileType go nmap <leader>gd <Plug>(go-doc)

" --Tagbar Configuration--
nmap <leader>t :TagbarToggle<CR>
let g:tagbar_autoclose = 1 " press 'c' to keep open

"""""""""""""""""""""
" Coc Configuration "
"""""""""""""""""""""

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-python',
  \ 'coc-vimlsp',
  \ 'coc-go',
  \ 'coc-yaml'
  \ ]

set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
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
inoremap <silent><expr> <c-@> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim supports it, like:
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Shortcut to show documentation in preview window
nnoremap <silent> gk :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
" Note coc#float#scroll works on neovim >= 0.4.0 or vim >= 8.2.0750
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

