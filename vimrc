" vim: set fdm=marker
" vim: set foldlevel=0

let s:running_windows = has("win16") || has("win32") || has("win64")

set termguicolors
syntax enable

let s:editor_root=expand("~/.vim")

" Plugins -------------------------------------------------------------------- {{{

" Setting up plugins
if empty(glob(s:editor_root . '/autoload/plug.vim'))
  autocmd VimEnter * echom "Downloading and installing vim-plug..."
  silent execute "!curl -fLo " . s:editor_root . "/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged/')

Plug 'morhetz/gruvbox'

"Plug 'tpope/vim-sensible'
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/unite-outline'
"Plug 'Shougo/neoinclude.vim'
Plug 'tsukkee/unite-tag'
Plug 'tsukkee/unite-help'
Plug 'osyo-manga/unite-quickfix'
Plug 'ervandew/supertab'


Plug 'Shougo/neomru.vim'
Plug 'Shougo/vimproc', { 'do' : 'make' }
"Plug 'Shougo/deoplete.nvim'
"Plug 'zchee/deoplete-clang'

Plug 'tpope/vim-dispatch' " dispatch.vim: asynchronous build and test dispatcher
Plug 'tpope/vim-unimpaired'
Plug 'junegunn/goyo.vim'
Plug 'nhooyr/neoman.vim' "vim-plug

"Plug 'OmniSharp/omnisharp-vim'

"Plug 'scrooloose/syntastic'
Plug 'benekastah/neomake'
" Plug 'maksimr/vim-translator'
" Plug 'sjl/clam.vim' " Clam.vim is a lightweight Vim plugin to easily run shell commands.

Plug 'tpope/vim-fugitive'
Plug 'ciaranm/securemodelines'
Plug 'vim-scripts/utl.vim'
Plug 'embear/vim-localvimrc'
"Plug 'lukerandall/haskellmode-vim'
Plug 'mhinz/vim-signify'
Plug 'dhruvasagar/vim-markify'
"Plug 'beloglazov/vim-online-thesaurus'
"Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
"Plug 'vim-pandoc/vim-pandoc-after'

Plug 'bronson/vim-trailing-whitespace'

"Plug 'junegunn/vim-peekaboo'

" Snippets
" Set up ultisnips - need to symlink vim scripts to be run when files are opened
function! SymlinkSnippets(info)
  if a:info.status == 'installed' || a:info.force && !isdirectory(s:editor_root . "/ftdetect")
    silent execute "!ln -s " . s:editor_root . "/plugged/ultisnips/ftdetect " . s:editor_root . "/"
  endif
endfunction
Plug 'SirVer/ultisnips', { 'do': function('SymlinkSnippets') } | Plug 'honza/vim-snippets'

" Status bar
Plug 'vim-airline/vim-airline'

" Search
Plug 'justinmk/vim-sneak'

" Text Objects
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'kana/vim-textobj-user'
"Plug 'kana/vim-textobj-entire' " ae, ie conflicts with latex environments
Plug 'kana/vim-textobj-lastpat' " a/, i/, a?, i?
Plug 'kana/vim-textobj-line' " al, il
Plug 'kana/vim-textobj-indent' " ai, ii, aI, iI
Plug 'kana/vim-textobj-function' " af, if, aF, iF
Plug 'lucapette/vim-textobj-underscore' " a_, i_
Plug 'bps/vim-textobj-python' " af, if, ac, ic

" Plug 'tpope/vim-commentary' " commentary.vim: comment stuff out

" Tags
Plug 'xolox/vim-easytags' " Automated tag file generation and syntax highlighting of tags in Vim
Plug 'xolox/vim-misc' " Miscellaneous auto-load Vim scripts
Plug 'majutsushi/tagbar'

"Plug 'tpope/vim-vinegar.git'
if !s:running_windows
  Plug 'Valloric/YouCompleteMe', {'do': 'python2 ./install.py --clang-completer '}
  autocmd! User YouCompleteMe call youcompleteme#Enable()
endif
Plug 'tommcdo/vim-exchange'
"Plug 'dbext.vim' " 2.00  Provides database access to many DBMS (Oracle, Sybase, Microsoft, MySQL, DBI,..)
"Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-sleuth'
"
Plug 'simnalamburt/vim-mundo'

"Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'wellle/targets.vim'
Plug 'FSwitch'
Plug 'ryanoasis/vim-devicons'


" Latex
Plug 'lervag/vimtex'

" HTML/CSS
Plug 'tpope/vim-ragtag', { 'for': 'html'}
Plug 'othree/html5.vim', { 'for': 'html'}

" Ruby
Plug 'tpope/vim-bundler', { 'for': 'ruby'}
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby'}
Plug 'tpope/vim-rails', { 'for': 'ruby'}
Plug 'tpope/vim-endwise'
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee'}
Plug 'groenewege/vim-less', { 'for': 'less'}

" Clojure
Plug 'guns/vim-clojure-static', { 'for': 'clojure'} " Meikel Brandmeyer's excellent Clojure runtime files
Plug 'tpope/vim-fireplace', { 'for': 'clojure'} " fireplace.vim: Clojure REPL support
Plug 'tpope/vim-classpath', { 'for': 'clojure'} " classpath.vim: Set 'path' from the Java class path

" Python
Plug 'klen/python-mode', { 'for': 'python'}
Plug 'davidhalter/jedi-vim', { 'for': 'python'}

Plug 'danielmiessler/VimBlog'
Plug 'kennethzfeng/vim-raml' " RAML plugin for VIM

Plug 'diepm/vim-rest-console' " A REST console for Vim.

" Cmake
Plug 'jalcine/cmake.vim'

Plug 'kennethzfeng/vim-raml' " RAML plugin for VIM

" CSV
Plug 'chrisbra/csv.vim' " A Filetype plugin for csv files

"Plug 'gilligan/vim-lldb'
Plug 'critiqjo/lldb.nvim'

Plug 'idanarye/vim-vebugger'

"Plug 'vim-scripts/loremipsum'


" neobundle.vim (Lazy)
"Plug 'lambdalisue/vim-gista', {
"\ 'branch': 'develop',
"\ 'depends': [
"\    'Shougo/unite.vim',
"\ ],
"\ 'autoload': {
"\    'commands': ['Gista'],
"\    'mappings': '<Plug>(gista-',
"\    'unite_sources': 'gista',
"\}}
"Plug 'lambdalisue/vim-gista-unite'


call plug#end()
" }}}

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


syntax on

set background=dark
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='soft'
let g:gruvbox_italic=1
colorscheme gruvbox
"call togglebg#map("<F11>")
<<<<<<< Updated upstream
highlight Normal guibg=NONE ctermbg=NONE
=======
hi Normal guibg=NONE ctermbg=NONE
>>>>>>> Stashed changes

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
set wildmode=list:longest,full
set title
set relativenumber
set undofile
set showmode
set wildmenu
set laststatus=2
set scrolloff=5 " Keep 5 lines (top/bottom)
set scrolloff=5 " Keep 5 lines (top/bottom) for scope
set shortmess=aOstT " shortens messages to avoid 'press a key' prompt
set sidescrolloff=5 " Keep 5 lines at the size
set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

set splitright
set splitbelow


set breakindent
set breakindentopt+=sbr


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


set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

if has("spell")

  " turn spelling on by default
  "set spell
  " toggle spelling with F8 key
  nnoremap <leader>8 :set spell!<CR><Bar>:echo "Spell Check: " . strpart("OffOn", 3 * &spell, 3)<CR>

  " they were using white on white
  highlight PmenuSel ctermfg=black ctermbg=lightgray
  highlight SpellBad term=reverse ctermbg=1

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

" Mappings ---------------------------------------------------------------- {{{

cnoremap <c-a> <home>
cnoremap <c-e> <end>

vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()

nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>
nnoremap <Leader>ev :e  $MYVIMRC<CR>
nnoremap <Leader>eev :vsplit  $MYVIMRC<CR>
nnoremap <Leader>l :s/\.\ /\.\r/g<CR>:nohl<CR>
nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
"nnoremap <Leader>= mz:%!astyle -A4 -U -H -k3 -W1 -xe -f -xy -j -O -C -S<CR>`z<CR>k
nnoremap <Leader>= mzgg=G`z<CR>  " reindent
nnoremap <Leader>sf :FSHere<CR>

" Easy window navigation
"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l
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

" EXPERIMENT
"noremap <leader>[ :bprev<cr>
"noremap <leader>] :bnext<cr>
"noremap <leader>[ :tabprev<cr>
"noremap <leader>] :tabnext<cr>
"
noremap <silent> <leader><bs> :bprevious\|bdelete #<CR>
noremap <leader><leader><bs> :bdelete!<CR>
noremap <leader>3 :TagbarToggle<CR>
"noremap <leader>4 :NERDTreeToggle<CR>
nnoremap <leader>4 :<C-u>VimFiler<CR> 
nnoremap <leader>2 :<C-u>VimFilerExplorer<CR>
nnoremap <leader>7 :MundoToggle<CR>
" <F8> spell checking
nnoremap <F12> :set invpaste paste?<CR>
inoremap <F12> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F12>

nnoremap <leader>z zMzvzz


"noremap CN <esc>:lne<cr>
"noremap CP <esc>:lN<cr>
"noremap cn <esc>:cn<cr>
"noremap cp <esc>:cp<cr>
"inoremap <Esc> <Esc>`^
nnoremap H  g^
nnoremap L  g$
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
nnoremap Y y$

"inoremap <M-o> <C-O>o
"inoremap <M-O> <C-O>O
"inoremap <M-I>      <C-O>^
"inoremap <M-A>      <C-O>$

" easier moving of code blocks
vnoremap < <gv   " better indentation
vnoremap > >gv   " better indentation

" saving file
nnoremap <Leader>w :w<CR>

" copy & paste
vmap <Leader>y "+y
"vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

inoremap <c-f> <c-x><c-f>


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

" }}}

" Folding ----------------------------------------------------------------- {{{
set foldlevelstart=99
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
  au FileType c setlocal foldmethod=marker foldmarker={,} foldlevel=99
  "au FileType c setlocal equalprg=astyle\ -A4UHM60k3xefxyjOCS
  au FileType c setlocal equalprg=clang-format
  au FileType c setlocal tabstop=2 shiftwidth=2 expandtab softtabstop=2
augroup END

" }}}
" C++ {{{

augroup ft_c
  au!
  au FileType cpp setlocal foldmethod=marker foldmarker={,} foldlevel=99
  au FileType cpp set keywordprg=:term\ cppman
  "au FileType cpp setlocal equalprg=astyle\ -A4UHM60k3xefxyjOCS
  au FileType cpp setlocal equalprg=clang-format
  au FileType cpp setlocal tabstop=2 shiftwidth=2 expandtab softtabstop=2
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

augroup pandoc_syntax
  au! BufNewFile,BufFilePre,BufRead *.markdown,*.mdown,*.mkd,*.mkdn,*.mdwn,*.md   set filetype=markdown.pandoc
augroup END

augroup ft_markdown
  au!

  au FileType markdown setlocal foldlevel=1


  " Use <localleader>1/2/3 to add headings.
  au Filetype markdown nnoremap <buffer> <localleader>1 yypVr=:redraw<cr>
  au Filetype markdown nnoremap <buffer> <localleader>2 yypVr-:redraw<cr>
  au Filetype markdown nnoremap <buffer> <localleader>3 mzI#<space><ESC>`zll
  au Filetype markdown nnoremap <buffer> <localleader>4 mzI#<space><ESC>`z

  au Filetype markdown setlocal textwidth=79
  au Filetype markdown setlocal isfname+=32,&,(,)
  au Filetype markdown setlocal complete+=kspell
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

" nerdcommenter {{{
"let g:NERDAltDelims_cpp = 1
" }}}
" vimfiler {{{
"

let g:vimfiler_as_default_explorer = 1

let g:vimfiler_enable_clipboard = 0

call vimfiler#custom#profile('default', 'context', {
      \ 'safe' : 0,
      \ 'auto_expand' : 1,
      \ 'parent' : 0,
      \ })
"
" Like Textmate icons.
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = ' '
let g:vimfiler_readonly_file_icon = '✗'
let g:vimfiler_marked_file_icon = '✓'

" }}}
" netrw {{{

let g:loaded_netrwPlugin = 1
let g:netrw_winsize = -40



" }}}
" deoplete {{{
let g:deoplete#enable_at_startup = 1
let g:deoplete#disable_auto_complete = 1
"inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()
"inoremap <expr><C-h>
"\ deoplete#mappings#smart_close_popup()."\<C-h>"
"inoremap <expr><C-g>     deoplete#mappings#undo_completion()
"inoremap <expr><C-l>     deoplete#mappings#refresh()
" }}}
" airline {{{

let g:airline_powerline_fonts = 1
"let g:airline_theme='powerlineish'
"let g:airline_theme='luna'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0

let g:airline#extensions#branch#empty_message = "No SCM"
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#hunks#enabled = 0 


let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ }

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



hi User5 cterm=italic ctermfg=245 ctermbg=237 gui=italic guifg=#928374 guibg=#3c3836 " Comment        
hi User1 cterm=bold ctermfg=14 ctermbg=237 guifg=#40ffff guibg=#3c3836 " Identifier     


function! AirlineInit()
  "%5*%{expand('%:h')}/
  call airline#parts#define_raw('file2', "%#User1#%t")
  call airline#parts#define_raw('path2', "%#User5#%{expand('%:h')}/")
  let g:airline_section_c = airline#section#create(['%<','path2', 'file2',  'readonly'])
  let g:airline_section_z = airline#section#create(['%3p%%',  ' %L lines [%{winnr()}]'])
endfunction
autocmd User AirlineAfterInit call AirlineInit()

"}}}
" Gista {{{

"let g:gista#client#default_username = 'przemkovv'
let g:gista#update_on_write = 1
let g:gista#command#post#default_public = 1

" }}}
" Pymode {{{
let g:pymode_breakpoint = 0
let g:pymode_doc = 0
let g:pymode_doc_bind =''
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
" Secure Modelines {{{

let g:secure_modelines_allowed_items = [
      \ "textwidth",   "tw",
      \ "foldmethod",  "fdm",
      \ "foldnextmax",  "fdn",
      \ "foldlevel", "foldlevelstart",
      \ "spelllang",
      \ ]

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
" Local VIM RC {{{
let g:localvimrc_name = ".localvimrc"
let g:localvimrc_sandbox = 0
let g:localvimrc_persistent = 1
" }}}
" UltiSnips {{{
"
"
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:UltiSnipsUsePythonVersion = 2

" }}}
" Fugitive {{{
nnoremap <leader>gb :Gblame<Cr>
nnoremap <leader>gs :Gstatus<Cr>
nnoremap <leader>gc :Gcommit<Cr>
nnoremap <leader>gl :Glog<Cr>
nnoremap <leader>gw :Gwrite<Cr>
nnoremap <leader>gd :Gvdiff<Cr>
" }}}
" Unite {{{
let g:unite_prompt = '» '
let g:unite_source_history_yank_enable = 1

let g:unite_data_directory = "~/.unite"

if executable('ag')
  " Use ag (the silver searcher)
  " https://github.com/ggreer/the_silver_searcher
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
        \ '-i --vimgrep --hidden --ignore ' .
        \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
  let g:unite_source_grep_recursive_opt = ''
endif

"Like ctrlp.vim settings.
call unite#custom#profile('default', 'context', {
      \   'start_insert': 1,
      \   'winheight': 20,
      \   'direction': 'botright',
      \   'update-time': 200,
      \ })

" Using ag as recursive command.
let g:unite_source_rec_async_command =
      \ ['ag', '--follow', '--nocolor', '--nogroup',
      \  '--hidden', '-g', '']


"let g:unite_abbr_highlight = 'normal'
nnoremap <leader>r :<C-u>Unite -start-insert -no-resize grep:.<CR>
"nnoremap <leader>R :<C-u>Unite register<CR>
"nnoremap <leader>o :<C-u>Unite -auto-resize outline<CR>
nnoremap <leader>gg :<C-u>Unite -auto-resize gista<CR>

nnoremap <leader>f :<C-u>Unite -buffer-name=files   -start-insert file_rec/neovim<cr>
nnoremap <leader>F :<C-u>Unite -buffer-name=files   -start-insert file<cr>
nnoremap <leader>mr :<C-u>Unite -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>ma :<C-u>Unite -buffer-name=mapping     -start-insert mapping<cr>
nnoremap <leader>o :<C-u>Unite -buffer-name=outline -no-split -start-insert outline<cr>
"nnoremap <leader>y :<C-u>Unite-buffer-name=yank    history/yank<cr>
nnoremap <leader>b :<C-u>Unite -buffer-name=buffer  -start-insert buffer<cr>
nnoremap <leader>t :<C-u>Unite -buffer-name=tags  -start-insert tag<cr>
nnoremap <leader>q :<C-u>Unite -buffer-name=quickfix  -start-insert quickfix<cr>
nnoremap <leader>gh :<C-u>Unite -buffer-name=help  -start-insert help<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  imap <buffer> <Esc>     <Plug>(unite_exit)

  call unite#custom#source('buffer', 'converters', ['converter_file_directory'])
  " Use the fuzzy matcher for everything
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
  call unite#filters#sorter_default#use(['sorter_selecta'])
endfunction




" }}}
" neoinclue {{{
" }}}
" Tagbar {{{
let g:tagbar_left = 1
let g:tagbar_width = 33
let g:tagbar_compact = 1
" }}}
" VimTex {{{
let g:vimtex_fold_enabled = 0
let g:vimtex_view_method = 'zathura'
let g:vimtex_latexmk_progname = 'nvr'

let g:vimtex_quickfix_ignored_warnings = [
      \ 'Underfull',
      \ 'Overfull',
      \ 'specifier changed to',
      \ ]
" }}}
" Pandoc {{{
"let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
"let g:pandoc#filetypes#pandoc_markdown = 1
"let g:pandoc#after#modules#enabled = ["unite", "ultisnips"]
"let g:pandoc#formatting#textwidth = 79
"let g:pandoc#formatting#mode = "hA"
"let g:pandoc#command#autoexec_on_writes = 0
"let g:pandoc#command#autoexec_command = "Pandoc html -s"

"let g:instant_markdown_autostart = 0
" }}}
" Jedi {{{
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#completions_enabled = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"

let g:jedi#documentation_command = ''
" }}}
" Neomake {{{
autocmd! BufWritePost * Neomake
nnoremap <Leader>h :Neomake!<CR>
"let g:neomake_verbose=1
let g:neomake_open_list = 2
let g:neomake_place_signs = 1
let g:neomake_cpp_enabled_makers=['clangtidy']
"let g:neomake_cpp_enabled_makers=['clang', 'clangtidy']
"let g:neomake_cpp_clang_args = [ '-fsyntax-only', '-Wall', '-Wextra']
"'-std=c++14', '-fsyntax-only', '-Wextra', '-Wall', '-fsanitize=undefined',"-g"]
let g:neomake_cpp_clang_args = ['-std=c++1z', '-fsyntax-only', '-Wextra', '-Wall', '-fsanitize=undefined','-g']
" }}}
" Syntastic {{{
"let g:syntastic_cpp_auto_refresh_includes = 1
"let g:syntastic_cpp_compiler = 'clang++'
"let g:syntastic_cpp_compiler_options = '-std=gnu++11 -Wall'
""let g:syntastic_cpp_check_header = 1
"let g:syntastic_error_symbol='✗'
"let g:syntastic_warning_symbol='⚠'
"let g:syntastic_enable_highlighting=0
"let g:syntastic_auto_loc_list=1
"let g:syntastic_loc_list_height = 5
"let g:syntastic_always_populate_loc_list=1
"let g:syntastic_aggregate_errors = 1
" }}}
" EasyTags {{{
let g:easytags_auto_update = 1
let g:easytags_on_cursorhold = 1
let g:easytags_events = ['BufWritePost']
"let g:easytags_events = ['CursorHold']
set tags=tags,./tags,~/.vimtags
let g:easytags_dynamic_files = 2
let g:easytags_include_members = 0
let g:easytags_python_enabled = 1
let g:easytags_async = 1
let g:easytags_opts = ['--fields=+l']
" }}}
" YouCompleteMe {{{
let g:ycm_server_python_interpreter = '/usr/bin/python2'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_auto_trigger = 0

let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
let g:ycm_show_diagnostic_ui = 1
let g:ycm_server_log_level = 'debug'

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

let g:ycm_goto_buffer_command = 'same-buffer'
nnoremap <leader>jd :YcmCompleter GoTo<CR>

" }}}
" Vim ruby {{{
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1
let g:rubycomplete_load_gemfile = 1
" }}}
" Vim-notes {{{
let g:notes_directories = ['~/Documents/notes']
" }}}
" CSV {{{
let g:csv_autocmd_arrange = 1
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
" mrgin-top: 200px; -> daN -> margin-top: px;
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


