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
Plug 'romainl/Apprentice'
Plug 'rakr/vim-two-firewatch'
Plug 'lifepillar/vim-solarized8'
Plug 'rakr/vim-one'
Plug 'iCyMind/NeoSolarized'
Plug 'NLKNguyen/papercolor-theme'

"Plug 'justinmk/vim-dirvish'
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/unite.vim'
Plug 'ervandew/supertab'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'Shougo/vimproc', { 'do' : 'make' }

Plug 'tpope/vim-dispatch' " dispatch.vim: asynchronous build and test dispatcher
Plug 'tpope/vim-unimpaired'

Plug 'benekastah/neomake'

Plug 'tpope/vim-fugitive'
Plug 'ciaranm/securemodelines'
Plug 'vim-scripts/utl.vim'
Plug 'embear/vim-localvimrc'
Plug 'mhinz/vim-signify'
Plug 'vim-pandoc/vim-pandoc-syntax'


"Plug 'dhruvasagar/vim-table-mode'
Plug 'bronson/vim-trailing-whitespace'


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
"Plug 'kana/vim-textobj-line' " al, il
"Plug 'kana/vim-textobj-indent' " ai, ii, aI, iI
Plug 'kana/vim-textobj-function' " af, if, aF, iF
"Plug 'lucapette/vim-textobj-underscore' " a_, i_
"Plug 'bps/vim-textobj-python' " af, if, ac, ic

" Tags
Plug 'ludovicchabant/vim-gutentags'
"Plug 'c0r73x/neotags.nvim'
Plug 'majutsushi/tagbar'
Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'vim-scripts/DoxygenToolkit.vim'

if !s:running_windows
  Plug 'Valloric/YouCompleteMe', {'do': 'python2 ./install.py --clang-completer '}
endif

"Plug 'tommcdo/vim-exchange'
"Plug 'dbext.vim' " 2.00  Provides database access to many DBMS (Oracle, Sybase, Microsoft, MySQL, DBI,..)
"Plug 'terryma/vim-expand-region'
"Plug 'tpope/vim-sleuth'
"
Plug 'mbbill/undotree'

" Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
" Plug 'tpope/vim-commentary'
Plug 'wellle/targets.vim'
Plug 'FSwitch'
"Plug 'ryanoasis/vim-devicons'


" Latex
Plug 'lervag/vimtex', { 'for': 'tex' }

" dot - graphviz
Plug 'wannesm/wmgraphviz.vim'

" HTML/CSS
Plug 'tpope/vim-ragtag', { 'for': 'html'}
Plug 'othree/html5.vim', { 'for': 'html'}

Plug 'leafgarland/typescript-vim'
"Plug 'magarcia/vim-angular2-snippets'


" Ruby
"Plug 'tpope/vim-bundler', { 'for': 'ruby'}
"Plug 'vim-ruby/vim-ruby', { 'for': 'ruby'}
"Plug 'tpope/vim-rails', { 'for': 'ruby'}
"Plug 'tpope/vim-endwise'
"Plug 'kchmck/vim-coffee-script', { 'for': 'coffee'}
"Plug 'groenewege/vim-less', { 'for': 'less'}

"" Clojure
"Plug 'guns/vim-clojure-static', { 'for': 'clojure'} " Meikel Brandmeyer's excellent Clojure runtime files
"Plug 'tpope/vim-fireplace', { 'for': 'clojure'} " fireplace.vim: Clojure REPL support
"Plug 'tpope/vim-classpath', { 'for': 'clojure'} " classpath.vim: Set 'path' from the Java class path

" Python
Plug 'klen/python-mode', { 'for': 'python'}
Plug 'davidhalter/jedi-vim', { 'for': 'python'}

Plug 'IN3D/vim-raml' " RAML plugin for VIM
"Plug 'kennethzfeng/vim-raml' " RAML plugin for VIM
"
Plug 'diepm/vim-rest-console' " A REST console for Vim.

" Cmake
Plug 'jalcine/cmake.vim'


" CSV
Plug 'chrisbra/csv.vim' " A Filetype plugin for csv files

"Plug 'critiqjo/lldb.nvim'

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
"colorscheme gruvbox
"colorscheme apprentice

let g:solarized_term_italics =1
"let g:solarized_termtrans= 1
"colorscheme solarized8_dark_flat
" colorscheme PaperColor

let g:neosolarized_contrast = "high"
let g:neosolarized_visibility = "low"
"let g:neosolarized_termtrans= 1

" If you wish to enable/disable NeoSolarized from displaying bold, underlined or italicized
" typefaces, simply assign 1 or 0 to the appropriate variable. Default values:
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 1
colorscheme NeoSolarized

"highlight Normal guibg=NONE ctermbg=NONE

if has("autocmd")
  " Uncomment the following to have Vim jump to the last position when
  " reopening a file
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal g'\"" | endif


endif


" Save current view settings on a per-window, per-buffer basis.
function! AutoSaveWinView()
  if !exists("w:SavedBufView")
    let w:SavedBufView = {}
  endif
  let w:SavedBufView[bufnr("%")] = winsaveview()
endfunction

" Restore current view settings.
function! AutoRestoreWinView()
  let buf = bufnr("%")
  if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
    let v = winsaveview()
    let atStartOfFile = v.lnum == 1 && v.col == 0
    if atStartOfFile && !&diff
      call winrestview(w:SavedBufView[buf])
    endif
    unlet w:SavedBufView[buf]
  endif
endfunction

" When switching buffers, preserve window view.
autocmd BufLeave * call AutoSaveWinView()
autocmd BufEnter * call AutoRestoreWinView()

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
set wildignorecase
set wildmode=list:longest,full
set title
set relativenumber
set undofile
set showmode
set wildmenu
set laststatus=2
set scrolloff=5 " Keep 5 lines (top/bottom)
set shortmess=aOstT " shortens messages to avoid 'press a key' prompt
set sidescrolloff=5 " Keep 5 lines at the size
set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

set list listchars=trail:•,space:·,tab:»·

set splitright
set splitbelow

set breakindent
set breakindentopt+=sbr

set tags=tags,./tags,~/.vimtags

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
let maplocalleader = ","
set colorcolumn=81

let g:pymode_rope = 0

set nocp
filetype plugin on
au BufNewFile,BufRead *.flex set filetype=lex

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

let g:tex_indent_items=1
let g:tex_flavor='latex'


set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

if has("spell")

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


command! -nargs=+ -complete=file_in_path -bar Grep silent! grep! <args> | redraw!
set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column\ --vimgrep\ --ignore\ '.git'

" Mappings ---------------------------------------------------------------- {{{

cnoremap <c-a> <home>
cnoremap <c-e> <end>

nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>
nnoremap <Leader>ev :e  $MYVIMRC<CR>
nnoremap <Leader>eev :vsplit  $MYVIMRC<CR>
nnoremap <Leader>l :s/\.\ /\.\r/g<CR>:nohl<CR>
nnoremap <silent> <C-L> :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>
"nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
nnoremap <Leader>= mzgg=G`zzz<CR>  " reindent
nnoremap <Leader>sf :FSHere<CR>

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

noremap <silent> <leader><bs> :bprevious\|bdelete #<CR>
noremap <leader><leader><bs> :bdelete!<CR>
noremap <leader>3 :TagbarToggle<CR>
nnoremap <leader>4 :<C-u>VimFiler<CR>
nnoremap <leader>2 :<C-u>VimFilerExplorer<CR>
nnoremap <leader>7 :UndotreeToggle<CR>
nnoremap <F12> :set invpaste paste?<CR>
inoremap <F12> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F12>

nnoremap <leader>z zMzvzz

nnoremap H  g^
nnoremap L  g$
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
nnoremap Y y$

" easier moving of code blocks
vnoremap < <gv   " better indentation
vnoremap > >gv   " better indentation

" saving file
nnoremap <Leader>w :w<CR>
nnoremap <Leader>W :wa<CR>

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

nnoremap <leader>q :cclose<bar>lclose<cr>

" ----------------------------------------------------------------------------
" Todo
" ----------------------------------------------------------------------------
function! s:todo() abort
  let entries = []
  for cmd in ['git grep -n -e TODO -e FIXME -e XXX 2> /dev/null',
        \ 'grep -rn -e TODO -e FIXME -e XXX * 2> /dev/null']
    let lines = split(system(cmd), '\n')
    if v:shell_error != 0 | continue | endif
    for line in lines
      let [fname, lno, text] = matchlist(line, '^\([^:]*\):\([^:]*\):\(.*\)')[1:3]
      call add(entries, { 'filename': fname, 'lnum': lno, 'text': text })
    endfor
    break
  endfor

  if !empty(entries)
    call setqflist(entries)
    copen
  endif
endfunction
command! Todo call s:todo()


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

" QuickFix {{{
au FileType qf wincmd J
" }}}
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
  autocmd BufRead,BufNewFile *.h,*.cpp set filetype=cpp.doxygen
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
  au FileType javascript setlocal equalprg=js-beautify\ --stdin

augroup END
" }}}
" Typescript {{{
augroup ft_typescript
  au!

  au FileType typescript setlocal foldmethod=marker
  au FileType typescript setlocal foldmarker={,}
  au FileType typescript setlocal equalprg=tsfmt\ --stdin

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


  "au FileType vim setlocal foldlevelstart=1
  au FileType vim setlocal foldmethod=marker
  au FileType help setlocal textwidth=78
  au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END

" }}}
" JSON {{{
augroup ft_json
  au!

  au FileType json set shiftwidth=2
augroup END

" }}}

augroup ft_yaml
  au!

  au FileType yaml set shiftwidth=2
  au FileType raml set shiftwidth=2
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

" neotags.nvim {{{
let g:neotags_run_ctags = 0
" Doxygen {{{
 let g:DoxygenToolkit_authorName="Przemysław Walkowiak <przemkovv@gmail.com>"
 let g:DoxygenToolkit_briefTag_funcName="yes" 
 let g:doxygen_enhanced_color=1
" }}}
" undotree {{{
let g:undotree_WindowLayout = 2
" }}}
" vim-table-mode {{{
"let g:table_mode_disable_mappings = 1
let g:table_mode_map_prefix = "<localleader>t"
" }}}
" vim-cpp-enhanced-highlight {{{
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
" }}}
" nerdcommenter {{{
"let g:NERDAltDelims_cpp = 1
let g:NERDSpaceDelims = 1
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
" airline {{{

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#show_buffers = 0

let g:airline#extensions#branch#empty_message = "No SCM"
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#hunks#enabled = 0
let g:airline_inactive_collapse = 1
let g:airline_detect_modified=0


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



hi User5 cterm=italic ctermfg=245 gui=italic guifg=#928374 " Comment
hi User1 cterm=bold ctermfg=14 guifg=#40ffff " Identifier


function! AirlineInit()
  "%5*%{expand('%:h')}/
  call airline#parts#define_raw('file2', "%#User1#%t %m")
  call airline#parts#define_raw('path2', "%{expand('%:h')}/")
  let g:airline_section_c = airline#section#create(['%<','path2', 'file2',  'readonly'])


  let g:airline_section_x = airline#section#create(['%{airline#extensions#tagbar#currenttag()}'])
  let g:airline_section_y = airline#section#create(['%{airline#util#wrap(airline#parts#filetype(),0)}'])
  let g:airline_section_z = airline#section#create(['%3p%%',  ' %c:%l/%L [%{winnr()}]'])

endfunction
autocmd User AirlineAfterInit call AirlineInit()

let g:airline#extensions#whitespace#trailing_format = 'tr[%s]'
let g:airline#extensions#whitespace#mixed_indent_format = 'mi[%s]'
let g:airline#extensions#whitespace#long_format = 'long[%s]'
let g:airline#extensions#whitespace#mixed_indent_file_format = 'mi[%s]'

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
omap ic <plug>(signify-motion-inner-pending)
xmap ic <plug>(signify-motion-inner-visual)
omap ac <plug>(signify-motion-outer-pending)
xmap ac <plug>(signify-motion-outer-visual)
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

" fzf {{{
"
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 0
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
let $FZF_DEFAULT_OPTS .= ' --inline-info'
let g:fzf_launcher = 'termite --geometry 120x30 -e "sh -c %s"'
nnoremap <leader>r :Ag<CR>
nnoremap <leader>R :Ag <C-r>=expand('<cword>')<CR><CR>

nnoremap <leader>? :Helptags<cr>
nnoremap <leader>f :Files<cr>
nnoremap <leader>mr :History<cr>
nnoremap <leader>ma :Maps<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>t :BTags<cr>
nnoremap <leader>T :Tags<cr>
nnoremap <leader>ag :Ag <C-R><C-W><cr>
nnoremap <leader>AG :Ag <C-R><C-A><cr>

let g:fzf_files_options=' --bind alt-a:select-all,alt-d:deselect-all '
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
"
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
"autocmd! BufWritePost * Neomake
nnoremap <Leader>h :Neomake!<CR>
nnoremap <Leader>H :Neomake<CR>
"let g:neomake_verbose=1
let g:neomake_open_list = 2
let g:neomake_place_signs = 1
let g:neomake_cpp_enabled_makers=['clangtidy']
"let g:neomake_typescript_enabled_makers=['tsc', 'tslint']
"let g:neomake_typescript_tsc_maker = {
"\ 'args': ['--module', 'system', '--target', 'ES5', '--experimentalDecorators', '--noEmit']}
"let g:neomake_verbose = 3
"let g:neomake_logfile='neomake.log'
"let g:neomake_cpp_enabled_makers=['clang', 'clangtidy']
"let g:neomake_cpp_clang_args = [ '-fsyntax-only', '-Wall', '-Wextra']
"'-std=c++14', '-fsyntax-only', '-Wextra', '-Wall', '-fsanitize=undefined',"-g"]
let g:neomake_cpp_clang_args = ['-std=c++1z', '-fsyntax-only', '-Wextra', '-Wall', '-fsanitize=undefined','-g']

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


