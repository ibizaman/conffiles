call pathogen#infect()

" Basic Settings --------------------------------------------------- {{{

let mapleader = ","
let maplocalleader = ";"

" tabs
set softtabstop=4 shiftwidth=4 expandtab
set autoindent

" syntax
syntax enable
colorscheme mustang

" filetypes
set nocompatible
filetype plugin indent on

set showmode
set showcmd
set wildmenu
set wildmode=list:longest
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set history=200
set fileformats=unix

set nocompatible

" disable Background Color Erase
" http://stackoverflow.com/a/15095377/1013628
set t_ut=

" paste
set pt=<F11>

" search
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch

" text display
set wrap
set showbreak=\ 
set textwidth=72
if executable("par")
    set formatprg=par\ -w72e\ \|sed\ 's/[\ ]*$//'
endif
set formatoptions=croqn1

" tab/menu display
set showtabline=0
set swb=usetab

" }}}

" Mappings --------------------------------------------------------- {{{

" cancel search highlight
nnoremap <leader><space> :noh<cr>

" easy formatting
nnoremap <leader>q gqip
vnoremap <leader>q gq
" inoremap <C-B> <C-O>:setl sr! fo<C-R>=strpart("-+",&sr,1)<CR>=tc<CR>

" easy matching
nnoremap <tab> %
vnoremap <tab> %

" split windows
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" no disctraction
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <F1> <nop>
nnoremap <F1> <nop>
vnoremap <F1> <nop>

" }}}

" Autocommands ----------------------------------------------------- {{{

augroup save
    au!
    au BufLeave,FocusLost * silent! write
augroup END

augroup cpp
    au!
    au BufNewFile,BufRead *.cpp setlocal syntax=cpp11
augroup END

" }}}

" Plugins ---------------------------------------------------------- {{{

" NERDTree --------------------------------------------------------- {{{
nnoremap <leader>k :NERDTreeToggle<return>
let NERDTreeWinPos = "right"
let NERDTreeWinSize = 50
let NERDTreeIgnore=['.*\.app$', '^moc_.*', '.*\.exe$', '\.o$', '\~$', '\.xcodeproj', '\.graphml', '\.fig', '\.mdl', '\.aux', '\.toc', '\.beam', '\.vim$', '__pycache__', '*\.pyc']
let NERDTreeQuitOnOpen = 1
let g:nerdtree_tabs_open_on_console_startup = 1
" }}}

" easy-align ------------------------------------------------------- {{{
vmap <Enter> <Plug>(EasyAlign)
" }}}

" syntactic -------------------------------------------------------- {{{
let g:syntastic_check_on_open = 1
" }}}

" youcompleteme ---------------------------------------------------- {{{
" make youcompleteme compatible with snipmate
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
" }}}

" allow per-project .vimrc
set exrc
set secure " disable unsafe commands in local .vimrc

" }}}

