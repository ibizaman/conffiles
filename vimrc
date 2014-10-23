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

" Statusline ------------------------------------------------------- {{{

hi StatusLine   guifg=#808080 guibg=#202020 gui=none ctermfg=244 ctermbg=235 cterm=bold
hi StatusLineNC guifg=#939395 guibg=#101010 gui=none ctermfg=238 ctermbg=235

set statusline=
" buffer number
set statusline+=\ %04n
" trimmed full path to file
set statusline+=\ %.20F
" file type
set statusline+=%(\ %y%)
" modified - readonly - help - preview group
set statusline+=%(\ [%M%R%H%W]%)
" quickfix or location list
set statusline+=%(\ %q%)
" switch to the right side
set statusline+=%=
" current line number / total line number, current column and percentage
set statusline+=%25(\ %l/%-4L:%-3c\ -%p%%-\ %)
" value of byte under cursor
set statusline+=%10(\ %b\ 0x%02B\ %)

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

" shortcuts
" swap current line with the following
nnoremap <leader>- ddp
" swap current line with the previous one
nnoremap <leader>_ ddkP
" delete line in insert mode
inoremap <c-d> <esc>ddi
" select word
nnoremap <space> viw
" upper case word
nnoremap <leader>u viwUe
inoremap <leader>u <esc>viwUea
" edit .vimrc
nnoremap <leader>ve :vsplit $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>
" easy escape
inoremap jk <esc>

" }}}

" Abbreviations ---------------------------------------------------- {{{

iabbrev @@ ibizapeanut@gmail.com

" }}}

" Autocommands ----------------------------------------------------- {{{

augroup layout
    au!
    au BufNewFile,BufRead,BufWritePre *.html,*.xml setlocal nowrap
    " auto pretty format
    au BufRead,BufWritePre *.html,*.xml :normal gg=G
augroup END

augroup save
    au!
    au BufLeave,FocusLost * silent! write
augroup END

augroup text
    au!
    au FileType mkd,txt,rst setlocal spell spelllang=en_us
augroup END

augroup cpp
    au!
    au BufNewFile,BufRead *.cpp setlocal syntax=cpp11
augroup END

augroup vimscript
    au!
    au FileType vim nnoremap <leader>h :call HeadingVimscript()<cr>
    au FileType vim setlocal foldmethod=expr
    au FileType vim setlocal foldexpr=FoldingLevelVimscript(v:lnum)
augroup END

" }}}

" Movements -------------------------------------------------------- {{{

augroup movements_markdown
    au!
    " move to text in previous heading
    au FileType mkd onoremap <buffer> ih :<c-u>execute "normal! ?^\\([-=]\\)\\1\\+$\r:noh\rkvg_"<cr>
    " move to text in previous heading and take also the line under it
    au FileType mkd onoremap <buffer> ah :<c-u>execute "normal! ?^\\([-=]\\)\\1\\+$\r:noh\rg_vk0"<cr>
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

" snipmate --------------------------------------------------------- {{{
let g:snips_author = 'Pierre Penninckx'
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

" Helper Functions ------------------------------------------------- {{{

" Remove whitespace in front, add prefix to line if needed, add enough
" of the given character to fill the line until textwidth then add
" given suffix
function! FillToTextwidthAndKeepText(prefix, repetition, suffix)
    let has_whitespace=match(getline("."), "^ \\+")!=-1
    if has_whitespace
        " delete whitespace
        execute "normal! 0d/[^ ]\<cr>"
    endif

    let no_prefix=match(getline("."), "^".a:prefix)==-1
    if no_prefix
        " add the prefix and a space
        execute "normal! 0i".a:prefix." \<esc>"
    endif
    nohlsearch

    " go to the end and get the missing number of characters before
    " textwidth, minus 2 because we want a space before and after
    normal $
    let missing=&textwidth-col(".")-len(a:suffix)-2
    execute "normal a " . repeat(a:repetition, missing) . " " . a:suffix
endfunction


" Transform the line in either a opening or closing vimscript folding
" marker
function! HeadingVimscript()
    if len(getline("."))==0
        " add closing heading
        normal i" }}}
    else
        call FillToTextwidthAndKeepText('"', '-', '{{{')
    endif
endfunction


" Intelligent vimscript folding level indicator, filtering out false
" positives like {{{ anywhere in a comment or in a normal line
function! FoldingLevelVimscript(lnum)
    if match(getline(a:lnum), "^\".*{{{$")!=-1
        " add one fold level
        return "a1"
    elseif match(getline(a:lnum), "^\".*}}}$")!=-1
        " substract one fold level
        return "s1"
    else
        " same fold level as previous line
        return "="
    endif
endfunction

" }}}

