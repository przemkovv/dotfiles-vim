" vim: set fdm=marker
" vim: set foldlevel=0

let s:running_windows = has("win16") || has("win32") || has("win64")


set t_Co=256
set t_ut=

if has('vim_starting')
   set nocompatible               " Be iMproved

   " Required:
    if !s:running_windows
        set runtimepath+=~/.vim/bundle/neobundle.vim/
    else
        set runtimepath+=~/vimfiles/bundle/neobundle.vim/
    endif
 endif
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'tpope/vim-sensible'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }


"NeoBundle 'Lokaltog/vim-easymotion.git'
NeoBundle 'scrooloose/syntastic.git'
NeoBundle 'klen/python-mode.git'
NeoBundle 'rking/ag.vim'
NeoBundle 'mileszs/ack.vim.git'
NeoBundle 'maksimr/vim-translator'
NeoBundle 'sjl/clam.vim.git'
NeoBundle 'davidhalter/jedi-vim.git' ", {'disabled': 1}

NeoBundle 'tpope/vim-fugitive.git'
NeoBundle 'kien/ctrlp.vim.git'
NeoBundle 'ciaranm/securemodelines.git'
NeoBundle 'vim-scripts/utl.vim.git'
NeoBundle 'embear/vim-localvimrc'
"NeoBundle 'lukerandall/haskellmode-vim.git'
NeoBundle 'altercation/vim-colors-solarized.git'
NeoBundle 'mhinz/vim-signify.git'
NeoBundle 'beloglazov/vim-online-thesaurus.git'
"NeoBundle 'junegunn/vim-easy-align.git'
"NeoBundle 'terryma/vim-smooth-scroll.git'
"NeoBundle 'tpope/vim-markdown.git'
NeoBundle 'vim-pandoc/vim-pandoc'
NeoBundle 'vim-pandoc/vim-pandoc-syntax'
NeoBundle 'vim-pandoc/vim-pandoc-after'
" Snippets
NeoBundle 'honza/vim-snippets'
NeoBundle 'SirVer/ultisnips'

" Status bar
NeoBundle 'bling/vim-airline.git'

" Text Objects
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-entire' " ae, ie
NeoBundle 'kana/vim-textobj-lastpat' " a/, i/, a?, i?
NeoBundle 'kana/vim-textobj-line' " al, il
NeoBundle 'kana/vim-textobj-indent' " ai, ii, aI, iI
NeoBundle 'lucapette/vim-textobj-underscore' " a_, i_
NeoBundle 'bps/vim-textobj-python' " af, if, ac, ic

" Tags
NeoBundle 'xolox/vim-easytags' " Automated tag file generation and syntax highlighting of tags in Vim
NeoBundle 'xolox/vim-misc' " Miscellaneous auto-load Vim scripts
NeoBundle 'majutsushi/tagbar'

"NeoBundle 'tpope/vim-vinegar.git'
if !s:running_windows
  NeoBundle 'Valloric/YouCompleteMe.git', {'build': {'
        \ unix': './install.sh --clang-completer --system-libclang'}}
endif
NeoBundle 'tommcdo/vim-exchange'
NeoBundle 'vim-ruby/vim-ruby.git'
NeoBundle 'tpope/vim-rails.git'
NeoBundle 'dbext.vim' " 2.00  Provides database access to many DBMS (Oracle, Sybase, Microsoft, MySQL, DBI,..)
NeoBundle 'tpope/vim-bundler.git'
NeoBundle 'terryma/vim-expand-region.git'
NeoBundle 'tpope/vim-endwise.git'
NeoBundle 'tpope/vim-sleuth.git'
NeoBundle 'AndrewRadev/splitjoin.vim.git'
"NeoBundle 'git://git.code.sf.net/p/atp-vim/code',
		   "\ {'name': 'atp-vim'}
NeoBundle 'sjl/gundo.vim'
NeoBundle 'duff/vim-scratch' " Yegappan Lakshmanan's scratch.vim plugin
NeoBundle 'vim-orgmode' " 0.2   Text outlining and task management for Vim based on Emacs' Org-Mode
"NeoBundle 'vim-scripts/yankring.vim' 
NeoBundle 'koljakube/vim-dragvisuals' " Damian Conway's dragvisuals for vim, compatible with pathogen.
NeoBundle 'tpope/vim-dispatch' " dispatch.vim: asynchronous build and test dispatcher
"NeoBundle 'thoughtbot/vim-rspec' " Run Rspec specs from Vim
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'groenewege/vim-less'
NeoBundle 'scrooloose/nerdtree.git'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'tpope/vim-ragtag'
NeoBundle 'othree/html5.vim'
NeoBundle 'justinmk/vim-sneak'
"NeoBundle 'Keithbsmiley/rspec.vim' " Better rspec syntax highlighting for Vim
NeoBundle 'xolox/vim-easytags' " Automated tag file generation and syntax highlighting of tags in Vim
NeoBundle 'xolox/vim-misc' " Miscellaneous auto-load Vim scripts
"NeoBundle 'xolox/vim-notes'
NeoBundle 'mattn/webapi-vim' " vim interface to Web API
NeoBundle 'mattn/ctrlp-gist' " ctrlp gist extension
NeoBundle 'mattn/gist-vim' " vimscript for gist
"NeoBundle 'paradigm/TextObjectify' " TextObjectify is a Vim plugin which improves text-objects
NeoBundle 'wellle/targets.vim' 
NeoBundle 'FSwitch'
NeoBundle 'vimwiki/vimwiki'
NeoBundle 'lervag/vim-latex'

" Clojure
NeoBundle 'guns/vim-clojure-static' " Meikel Brandmeyer's excellent Clojure runtime files
NeoBundle 'tpope/vim-fireplace' " fireplace.vim: Clojure REPL support

NeoBundleCheck
call neobundle#end()

filetype off


if s:running_windows
    if has("multi_byte")
        if &termencoding == ""
            let &termencoding = &encoding
        endif
        set encoding=utf-8
        setglobal fileencoding=utf-8
        "setglobal bomb
        set fileencodings=ucs-bom,utf-8,latin1
    endif
    set langmenu=pl_PL.UTF-8
    let $LANG = 'pl_PL.UTF-8'
endif

filetype plugin indent on

"if !s:running_windows
    "let g:Powerline_symbols = "fancy"
"endif

"let g:Powerline_colorscheme = 'solarized16'

let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#branch#empty_message = "No SCM"
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number

if s:running_windows
  let g:airline_left_sep = '⮀'
  let g:airline_left_alt_sep = '⮁'
  let g:airline_right_sep = '⮂'
  let g:airline_right_alt_sep = '⮃'
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''
  let g:airline#extensions#tabline#right_sep = ''
  let g:airline#extensions#tabline#right_alt_sep = ''
endif

syntax on

"let g:solarized_termcolors = 256
set background=dark
colorscheme solarized
"set cursorline
call togglebg#map("<F11>")

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
                \| exe "normal g'\"" | endif
endif

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
set mouse=a         " Enable mouse usage (all modes) in terminals
set hlsearch      " highlight search terms
set history=10000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore+=*.swp,*.bak,*.pyc,*.class
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.d,*.o     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe
set wildignore+=*.doc,*.docx,*.pdf,*.ppt,*.pptx,*.xls,*.wmv  " Windows
set wildignore+=*.bbl,*.synctex.gz,*.blg,*.aux
set wildignore+=*\\vendor\\**
set wildignore+=*/vendor/**
set wildmode=list:longest
set title
set relativenumber
set undofile
set ttyfast
set showmode
set wildmenu
set laststatus=2
set scrolloff=5 " Keep 5 lines (top/bottom) 
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
" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif


let mapleader = "\<Space>"
let maplocalleader = "\\"
"nnoremap <leader><space> :noh<cr>
set colorcolumn=85

let g:pymode_rope = 0

set nocp
filetype plugin on
au BufNewFile,BufRead *.flex set filetype=lex

"autocmd! bufwritepost .vimrc source %

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

let g:tex_indent_items=1
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


set switchbuf=useopen ",usetab,newtab
set showtabline=1
set tabpagemax=15

set cryptmethod=blowfish
"au BufAdd,BufNewFile,BufRead * nested tab sball

"nmap <leader><F5>   <Plug>ATP_TeXVerbose
"nmap <leader><F3>   <Plug>ATP_ViewOutput_sync

cnoremap <c-a> <home>
cnoremap <c-e> <end>

"nmap <A-Space> :call CursorPing()<CR>
highlight SpellBad term=reverse ctermbg=1

vmap  <expr>  <LEFT>   DVB_Drag('left')  
vmap  <expr>  <RIGHT>  DVB_Drag('right') 
vmap <expr>  <DOWN>   DVB_Drag('down')  
vmap  <expr>  <UP>     DVB_Drag('up')    
vmap  <expr>  D        DVB_Duplicate()   

"map <A-DOWN> gj
"map <A-UP> gk
"imap <A-DOWN> <ESC>gji
"imap <A-UP> <ESC>gki
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>
nnoremap <Leader>ev :e  $MYVIMRC<CR>
nnoremap <Leader>l :s/\.\ /\.\r/g<CR>:nohl<CR>
nnoremap <Leader>h :Make<CR>
nnoremap <Leader>= mz:%!astyle -A4 -U -H -k3 -W1 -xe -f -xy -j -C -S<CR>`z<CR>k
"nnoremap <Leader>= mzgg=G`z<CR>  " reindent
nnoremap <Leader>sf :FSHere<CR>

imap <M-j> <Plug>IMAP_JumpForward
nmap <M-j> <Plug>IMAP_JumpForward
vmap <M-j> <Plug>IMAP_JumpForward
" Easy window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"
"===============================================================================
" Command-line Mode Key Mappings
"===============================================================================

" Bash like keys for the command line. These resemble personal zsh mappings
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Ctrl-[hl]: Move left/right by word
cnoremap <c-h> <s-left>
cnoremap <c-l> <s-right>

" Ctrl-Space: Show history
cnoremap <c-@> <c-f>

cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-f> <left>
cnoremap <c-g> <right>

cnoremap w!! w !sudo tee % >/dev/null

"noremap <F1> :MBEbp<CR>
"noremap <F2> :MBEbn<CR>
"let notabs = 1
"nnoremap <silent> <F118> :let notabs=!notabs<Bar>:if notabs<Bar>:tabo<Bar>:else<Bar>:tab ball<Bar>:tabn<Bar>:endif<CR>

"nnoremap <Tab>  %  " disabled because of the conflict with Ctrl-I
"noremap <F1> :tabprev<CR>
"noremap <F2> :tabnext<CR>
noremap <leader>[ :bprev<CR>
noremap <leader>] :bnext<CR>
noremap <leader><bs> :bdelete<CR>
noremap <leader><leader><bs> :bdelete!<CR>
noremap <leader>3 :TagbarToggle<CR>
noremap <leader>4 :NERDTreeToggle<CR>
"nnoremap <silent> <F5> :YRShow<cr>
"inoremap <silent> <F5> <ESC>:YRShow<cr>
nnoremap <F6> :GundoToggle<CR>
" <F8> spell checking
nnoremap <F12> :set invpaste paste?<CR>
inoremap <F12> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F12>

nnoremap <leader>z zMzvzz


noremap CN <esc>:lne<cr>
noremap CP <esc>:lN<cr>
noremap cn <esc>:cn<cr>
noremap cp <esc>:cp<cr>
"inoremap <Esc> <Esc>`^
nnoremap H  g^
nnoremap L  g$
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
nnoremap Y y$
"nnoremap <C-Enter> O<Esc>
"nnoremap <S-Enter> o<Esc>

inoremap <M-o> <C-O>o
inoremap <M-O> <C-O>O
inoremap <M-I>      <C-O>^
inoremap <M-A>      <C-O>$

" easier moving of code blocks
vnoremap < <gv   " better indentation
vnoremap > >gv   " better indentation

"inoremap <esc> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
"nnoremap Ajk    <nop>
"nnoremap A<esc> <nop>

" saving file
nnoremap <Leader>w :w<CR>

" copy & paste
vmap <Leader>y "+y
"vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

nmap <leader>sj :SplitjoinSplit<cr> 
nmap <leader>sk :SplitjoinJoin<cr> 

" Ctrl-/: A more powerful '/'
	nmap <c-_> [unite]l

"" Map space to the prefix for Unite
nnoremap [unite] <Nop>
" Ctrl-\: Quick outline
nmap <silent> <c-\> [unite]o
" Quick outline
nnoremap <silent> [unite]o :<C-u>Unite -buffer-name=outline -vertical outline<CR>

" Quick line
nnoremap <silent> [unite]l :<C-u>Unite -buffer-name=search_file line<CR>
	

"===============================================================================
" Insert Mode Ctrl Key Mappings
"===============================================================================
" Ctrl-w: Delete previous word, create undo point
inoremap <c-w> <c-g>u<c-w>

" Ctrl-u: Delete til beginning of line, create undo point
inoremap <c-u> <c-g>u<c-u>

"===============================================================================
" Normal Mode Key Mappings
"=============================================================================== 
"n: Next, keep search matches in the middle of the window
nnoremap n nzzzv

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

" Folding ----------------------------------------------------------------- {{{
set foldlevelstart=20
" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

" "Focus" the current line.  Basically:
"
" 1. Close all folds.
" 2. Open just the folds containing the current line.
" 3. Move the line to a little bit (15 lines) above the center of the screen.
" 4. Pulse the cursor line.  My eyes are bad.
"
" This mapping wipes out the z mark, which I never use.
"
" I use :sus for the rare times I want to actually background Vim.
function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()

" }}}
" Filetype-specific ------------------------------------------------------- {{{

" C {{{

augroup ft_c
    au!
    au FileType c setlocal foldmethod=marker foldmarker={,}
augroup END

" }}}
" CSS and LessCSS {{{

augroup ft_css
    au!

    au BufNewFile,BufRead *.less setlocal filetype=less

    au Filetype less,css setlocal foldmethod=marker
    au Filetype less,css setlocal foldmarker={,}
    au Filetype less,css setlocal omnifunc=csscomplete#CompleteCSS
    au Filetype less,css setlocal iskeyword+=-
    "{{{"}}}
    " Use <leader>S to sort properties.  Turns this:
    "
    "     p {
    "         width: 200px;
    "         height: 100px;
    "         background: red;
    "
    "         ...
    "     }
    "
    " into this:

    "     p {
    "         background: red;
    "         height: 100px;
    "         width: 200px;
    "
    "         ...
    "     }
    au BufNewFile,BufRead *.less,*.css nnoremap <buffer> <localleader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>

    " Make {<cr> insert a pair of brackets in such a way that the cursor is correctly
    " positioned inside of them AND the following code doesn't get unfolded.
    au BufNewFile,BufRead *.less,*.css inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>
augroup END

" }}}
" HTML, Django, Jinja, Dram {{{

"let g:html_indent_tags = ['p', 'li']

augroup ft_html
    au!

    au BufNewFile,BufRead *.html setlocal filetype=htmldjango
    au BufNewFile,BufRead *.dram setlocal filetype=htmldjango

    au FileType html,jinja,htmldjango setlocal foldmethod=manual

    " Use <localleader>f to fold the current tag.
    au FileType html,jinja,htmldjango nnoremap <buffer> <localleader>f Vatzf

    " Use <localleader>t to fold the current templatetag.
    au FileType html,jinja,htmldjango nmap <buffer> <localleader>t viikojozf

    " Indent tag
    au FileType html,jinja,htmldjango nnoremap <buffer> <localleader>= Vat=

    " Django tags
    au FileType jinja,htmldjango inoremap <buffer> <c-t> {%<space><space>%}<left><left><left>

    " Django variables
    au FileType jinja,htmldjango inoremap <buffer> <c-b> {{<space><space>}}<left><left><left>
augroup END

" }}}
" Haskell {{{

" use ghc functionality for haskell files
au Bufenter *.hs compiler ghc
let g:haddock_browser = "w3m"

" }}}
" Java {{{

augroup ft_java
    au!

    au FileType java setlocal foldmethod=marker
    au FileType java setlocal foldmarker={,}
augroup END

" }}}
" Javascript {{{

augroup ft_javascript
    au!

    au FileType javascript setlocal foldmethod=marker
    au FileType javascript setlocal foldmarker={,}
    au FileType javascript call MakeSpacelessBufferIabbrev('clog', 'console.log();<left><left>')

    " Make {<cr> insert a pair of brackets in such a way that the cursor is correctly
    " positioned inside of them AND the following code doesn't get unfolded.
    au Filetype javascript inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>
augroup END

" }}}
" Mail {{{

augroup ft_mail
    au!

    au Filetype mail setlocal spell
augroup END

" }}}
" Markdown {{{

let g:tagbar_type_markdown = {
      \ 'ctagstype' : 'markdown',
      \ 'kinds' : [
      \ 'h:headings'
      \ ],
      \ 'sort' : 0,
      \ }

augroup ft_markdown
    au!

    au BufNewFile,BufRead *.m*down setlocal filetype=markdown foldlevel=1

    " Use <localleader>1/2/3 to add headings.
    au Filetype markdown nnoremap <buffer> <localleader>1 yypVr=:redraw<cr>
    au Filetype markdown nnoremap <buffer> <localleader>2 yypVr-:redraw<cr>
    au Filetype markdown nnoremap <buffer> <localleader>3 mzI###<space>`zllll <ESC>

    au Filetype markdown nnoremap <buffer> <localleader>p VV:'<,'>!python -m json.tool<cr>
    au Filetype markdown vnoremap <buffer> <localleader>p :!python -m json.tool<cr>
    au Filetype markdown setlocal textwidth=80
augroup END
" }}}
" Mercurial {{{

augroup ft_mercurial
    au!

    au BufNewFile,BufRead *hg-editor-*.txt setlocal filetype=hgcommit
augroup END

" }}}
" Mutt {{{

augroup ft_muttrc
    au!

    au BufRead,BufNewFile *.muttrc set ft=muttrc

    au FileType muttrc setlocal foldmethod=marker foldmarker={{{,}}}
augroup END

" }}}
" OrgMode {{{

augroup ft_org
    au!

    au Filetype org nmap <buffer> Q vahjgq
    au Filetype org setlocal nolist
augroup END

" }}}
" Postgresql {{{

augroup ft_postgres
    au!

    au BufNewFile,BufRead *.sql set filetype=pgsql
    au FileType pgsql set foldmethod=indent
    au FileType pgsql set softtabstop=2 shiftwidth=2
    au FileType pgsql setlocal commentstring=--\ %s comments=:--
augroup END

" }}}
" Python {{{

augroup ft_python
    au!

    au FileType python setlocal define=^\s*\\(def\\\\|class\\)
    au FileType man nnoremap <buffer> <cr> :q<cr>

    " Jesus tapdancing Christ, built-in Python syntax, you couldn't let me
    " override this in a normal way, could you?
    au FileType python if exists("python_space_error_highlight") | unlet python_space_error_highlight | endif

    au FileType python iabbrev <buffer> afo assert False, "Okay"
augroup END

" }}}
" QuickFix {{{

augroup ft_quickfix
    au!
    au Filetype qf setlocal colorcolumn=0 nolist nocursorline nowrap tw=0
augroup END

" }}}
" ReStructuredText {{{

augroup ft_rest
    au!

    au Filetype rst nnoremap <buffer> <localleader>1 yypVr=:redraw<cr>
    au Filetype rst nnoremap <buffer> <localleader>2 yypVr-:redraw<cr>
    au Filetype rst nnoremap <buffer> <localleader>3 yypVr~:redraw<cr>
    au Filetype rst nnoremap <buffer> <localleader>4 yypVr`:redraw<cr>
augroup END

" }}}
" Ruby {{{

augroup ft_eruby
    au!
    au FileType eruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
augroup END

augroup ft_ruby
    au!
    au FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
    autocmd BufRead *_spec.rb syn keyword rubyRspec describe context it specify it_should_behave_like before after setup subject its shared_examples_for shared_context let highlight def link rubyRspec Function
augroup END

" }}}
" Scala {{{

augroup ft_scala
    au!
    au Filetype scala setlocal foldmethod=marker foldmarker={,}
    au Filetype scala setlocal textwidth=100
    au Filetype scala compiler maven
    au Filetype scala let b:dispatch = 'mvn -B package install'
    au Filetype scala nnoremap <buffer> <localleader>s mz:%!sort-scala-imports<cr>`z
    au Filetype scala nnoremap <buffer> M :call scaladoc#Search(expand("<cword>"))<cr>
    au Filetype scala vnoremap <buffer> M "ry:call scaladoc#Search(@r)<cr>
    au Filetype scala nmap <buffer> <localleader>( ysiwbi
    au Filetype scala nmap <buffer> <localleader>[ ysiwri
    ")]
augroup END

" }}}
" Vim {{{

augroup ft_vim
    au!


    au FileType vim setlocal foldlevelstart=1
    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=78
    au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END

" }}}
" YAML {{{

augroup ft_yaml
    au!

    au FileType yaml set shiftwidth=2
augroup END

" }}}
" XML {{{

augroup ft_xml
    au!

    au FileType xml setlocal foldmethod=manual

    " Use <localleader>f to fold the current tag.
    au FileType xml nnoremap <buffer> <localleader>f Vatzf

    " Indent tag
    au FileType xml nnoremap <buffer> <localleader>= Vat=
augroup END

" }}}

" }}}
" Plugin settings --------------------------------------------------------- {{{

" Google-Translate {{{
  let g:goog_user_conf = { 'langpair': 'pl|en' }
"}}}
  
" Pymode {{{
let g:pymode_breakpoint = 0
let g:pymode_doc = 0
let g:pymode_doc_bind =''
" }}}
" ATP {{{

" This is only valid for Xpdf viewer. If set to 1 it will reload the file even
" if compelation returned with non zero exit code (the default is 1).
    "let b:atp_ReloadOnError		= 1

" If you set this variable to 1 (defult is 0) after each compelation errors in
" the tex buffer will be highlighted.
    "let g:atp_HighlightErrors 		= 1

    "let g:atp_ProjectScript = 1

" }}}
" Ctrl-P {{{

nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>m :CtrlPMRUFiles<CR>
nnoremap <leader>t :CtrlPTag<CR>
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:100'

" Set no max file limit
let g:ctrlp_max_files = 0
" Search from current directory instead of project root
"let g:ctrlp_working_path_mode = 0
let g:ctrlp_working_path_mode = 'raw'
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
                          \ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']

let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$\|vendor\|build',
    \ 'file': '\v\.(exe|so|dll|o|d)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }

  " Multiple VCS's:
  "let g:ctrlp_user_command = {
    "\ 'types': {
      "\ 1: ['.git', 'cd %s && git ls-files'],
      "\ 2: ['.hg', 'hg --cwd %s locate -I .'],
      "\ },
    "\ 'fallback': 'find %s -type f'
    "\ }
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

" }}}
" dbext {{{
        let g:dbext_default_usermaps = 0
" }}}
" Sneak {{{

let g:sneak#streak = 1
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T

nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F
" }}}
" Scratch {{{

command! ScratchToggle call ScratchToggle()

function! ScratchToggle()
    if exists("w:is_scratch_window")
        unlet w:is_scratch_window
        exec "q"
    else
        exec "normal! :Sscratch\<cr>\<C-W>L"
        let w:is_scratch_window = 1
    endif
endfunction

nnoremap <silent> <leader><tab> :ScratchToggle<cr>

" }}}
" Secure Modelines {{{

let g:secure_modelines_allowed_items = [
            \ "textwidth",   "tw",
            \ "foldmethod",  "fdm",
            \ "foldnextmax",  "fdn",
            \ "foldlevel", "foldlevelstart",
            \ ]

" }}}
" Better digraphs {{{
"inoremap <expr>  <C-K>   BDG_GetDigraph() 
" }}}
" Signify {{{
    let g:signify_vcs_list = [ 'git', 'svn' ]
    let g:signify_mapping_next_hunk = ']c'
    let g:signify_mapping_prev_hunk = '[c'
    "let g:signify_mapping_toggle_highlight = ''
    "let g:signify_mapping_toggle = ''
    nmap <nop> <plug>(signify-toggle-highlight)
    nmap <nop> <plug>(signify-toggle)
" }}}
" EasyAlign {{{
" Start interactive EasyAlign in visual mode
"vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign with a Vim movement
"nmap <Leader>a <Plug>(EasyAlign)
" }}}
" Local VIM RC {{{
  let g:localvimrc_name = ".localvimrc"
  let g:localvimrc_sandbox = 0
" }}}
" UltiSnips {{{
"
   "let g:UltiSnipsExpandTrigger="<c-y>"

"func! s:jInYCM()
    "if pumvisible()
        "return "\<C-n>"
    "else
        "return "\<c-j>"
"endfunction

"func! s:kInYCM()
    "if pumvisible()
        "return "\<C-p>"
    "else
        "return "\<c-k>"
"endfunction
"inoremap <c-j> <c-r>=s:jInYCM()<cr>
"au BufEnter,BufRead * exec "inoremap <silent> " . g:UltiSnipsJumpBackwordTrigger . " <C-R>=s:kInYCM()<cr>"
"let g:UltiSnipsJumpBackwordTrigger = "<c-k>"
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" }}}
" Unite {{{
  let g:unite_source_history_yank_enable = 1
  "nnoremap <space>y :Unite history/yank<cr>
  "
" Use the fuzzy matcher for everything
call unite#filters#matcher_default#use(['matcher_fuzzy'])
" Start in insert mode
	let g:unite_enable_start_insert = 1
	
	let g:unite_data_directory = "~/.unite"


" Open in bottom right
	let g:unite_split_rule = "botright"
	" Shorten the default update date of 500ms
	let g:unite_update_time = 200
" }}}
" Tagbar {{{
  let g:tagbar_left = 1
  let g:tagbar_width = 33
  let g:tagbar_compact = 1
" }}}
" Pandoc {{{
let g:pandoc#after#modules#enabled = ["unite", "ultisnips"]
" }}}

" Jedi {{{
       let g:jedi#auto_vim_configuration = 0
        let g:jedi#popup_on_dot = 0
        let g:jedi#popup_select_first = 0
        let g:jedi#completions_enabled = 0
        let g:jedi#completions_command = ""
        let g:jedi#show_call_signatures = "1"

        "let g:jedi#goto_assignments_command = "<leader>pa"
        "let g:jedi#goto_definitions_command = "<leader>pd"
        "let g:jedi#documentation_command = "<leader>pk"
        "let g:jedi#usages_command = "<leader>pu"
        "let g:jedi#rename_command = "<leader>pr"
        let g:jedi#documentation_command = ''
" }}}
" Syntastic {{{
    let g:syntastic_cpp_auto_refresh_includes = 1
    let g:syntastic_cpp_compiler = 'clang++'
    let g:syntastic_cpp_compiler_options = '-std=gnu++11 -Wall'
    "let g:syntastic_cpp_check_header = 1
    let g:syntastic_error_symbol='✗'
    let g:syntastic_warning_symbol='⚠'
    let g:syntastic_enable_highlighting=0
    let g:syntastic_auto_loc_list=1 
    let g:syntastic_loc_list_height = 5
    let g:syntastic_always_populate_loc_list=1
" }}}
" EasyTags {{{

let g:easytags_auto_update = 0
let g:easytags_events = ['BufWritePost']
set tags=./tags;
let g:easytags_dynamic_files = 2
let g:easytags_include_members = 0
" }}}
" YouCompleteMe {{{
let g:ycm_key_list_previous_completion=['<Up>']
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_auto_trigger = 0

let g:ycm_key_detailed_diagnostics = ''
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

let g:ycm_goto_buffer_command = 'same-buffer'
nnoremap <leader>jd :YcmCompleter GoTo<CR>

" }}}
" Vim ruby {{{
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1
let g:rubycomplete_load_gemfile = 1
"let g:rubycomplete_use_bundler = 1
" }}}
" Vim-notes {{{

  let g:notes_directories = ['~/Documents/notes']
" }}}
" Vimwiki {{{
  let g:vimwiki_list = [{'path': '~/Documents/wiki', 'path_html': '/srv/http/wiki'}]
  nmap <leader>uu <Plug>VimwikiIndex
  nmap <f14> <Plug>VimwikiTabIndex
  nmap <F15> <Plug>VimwikiUISelect
  nmap <leader>ud <Plug>VimwikiDiaryIndex
  nmap <F17> <Plug>VimwikiDiaryGenerateLinks
  nmap <leader>un <Plug>VimwikiMakeDiaryNote

  nmap <F19> <Plug>VimwikiTabMakeDiaryNote

" }}}

" }}}
" Text objects ------------------------------------------------------------ {{{

" Shortcut for [] {{{

onoremap ir i[
onoremap ar a[
vnoremap ir i[
vnoremap ar a[

" }}}
" Next and Last {{{
"
" Motion for "next/last object".  "Last" here means "previous", not "final".
" Unfortunately the "p" motion was already taken for paragraphs.
"
" Next acts on the next object of the given type, last acts on the previous
" object of the given type.  These don't necessarily have to be in the current
" line.
"
" Currently works for (, [, {, and their shortcuts b, r, B. 
"
" Next kind of works for ' and " as long as there are no escaped versions of
" them in the string (TODO: fix that).  Last is currently broken for quotes
" (TODO: fix that).
"
" Some examples (C marks cursor positions, V means visually selected):
"
" din'  -> delete in next single quotes                foo = bar('spam')
"                                                      C
"                                                      foo = bar('')
"                                                                C
"
" canb  -> change around next parens                   foo = bar('spam')
"                                                      C
"                                                      foo = bar
"                                                               C
"
" vin"  -> select inside next double quotes            print "hello ", name
"                                                       C
"                                                      print "hello ", name
"                                                             VVVVVV

onoremap an :<c-u>call <SID>NextTextObject('a', '/')<cr>
xnoremap an :<c-u>call <SID>NextTextObject('a', '/')<cr>
onoremap in :<c-u>call <SID>NextTextObject('i', '/')<cr>
xnoremap in :<c-u>call <SID>NextTextObject('i', '/')<cr>

onoremap al :<c-u>call <SID>NextTextObject('a', '?')<cr>
xnoremap al :<c-u>call <SID>NextTextObject('a', '?')<cr>
onoremap il :<c-u>call <SID>NextTextObject('i', '?')<cr>
xnoremap il :<c-u>call <SID>NextTextObject('i', '?')<cr>


function! s:NextTextObject(motion, dir)
    let c = nr2char(getchar())
    let d = ''

    if c ==# "b" || c ==# "(" || c ==# ")"
        let c = "("
    elseif c ==# "B" || c ==# "{" || c ==# "}"
        let c = "{"
    elseif c ==# "r" || c ==# "[" || c ==# "]"
        let c = "["
    elseif c ==# "'"
        let c = "'"
    elseif c ==# '"'
        let c = '"'
    else
        return
    endif

    " Find the next opening-whatever.
    execute "normal! " . a:dir . c . "\<cr>"

    if a:motion ==# 'a'
        " If we're doing an 'around' method, we just need to select around it
        " and we can bail out to Vim.
        execute "normal! va" . c
    else
        " Otherwise we're looking at an 'inside' motion.  Unfortunately these
        " get tricky when you're dealing with an empty set of delimiters because
        " Vim does the wrong thing when you say vi(.

        let open = ''
        let close = ''

        if c ==# "(" 
            let open = "("
            let close = ")"
        elseif c ==# "{"
            let open = "{"
            let close = "}"
        elseif c ==# "["
            let open = "\\["
            let close = "\\]"
        elseif c ==# "'"
            let open = "'"
            let close = "'"
        elseif c ==# '"'
            let open = '"'
            let close = '"'
        endif

        " We'll start at the current delimiter.
        let start_pos = getpos('.')
        let start_l = start_pos[1]
        let start_c = start_pos[2]

        " Then we'll find it's matching end delimiter.
        if c ==# "'" || c ==# '"'
            " searchpairpos() doesn't work for quotes, because fuck me.
            let end_pos = searchpos(open)
        else
            let end_pos = searchpairpos(open, '', close)
        endif

        let end_l = end_pos[0]
        let end_c = end_pos[1]

        call setpos('.', start_pos)

        if start_l == end_l && start_c == (end_c - 1)
            " We're in an empty set of delimiters.  We'll append an "x"
            " character and select that so most Vim commands will do something
            " sane.  v is gonna be weird, and so is y.  Oh well.
            execute "normal! ax\<esc>\<left>"
            execute "normal! vi" . c
        elseif start_l == end_l && start_c == (end_c - 2)
            " We're on a set of delimiters that contain a single, non-newline
            " character.  We can just select that and we're done.
            execute "normal! vi" . c
        else
            " Otherwise these delimiters contain something.  But we're still not
            " sure Vim's gonna work, because if they contain nothing but
            " newlines Vim still does the wrong thing.  So we'll manually select
            " the guts ourselves.
            let whichwrap = &whichwrap
            set whichwrap+=h,l

            execute "normal! va" . c . "hol"

            let &whichwrap = whichwrap
        endif
    endif
endfunction

" }}}
" Numbers {{{

" Motion for numbers.  Great for CSS.  Lets you do things like this:
"
" margin-top: 200px; -> daN -> margin-top: px;
"              ^                          ^
" TODO: Handle floats.

onoremap N :<c-u>call <SID>NumberTextObject(0)<cr>
xnoremap N :<c-u>call <SID>NumberTextObject(0)<cr>
onoremap aN :<c-u>call <SID>NumberTextObject(1)<cr>
xnoremap aN :<c-u>call <SID>NumberTextObject(1)<cr>
onoremap iN :<c-u>call <SID>NumberTextObject(1)<cr>
xnoremap iN :<c-u>call <SID>NumberTextObject(1)<cr>

function! s:NumberTextObject(whole)
    normal! v

    while getline('.')[col('.')] =~# '\v[0-9]'
        normal! l
    endwhile

    if a:whole
        normal! o

        while col('.') > 1 && getline('.')[col('.') - 2] =~# '\v[0-9]'
            normal! h
        endwhile
    endif
endfunction

" }}}

" }}}
" Others ------------------------------------------------------------------ {{{
"
" Ack motions {{{

" Motions to Ack for things.  Works with pretty much everything, including:
"
"   w, W, e, E, b, B, t*, f*, i*, a*, and custom text objects
"
" Awesome.
"
" Note: If the text covered by a motion contains a newline it won't work.  Ack
" searches line-by-line.

"nnoremap <silent> <leader>A :set opfunc=<SID>AckMotion<CR>g@
"xnoremap <silent> <leader>A :<C-U>call <SID>AckMotion(visualmode())<CR>

"""nnoremap <bs> :Ack! '\b<c-r><c-w>\b'<cr>
"""xnoremap <silent> <bs> :<C-U>call <SID>AckMotion(visualmode())<CR>
""nnoremap <leader>a :Ack

"""function! s:CopyMotionForType(type)
    """if a:type ==# 'v'
        """silent execute "normal! `<" . a:type . "`>y"
    """elseif a:type ==# 'char'
        """silent execute "normal! `[v`]y"
    """endif
"""endfunction

"""function! s:AckMotion(type) abort
    """let reg_save = @@

    """call s:CopyMotionForType(a:type)

    ""execute "normal! :Ack! --literal " . shellescape(@@) . "\<cr>"

    ""let @@ = reg_save
""endfunction

" }}}
" Pulse Line {{{

function! s:Pulse() " {{{
    let current_window = winnr()
    windo set nocursorline
    execute current_window . 'wincmd w'
    setlocal cursorline

    redir => old_hi
    silent execute 'hi CursorLine'
    redir END
    let old_hi = split(old_hi, '\n')[0]
    let old_hi = substitute(old_hi, 'xxx', '', '')

    let steps = 9
    let width = 1
    let start = width
    let end = steps * width
    let color = 233

    for i in range(start, end, width)
        execute "hi CursorLine ctermbg=" . (color + i)
        redraw
        sleep 6m
    endfor
    for i in range(end, start, -1 * width)
        execute "hi CursorLine ctermbg=" . (color + i)
        redraw
        sleep 6m
    endfor

    execute 'hi ' . old_hi
endfunction " }}}
command! -nargs=0 Pulse call s:Pulse()

" }}}
" TMUX {{{
augroup Tmux
    au!

    autocmd VimEnter,BufNewFile,BufReadPost * call system('tmux rename-window "vim - ' . split(substitute(getcwd(), $HOME, '~', ''), '/')[-1] . '"')
    autocmd VimLeave * call system('tmux rename-window ' . split(substitute(getcwd(), $HOME, '~', ''), '/')[-1])
augroup END
" }}}
"
" }}}
"
" Environments (GUI/Console) ---------------------------------------------- {{{

if has('gui_running')
    " GUI Vim

    " Remove all the UI cruft
    set go-=T
    set go-=l
    set go-=L
    set go-=r
    set go-=R
    set encoding=utf-8
    if s:running_windows
      set guifont=Powerline\ Consolas:h10
    else
      set guifont=Inconsolata\ for\ Powerline\ Medium\ 12
    endif
    "au GUIEnter * simalt ~x "x on an English Windows version. n on a French one
endif

" }}}


runtime! plugin/sensible.vim
