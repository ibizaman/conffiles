call pathogen#infect()

" Basic Settings --------------------------------------------------- {{{

let mapleader = ","
let maplocalleader = ";"

" tabs
set softtabstop=4 shiftwidth=4 expandtab
set autoindent

" syntax
syntax enable
colorscheme my-mustang

" vi is in the past
set nocompatible

" enable filetype plugins
filetype plugin indent on

set showmode
set showcmd
set wildmenu
set wildmode=list:longest
set ttyfast
" always show current position
set ruler
set backspace=indent,eol,start
set laststatus=2
set history=1000
set fileformats=unix

" turn magic on for regexp
set magic

" no annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=

" small timeout for key codes but let me think at the mapping
set timeout
set timeoutlen=3000
set ttimeoutlen=100

" set utf8 as standard encoding
set encoding=utf8

" use Unix as the standard file type
set fileformats=unix,dos,mac

" turn backup off, since most stuff is in git anyway...
set nobackup
set nowritebackup
set noswapfile

" persistent undo
set undodir=~/.vim_undo
set undofile

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
" set the option, but deactivate on .vimrc loading
set hlsearch
nohlsearch

" text display
set wrap
set showbreak=\ 
set textwidth=72
if executable("par")
    set formatprg=par\ -w72e\ \|sed\ 's/[\ ]*$//'
endif
set formatoptions=croqn1

" set 7 lines to the cursor when moving vertically with j and k
set scrolloff=7

" tab/menu display
set showtabline=0
set swb=usetab

" c++ indent
" do not indent private, protected and public
set cinoptions=g-1

" erlang syntax
let g:erlang_highlight_bif = 0
hi def link erlangAtom Normal

" always show vertical split for diff (and Gdiff)
set diffopt=filler,vertical

" allow to switch without writing a modified buffers
set hidden

" Generate .spl when needed.
" http://vi.stackexchange.com/a/5052
for d in glob('~/.vim/spell/*.add', 1, 1)
    if filereadable(d) && (!filereadable(d . '.spl') || getftime(d) > getftime(d . '.spl'))
        silent exec 'mkspell! ' . fnameescape(d)
    endif
endfor

" }}}

" Statusline ------------------------------------------------------- {{{

hi StatusLine   guifg=#808080 guibg=#202020 gui=none ctermfg=244 ctermbg=237 cterm=bold
hi StatusLineNC guifg=#939395 guibg=#101010 gui=none ctermfg=238 ctermbg=235

set statusline=
" buffer number
set statusline+=\ %04n
" trimmed full path to file
set statusline+=\ %.F
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

" cancel search highlight, clean empty buffers and restart syntax
nnoremap <leader><space> :noh<cr>:call CleanBuffers(0)<cr>:syntax sync fromstart<cr>

" easy formatting
nnoremap <leader>q gqip
vnoremap <leader>q gq
" inoremap <C-B> <C-O>:setl sr! fo<C-R>=strpart("-+",&sr,1)<CR>=tc<CR>

" easy matching
nnoremap <tab> %
vnoremap <tab> %

" fast saving
nnoremap <leader>w :w!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W w !sudo tee % > /dev/null

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
" replace multi-line selection
vnoremap <Leader>r "sy:%s/<C-R>=substitute(@s,"\n",'\\n','g')<CR>/
" upper case word
nnoremap <leader>u viwUe
inoremap <leader>u <esc>viwUea
" edit .vimrc
nnoremap <leader>ve :call EditMyVimrc()<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')n<CR>
vnoremap <silent> # :call VisualSelection('b')n<CR>

" toggle spell checking
nnoremap <leader>ss :setlocal spell!<cr>

" pretty formatting
command! Format :call Preserve('normal gg=G')

" open corresponding header/source files in splits
nnoremap <leader>o :call OpenSourceHeader(expand('%'))<CR>

" switch easily to other buffers
nnoremap <Leader>l :bnext<CR>
nnoremap <Leader>L :bprev<CR>

" delete buffer without closing window
nnoremap <silent> <leader>d :bprevious \| :bdelete #<CR>

" get github link to current file:line
nnoremap <leader>gc :echo 'https://github.com/openmail/OpenMail/tree/' . systemlist('git rev-parse --abbrev-ref HEAD')[0] . '/' . expand('%') . '#L' . line('.')<CR>

" motions for escaped file names
nnoremap <silent><buffer> <leader>W m':call search('\([^\\] \|^\)', 'w')<CR>
nnoremap <silent><buffer> <leader>B m':call search('\([^\\] \|^\)', 'bw')<CR>

nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

" }}}

" Abbreviations ---------------------------------------------------- {{{

iabbrev @@ ibizapeanut@gmail.com

" }}}

" Autocommands ----------------------------------------------------- {{{

augroup layout
    au!
    au BufNewFile,BufRead,BufWritePre *.html,*.xml setlocal nowrap
augroup END

augroup text
    au!
    au FileType mkd,txt,rst setlocal spell spelllang=en_us
augroup END

augroup cpp
    au!
    au BufNewFile,BufRead *.cpp setlocal syntax=cpp11
augroup END

augroup py
    au!
    au BufNewFile,BufRead *.py setlocal syntax=pysql
augroup END

augroup vimscript
    au!
    au FileType vim nnoremap <leader>h :call HeadingVimscript()<cr>
    au FileType vim setlocal keywordprg=:help
    au FileType vim setlocal foldmethod=expr
    au FileType vim setlocal foldexpr=FoldingLevelVimscript(v:lnum)
augroup END

" delete trailing white space on save
augroup whitespace
    au!
    au BufWrite *.ex,*.exs,*.py,*.cpp,*.h,*.hpp,.vimrc,*.css :call DeleteTrailingWS()
augroup END

augroup diff
    au!
    au BufEnter * :call MapDiffputIfBufferIsADiff()
augroup END

augroup rebase
    au!
    au FileType gitrebase nnoremap <cr> :call RebaseActionToggle()<cr>
augroup END

augroup erlang
    au!
    au FileType erlang setlocal keywordprg="erl -man"
augroup END

augroup docker
    au!
    au BufNewFile,BufRead Dockerfile* setlocal syntax=dockerfile
augroup END

augroup sql
    au!
    au BufNewFile,BufRead *.sql setlocal syntax=pgsql
augroup END

augroup yaml
    au!
    au FileType yaml setlocal softtabstop=2 shiftwidth=2

    au FileType yaml setlocal indentexpr=GetYamlIndent()
    au FileType yaml setlocal indentkeys=o,O,*<Return>,!^F
augroup end

augroup mutt
    au BufRead,BufNewFile *mutt-* setfiletype mail
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
nnoremap <leader>k :NERDTreeToggle<cr>
nnoremap <leader><leader>k :NERDTreeFind<cr>
let NERDTreeWinPos = "right"
let NERDTreeWinSize = 50
let NERDTreeIgnore=['.*\.app$', '^moc_.*', '.*\.exe$', '\.o$', '\~$', '\.xcodeproj', '\.graphml', '\.fig', '\.mdl', '\.aux', '\.toc', '\.beam', '__pycache__', '*\.pyc']
let NERDTreeQuitOnOpen = 1
" }}}

" easy-align ------------------------------------------------------- {{{
vmap <Enter> <Plug>(EasyAlign)
" }}}

" syntactic -------------------------------------------------------- {{{
let g:syntastic_check_on_open = 0
let g:syntastic_html_checkers = ["validator", "w3"]
let g:syntastic_enable_elixir_checker = 1
let g:syntastic_elixir_checkers = ["elixir"]
" }}}

" snipmate --------------------------------------------------------- {{{
let g:snips_author = 'Pierre Penninckx'
" }}}

" youcompleteme ---------------------------------------------------- {{{
" make youcompleteme compatible with snipmate
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
" }}}

" fzf -------------------------------------------------------------- {{{
nnoremap <c-p> :GitFiles<CR>
" }}}

" vim-test --------------------------------------------------------- {{{
nmap <silent> <leader>pp :TestNearest<CR>
nmap <silent> <leader>p; :TestFile<CR>
nmap <silent> <leader>po :TestSuite<CR>
nmap <silent> <leader>p[ :TestLast<CR>
nmap <silent> <leader>pl :TestVisit<CR>

function! ElixirUmbrellaTransform(cmd) abort
    return a:cmd
    "let apps_path = get(matchlist(s:cat('mix.exs'), 'apps_path:[^,]*"(.*)"\s*,'), 1)
    execute "normal !cat mix.exs"
    return 'vagrant ssh --command '.shellescape('cd '.vagrant_project.'; '.a:cmd)
endfunction

let g:test#custom_transformations = {'elixir': function('ElixirUmbrellaTransform')}
let g:test#transformation = 'elixir'

" }}}

" promiscuous ------------------------------------------------------ {{{
nmap <leader>gb :Promiscuous<cr>
nmap <leader>gg :Promiscuous -<cr>
" }}}

" fzf -------------------------------------------------------------- {{{
set rtp+=~/.fzf
" }}}

" enhanced-diff ---------------------------------------------------- {{{
let g:enhanced_diff_default_git = "--no-index --no-color --no-ext-diff --compaction-heuristic"
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

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ack \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

function! DeleteTrailingWS()
    " Do not delete trailing whitespaces following with a backslash
    call Preserve('%s/\(^\|[^\\]\)\s\+$/\1/ge')
endfunc


function! MapDiffputIfBufferIsADiff()
    if &diff
        nnoremap <buffer> <leader>n :diffput<cr>:diffup<cr>
        vnoremap <buffer> <leader>n :diffput<cr>:diffup<cr>
        nnoremap <buffer> <leader>u u:diffup<cr>
    endif
endfunction

function! RebaseActionToggle()
    let l:line = getline(".")
    let l:result = matchstr(line, "^\\a")
    let l:transitions = {'p': 'fixup', 'f': 'squash', 's': 'edit', 'e': 'pick'}
    execute "normal! ^cw" . transitions[result]
    execute "normal! 0"
endfunction

function! EditMyVimrc()
    let l:full_path = resolve($MYVIMRC)
    let l:full_dir = fnamemodify(full_path, ':p:h')
    execute "vsplit" . full_path
    execute "lcd" . full_dir
endfunction

" Restore cursor position, window position, and last search after running a
" command.
function! Preserve(command)
    " Save the last search.
    let search = @/

    " Save the current cursor position.
    let cursor_position = getpos('.')

    " Save the current window position.
    normal! H
    let window_position = getpos('.')
    call setpos('.', cursor_position)

    " Execute the command.
    execute a:command

    " Restore the last search.
    let @/ = search

    " Restore the previous window position.
    call setpos('.', window_position)
    normal! zt

    " Restore the previous cursor position.
    call setpos('.', cursor_position)
endfunction

" Open the corresponding .cpp, .h and .hpp file in another a split
function! OpenSourceHeader(name)
    let l:target_extension = fnamemodify(a:name, ':e')
    let l:target_filename = fnamemodify(a:name, ':r:t')

    let l:extensions = ['cpp', 'h', 'hpp']
    for extension in copy(l:extensions)
        if (l:target_extension == extension)
            let l:index = index(l:extensions, extension)
            call remove(l:extensions, l:index)
            break
        endif
    endfor

    for to_open in l:extensions
        execute 'silent!' 'vert' 'sfind' l:target_filename . '.' . to_open
    endfor
endfunction

" Delete all empty buffers except the quickfix one and those displayed
" in a window.
function! CleanBuffers(all)
    let l:filter_string = 'v:val!=0 && buflisted(v:val) && bufwinnr(v:val)<0'
    if a:all == 0
        let l:filter_string .= ' && getbufline(v:val, 1, 2)==[""]'
    endif
    echom l:filter_string
    let l:buffers = filter(range(0, bufnr('$')), l:filter_string)
    if !empty(l:buffers)
        execute 'bwipeout ' . join(l:buffers, ' ')
    endif
endfunction

function! GetYamlIndent()
  let lnum = v:lnum - 1
  if lnum == 0
    return 0
  endif
  let line = substitute(getline(lnum),'\s\+$','','')
  let indent = indent(lnum)
  let increase = indent + &sw
  if line =~ ':$'
    return increase
  else
    return indent
  endif
endfunction

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set %s :",
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no', strlen(&syntax) > 0 ? 'syn='.&syntax : '')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction

" }}}

