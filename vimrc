" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

set t_Co=256
set t_ut=

let s:running_windows = has("win16") || has("win32") || has("win64")

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on
"call pathogen#infect()

let g:Powerline_symbols = "fancy"

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" If using a dark backgr"ound within the editing area and syntax highlighting
" turn on this option as well
set background=dark
"set background=light
"colorscheme evening

let g:jellybeans_overrides = {
            \    'LineNr': { 'guifg': '605950', 'guibg': '252525',
            \              'ctermfg': 'none', 'ctermbg': '243',
            \              'attr': '' },
            \}
"colorscheme molokai 
"colorscheme mustang 
"colorscheme jellybeans
let g:badwolf_tabline=1
" Make the gutters darker than the background.
let g:badwolf_darkgutter = 0
colorscheme badwolf 
set cursorline

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
"    \| exe "normal g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules according to the
" detected filetype. Per default Debian Vim only load filetype specific
" plugins.
if has("autocmd")
    filetype indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes) in terminals
set hlsearch      " highlight search terms
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set wildmode=list:longest
set title
set relativenumber
set undofile
set ttyfast
set showmode
set wildmenu
set laststatus=2
set scrolloff=5 " Keep 5 lines (top/bottom) for scope
set shortmess=aOstT " shortens messages to avoid 'press a key' prompt
set sidescrolloff=5 " Keep 5 lines at the size
set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5


" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

if s:running_windows
    set backupdir=~/vimfiles/backup " where to put backup files
    set undodir=~/vimfiles/undo " where to put undo files
    set directory=~/vimfiles/temp " directory to place swap files in
else
    set backupdir=~/.vim/backup " where to put backup files
    set undodir=~/.vim/undo " where to put undo files
    set directory=~/.vim/temp " directory to place swap files in
endif


let mapleader = ","
let maplocalleader = "\\"
nnoremap <leader><space> :noh<cr>
set colorcolumn=85


" Source a global configuration file if available
" XXX Deprecated, please move your changes here in /etc/vim/vimrc
if filereadable("/etc/vim/vimrc.local")
    source /etc/vim/vimrc.local
endif


" set tags=./tags;/usr/src/linux-source-2.6.35/tags;/home/przemkovv/opnex/olsrd6/src/TAGS;/home/przemkovv/opnex/olsrd6/lib/opnex/src/TAGS
" /home/users/przemkovv/ns2/ns-allinone-2.33/ns-2.33/

let g:pymode_rope = 0

set nocp
filetype plugin on
au BufNewFile,BufRead *.flex set filetype=lex

autocmd! bufwritepost .vimrc source %

let g:EasyMotion_grouping = 1
function! g:QuickMotion()
    let s=&scrolloff
    setlocal scrolloff=0
    keepjumps normal! H
    call EasyMotion#F(0, 0)
    let &l:scrolloff = s
endfunction
nnoremap <silent> <Space> :call g:QuickMotion()<cr>

for c in split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', '\zs')
    exec 'noremap <Leader>g'. c .' :TTags '. c .'<cr>'
endfor 

" map <C-_> :cstag <C-R>=expand("<cword>")<CR><CR>
" map g<C-]> :cs find 3 <C-R>=expand("<cword>")<CR><CR>
" map g<C-\> :cs find 0 <C-R>=expand("<cword>")<CR><CR>



let g:tex_indent_items=1
set sw=4
set tabstop=4

let g:tex_flavor='latex'

"autocmd FileType python set omnifunc=pythoncomplete#Complete

set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

if has("spell")

    " turn spelling on by default
    "set spell
    " toggle spelling with F8 key
    map <F8> :set spell!<CR><Bar>:echo "Spell Check: " . strpart("OffOn", 3 * &spell, 3)<CR>

    " they were using white on white
    highlight PmenuSel ctermfg=black ctermbg=lightgray

    " limit it to just the top 10 items
    set sps=best,10                    
endif

set number
set numberwidth=5


if v:version < 602 || $DISPLAY =~ '^localhost:' || $DISPLAY == ''
    set clipboard=autoselect,exclude:.* 
endif

" When Ctrl+SpaceBar are pressed, it flashes the cursor line and column. Hack found on:  http://briancarper.net/blog/590/cursorcolumn--cursorline-slowdown
function! CursorPing()
    set cursorline cursorcolumn
    redraw
    sleep 500m
    set nocursorline nocursorcolumn
endfunction

set switchbuf=useopen,usetab,newtab
set showtabline=2
set tabpagemax=15
"au BufAdd,BufNewFile,BufRead * nested tab sball

"let g:CommandTAcceptSelectionMap = '<C-t>'
"let g:CommandTAcceptSelectionTabMap = '<CR>'

nmap <leader><F5>   <Plug>ATP_TeXVerbose
nmap <leader><F3>   <Plug>ATP_ViewOutput_sync

nmap <A-Space> :call CursorPing()<CR>
highlight SpellBad term=reverse ctermbg=1

"map <A-DOWN> gj
"map <A-UP> gk
"imap <A-DOWN> <ESC>gji
"imap <A-UP> <ESC>gki

nnoremap <Leader>sv :source $MYVIMRC<CR>
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>
nnoremap <Leader>l :s/\.\ /\.\r/g<CR>

imap <M-j> <Plug>IMAP_JumpForward
nmap <M-j> <Plug>IMAP_JumpForward
vmap <M-j> <Plug>IMAP_JumpForward
" Easy window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

cnoremap w!! w !sudo tee % >/dev/null

"noremap <F1> :MBEbp<CR>
"noremap <F2> :MBEbn<CR>
let notabs = 1
nnoremap <silent> <F118> :let notabs=!notabs<Bar>:if notabs<Bar>:tabo<Bar>:else<Bar>:tab ball<Bar>:tabn<Bar>:endif<CR>
noremap <F1> :tabprev<CR>
noremap <F2> :tabnext<CR>
noremap <F3> :TlistToggle<CR>
"noremap <F4> :NERDTreeToggle<CR>
nnoremap <silent> <F5> :YRShow<cr>
inoremap <silent> <F5> <ESC>:YRShow<cr>
nnoremap <F4> :GundoToggle<CR>
" <F8> spell checking
nnoremap <F12> :set invpaste paste?<CR>
inoremap <F12> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F12>

noremap cn <esc>:cn<cr>
noremap cp <esc>:cp<cr>
noremap <Leader>g. :TTags<cr>
noremap <Leader>g# :call ttags#List(0, "*", tlib#rx#Escape(expand("<cword>")))<cr>
noremap <Leader>g* :call ttags#List(0, "*", tlib#rx#Escape(expand("<cword>")) .".*")<cr>
noremap <Leader>g? :call ttags#List(1, "*", tlib#rx#Escape(expand("<cword>")))<cr>
"nnoremap j gj
"nnoremap k gk
nnoremap ; :
inoremap jk <ESC>
vnoremap jk <ESC>
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>a :Ack
nnoremap <leader><tab> :Scratch<cr>
inoremap <Esc> <Esc>`^
nnoremap H  g^
nnoremap L  g$
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
noremap Y y$        
nnoremap <S-Enter> O<Esc>
nnoremap <CR> o<Esc>
"nnoremap <Esc>j ciW<CR><Esc>:if match( @", "^\\s*$") < 0<Bar>exec "norm P-$diw+"<Bar>endif<CR>
nnoremap <Esc>j Wi<CR><Esc>kg$
nnoremap <Esc>J i<CR><Esc>

inoremap <M-o> <C-O>o
inoremap <M-O> <C-O>O
inoremap <M-I>      <C-O>^
inoremap <M-A>      <C-O>$
noremap <C-F4>  :bdelete<CR>


" easier moving of code blocks
vnoremap < <gv   " better indentation
vnoremap > >gv   " better indentation

inoremap <esc> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DELETE AND BACKSPACE KEYS ARE UNACCEPTABLE AS WELL
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"inoremap <Del> <Nop>
"inoremap <BS>  <Nop>


" Odds n Ends
if has("mouse")
   set mouse=a " use mouse everywhere
   set ttymouse=xterm2 " makes it work in everything
endif 
