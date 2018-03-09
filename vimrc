" vim: set fdm=marker
" vim: set foldlevel=0

let s:running_windows = has("win16") || has("win32") || has("win64")

syntax enable

let s:editor_root=expand("~/.vim")

" Plugins -------------------------------------------------------------------- {{{

" Setting up plugins {{{
if empty(glob(s:editor_root . '/autoload/plug.vim'))
  autocmd VimEnter * echom "Downloading and installing vim-plug..."
  silent execute "!curl -fLo " . s:editor_root . "/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged/')
" }}}

" Colorschemes {{{
Plug 'morhetz/gruvbox'
Plug 'romainl/Apprentice'
Plug 'rakr/vim-two-firewatch'
Plug 'lifepillar/vim-solarized8'
Plug 'rakr/vim-one'
Plug 'iCyMind/NeoSolarized'
Plug 'NLKNguyen/papercolor-theme'
Plug 'lsdr/monokai'
Plug 'tomasr/molokai'
Plug 'whatyouhide/vim-gotham'
Plug 'sjl/badwolf'
Plug 'flazz/vim-colorschemes'
Plug 'felixhummel/setcolors.vim'
" }}}

" File navigation {{{
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'vim-scripts/FSwitch'
" }}}

" To sort {{{
Plug 'mbbill/undotree'
" Plug 'Shougo/vimproc', { 'do' : 'make' }

Plug 'tpope/vim-dispatch' " dispatch.vim: asynchronous build and test dispatcher
Plug 'radenling/vim-dispatch-neovim'

Plug 'tpope/vim-unimpaired'

Plug 'ciaranm/securemodelines'
Plug 'embear/vim-localvimrc'
Plug 'mhinz/vim-signify'

Plug 'bronson/vim-trailing-whitespace'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'chrisbra/unicode.vim'
Plug 'sbdchd/neoformat'

" }}}

" Status bar {{{
Plug 'vim-airline/vim-airline'
" }}}

" Search {{{
Plug 'justinmk/vim-sneak'
" }}}

" Text Objects {{{
Plug 'wellle/targets.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-function' " af, if, aF, iF
Plug 'kana/vim-textobj-fold' " az, iz
" }}}

" Tags {{{
Plug 'majutsushi/tagbar'
" }}}

" Completion {{{
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': './install.sh'}
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'Shougo/echodoc.vim'
Plug 'Shougo/context_filetype.vim'
Plug 'mhartington/deoplete-typescript', { 'for': 'typescript' }
Plug 'eagletmt/neco-ghc'

" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/vim-lsp'
" }}}

" Snippets {{{
Plug 'SirVer/ultisnips'  | Plug 'honza/vim-snippets'
Plug 'dawikur/algorithm-mnemonics.vim'
" }}}

" Database {{{
Plug 'lifepillar/pgsql.vim', { 'for': 'pgsql' }
Plug 'vim-scripts/dbext.vim' " 2.00  Provides database access to many DBMS (Oracle, Sybase, Microsoft, MySQL, DBI,..)
" }}}

" Dev Tools {{{
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv'
Plug 'Shougo/vinarise.vim'
Plug 'diepm/vim-rest-console' " A REST console for Vim.
Plug 'benekastah/neomake'

Plug 'vim-scripts/DoxygenToolkit.vim'
" }}}

" Filetype specific {{{

Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp'}
Plug 'vim-jp/vim-cpp', { 'for': 'cpp'}
Plug 'IN3D/vim-raml' " RAML plugin for VIM
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': 'markdown' }
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'wannesm/wmgraphviz.vim'
Plug 'chrisbra/csv.vim', { 'for': 'csv'}  " A Filetype plugin for csv files

" HTML/CSS/Javascript/Typescript {{{
Plug 'tpope/vim-ragtag', { 'for': 'html'}
Plug 'othree/html5.vim', { 'for': 'html'}

Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
" }}}
" Python {{{
Plug 'klen/python-mode', { 'for': 'python'}
Plug 'davidhalter/jedi-vim', { 'for': 'python'}
" }}}
" Haskell {{{
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'enomsg/vim-haskellConcealPlus', { 'for': 'haskell' }
Plug 'bitc/vim-hdevtools', { 'for': 'haskell' }
" }}}
" }}}

call plug#end()
" }}}

filetype on
filetype plugin indent on

" Colors {{{
syntax on

set termguicolors
set background=dark

augroup UserColors
  autocmd!
  autocmd ColorScheme * highlight User5 cterm=italic ctermfg=245 gui=italic guifg=#928374 " Comment
  autocmd ColorScheme * highlight User1 cterm=bold ctermfg=14 guifg=#40ffff " Identifier
  autocmd ColorScheme * highlight PmenuSel ctermfg=black ctermbg=lightgray
  autocmd ColorScheme * highlight SpellBad term=reverse ctermbg=1
augroup END

let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='soft'
let g:gruvbox_italic=1
"colorscheme gruvbox
colorscheme apprentice

let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1
" colorscheme monokai
" colorscheme twilight


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
" colorscheme NeoSolarized
" colorscheme gotham

" }}}

" Vim jump to the last position when reopening a file
augroup GoToLastPosition
  autocmd!
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal g'\"" | endif
augroup END
" http://vim.wikia.com/wiki/Avoid_scrolling_when_switch_buffers {{{

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
augroup SaveWindowView
  autocmd!
  autocmd BufLeave * call AutoSaveWinView()
  autocmd BufEnter * call AutoRestoreWinView()
augroup END
" }}}

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search

if exists('&inccommand')
  set inccommand=nosplit
endif

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
set undofile
set showmode
set wildmenu
set laststatus=2
set scrolloff=5 " Keep 5 lines (top/bottom)
set shortmess=aOstT " shortens messages to avoid 'press a key' prompt
set sidescrolloff=5 " Keep 5 lines at the size
set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
set report=0

set list listchars=trail:•,tab:»·

set splitright
set splitbelow

set breakindent
set breakindentopt+=sbr

set tags=tags,./tags,~/.vimtags
set completeopt+=longest

" Set the command window height to 2 lines, to avoid many cases of having to
" press <Enter> to continue
set cmdheight=2

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Vim directories settings {{{
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
" }}}


let mapleader = "\<Space>"
let maplocalleader = ","
set colorcolumn=81

set nocp
filetype plugin on

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

set tabstop=4
set shiftwidth=2
set expandtab
set softtabstop=2

if has("spell")
  " limit it to just the top 10 items
  set sps=best,10
  set spelllang=en,pl
endif

set number
set numberwidth=5
set relativenumber
set cursorline

" Number line settings {{{
" --------------------------------------------------------------------------------
augroup NumberLines
  autocmd!
  autocmd FocusLost * set norelativenumber
  autocmd WinLeave * set norelativenumber
  autocmd InsertEnter * set norelativenumber

  autocmd FocusGained * set relativenumber
  autocmd WinEnter * set relativenumber
  autocmd InsertLeave * set relativenumber
augroup END
" }}}

" Automatically create directories on save {{{
fun! <SID>AutoMakeDirectory()
  let s:directory = expand("<afile>:p:h")
  if !isdirectory(s:directory)
    call mkdir(s:directory, "p")
  endif
endfun

augroup MakeDirectoryOnSave
  autocmd!
  autocmd BufWritePre,FileWritePre * :call <SID>AutoMakeDirectory()
augroup END
" }}}

if $DISPLAY =~ '^localhost:' || $DISPLAY == ''
  set clipboard=autoselect,exclude:.*
endif

set switchbuf=useopen ",usetab,newtab
set showtabline=1
set tabpagemax=15

command! -nargs=+ -complete=file_in_path -bar Grep silent! grep! <args> | redraw!
set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column\ --vimgrep\ --ignore\ '.git'

" Mappings ---------------------------------------------------------------- {{{

nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>
nnoremap <Leader>ev :e  $MYVIMRC<CR>
nnoremap <Leader>eev :vsplit  $MYVIMRC<CR>
nnoremap <Leader>l :s/\.\ /\.\r/g<CR>:nohl<CR>
nnoremap <C-J> i<CR><Esc>k$
nnoremap <silent> <C-L> :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr>:sign unplace *<cr><c-l>

" reindent
nnoremap <Leader>= :keepjumps normal mzgg=Gg`zzz<CR>
nnoremap <Leader>sf :FSHere<CR>

" Window nagiating {{{
nnoremap    <M-k>       <C-W>k
nnoremap    <M-j>       <C-W>j
nnoremap    <M-l>       <C-W>l
nnoremap    <M-h>       <C-W>h
" }}}

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
" }}}

noremap <silent> <leader><bs> :bprevious\|bdelete #<CR>
noremap <leader><leader><bs> :bdelete!<CR>
noremap <leader>3 :TagbarToggle<CR>
nnoremap <leader>4 :<C-u>NERDTreeToggle<CR>
nnoremap <leader>7 :UndotreeToggle<CR>
nnoremap <F12> :set invpaste paste?<CR>
inoremap <F12> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F12>

nnoremap <leader>z zMzvzz
nnoremap <leader>ss O//<esc>70A-<esc>

nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
nnoremap Y y$

" better indentation
xnoremap < <gv
xnoremap > >gv

" saving file {{{
nnoremap <Leader>w :w<CR>
nnoremap <Leader>W :wa<CR>
" }}}

" copy & paste {{{
vmap <Leader>y "+y
"vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
" }}}

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
"
nnoremap n nzzzv
nnoremap N Nzzzv

nnoremap <leader>q :cclose<bar>lclose<cr>

" Todo {{{
function! s:todo() abort
  let entries = []
  for cmd in ['git grep -n -e "TODO(" -e "FIXME(" -e "BUG(" -e "XXX(" 2> /dev/null',
        \ 'grep -rn -e TODO -e FIXME -e BUG -e XXX * 2> /dev/null']
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
endfunction
set foldtext=MyFoldText()
" }}}

" }}}
" Filetype-specific ------------------------------------------------------- {{{

" QuickFix {{{

augroup ft_quickfix
  au!
  au FileType qf wincmd J
  au Filetype qf setlocal colorcolumn=0 nolist nocursorline nowrap tw=0
augroup END

" }}}
" Vim {{{

augroup ft_vim
  au!
  au FileType vim setlocal foldmethod=marker
  au FileType help setlocal textwidth=78
  au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END

" }}}

" }}}

" Plugin settings --------------------------------------------------------- {{{

" Doxygen {{{
let g:DoxygenToolkit_authorName="Przemysław Walkowiak <przemkovv@gmail.com>"
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1
" }}}
" undotree {{{
let g:undotree_WindowLayout = 2
let g:undotree_SplitWidth = 33
" }}}
" nerdcommenter {{{
let g:NERDSpaceDelims = 1
" }}}
" netrw {{{
let g:loaded_netrwPlugin = 1
let g:netrw_winsize = -40
" }}}
" airline {{{

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#show_buffers = 0

let g:airline#extensions#vimtex#enabled = 1

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


function! AirlineInit()
  call airline#parts#define_raw('file2', "%#User1#%t %m")
  call airline#parts#define_raw('path2', "%{expand('%:h')}/")
  let g:airline_section_c = airline#section#create(['%<','path2', 'file2',  'readonly'])

  let g:airline_section_y = airline#section#create(['%{airline#util#wrap(airline#parts#filetype(),0)}'])
  " let g:airline_section_z = airline#section#create(['%3p%%',  ' %c:%l/%L [%{winnr()}]'])
  let g:airline_section_z = airline#section#create(['%3p%%',  ' %c:%l/%L'])
endfunction

augroup Airline
  autocmd!
  autocmd User AirlineAfterInit call AirlineInit()
augroup END

let g:airline#extensions#whitespace#trailing_format = 'tr[%s]'
let g:airline#extensions#whitespace#mixed_indent_format = 'mi[%s]'
let g:airline#extensions#whitespace#long_format = 'long[%s]'
let g:airline#extensions#whitespace#mixed_indent_file_format = 'mi[%s]'

"}}}
" dbext {{{
let g:dbext_default_usermaps = 0
vnoremap  <localleader>se :DBExecVisualSQL<CR>
vnoremap  <localleader>st :DBSelectFromTable<CR>
nnoremap  <localleader>se :DBExecSQLUnderCursor<CR>
nnoremap  <localleader>slc :DBListColumn<CR>
nnoremap  <localleader>sdt :DBDescribeTable<CR>
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

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:UltiSnipsUsePythonVersion = 2
" }}}
" Fugitive {{{
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

" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

function! s:build_location_list(lines)
  call setloclist(0, map(copy(a:lines), '{ "filename": v:val }'))
  lopen
  ll
endfunction

let g:fzf_action = {
      \ 'ctrl-q': function('s:build_location_list'),
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }
"
" }}}
" Tagbar {{{
let g:tagbar_left = 1
let g:tagbar_width = 33
let g:tagbar_compact = 1
" }}}
" Neomake {{{

nnoremap <Leader>h :Neomake!<CR>
nnoremap <Leader>H :Neomake<CR>
"let g:neomake_verbose=1
let g:neomake_open_list = 2
let g:neomake_place_signs = 1
let g:neomake_verbose = 0
let g:neomake_ft_maker_remove_invalid_entries = 1


function! MyOnNeomakeJobFinished() abort
  let context = g:neomake_hook_context
  echom printf('The job for maker %s exited non-zero: %s',
        \ context.jobinfo.maker.name, context.jobinfo.exit_code)
endfunction
augroup my_neomake_hooks
  au!
  autocmd User NeomakeJobFinished call MyOnNeomakeJobFinished()
augroup END

" }}}
" LanguageClient-neovim {{{
let g:LanguageClient_diagnosticsList = "Location"
let g:LanguageClient_serverCommands = {
      \ 'python': ['pyls'],
      \ 'cpp': ['cquery','--language-server']
      \ }
let g:LanguageClient_loadSettings = 1
let g:LanguageClient_rootMarkers = {
      \ 'cpp': ['compile_commands.json', 'build'],
      \ }
" let g:LanguageClient_loggingLevel='DEBUG'
augroup lsp_client
  autocmd!
  autocmd FileType python,cpp,c  nnoremap <buffer> <silent> K :call LanguageClient_textDocument_hover()<CR>
  autocmd FileType python,cpp,c  nnoremap <buffer> <silent> gd :call LanguageClient_textDocument_definition()<CR>zz
  autocmd FileType python,cpp,c  nnoremap <buffer> <silent> <leader>d :call LanguageClient_textDocument_references()<CR>
  autocmd FileType python,cpp,c  nnoremap <buffer> <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
augroup END

augroup LanguageClient_config
  au!
  au BufEnter * let b:Plugin_LanguageClient_started = 0
  au User LanguageClientStarted setl signcolumn=yes
  au User LanguageClientStarted let b:Plugin_LanguageClient_started = 1
  au User LanguageClientStopped setl signcolumn=auto
  au User LanguageClientStopped let b:Plugin_LanguageClient_stopped = 0
  au CursorMoved * if b:Plugin_LanguageClient_started | call LanguageClient_textDocument_hover() | endif
augroup END

" }}}
"
" deoplete {{{
let g:deoplete#enable_at_startup =1
let g:deoplete#disable_auto_complete = 1
let g:deoplete#enable_smart_case =1

let g:echodoc_enable_at_startup = 1
let g:deoplete#tag#cache_limit_size = 500000
" let g:deoplete#auto_refresh_delay = 150

inoremap <silent><expr><C-k> deoplete#mappings#manual_complete()
inoremap <expr><C-l>     deoplete#refresh()

" Use head matcher instead of fuzzy matcher
call deoplete#custom#set('_', 'matchers', ['matcher_full_fuzzy'])
let g:deoplete#ignore_sources = ['around']
" call deoplete#custom#set('ultisnips', 'rank', 1000)

if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif

let g:deoplete#omni#input_patterns.tex = '\\(?:'
      \ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
      \ . '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
      \ . '|hyperref\s*\[[^]]*'
      \ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
      \ . '|(?:include(?:only)?|input)\s*\{[^}]*'
      \ . '|\w*(gls|Gls|GLS)(pl)?\w*(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
      \ . '|includepdf(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . '|includestandalone(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . '|usepackage(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . '|documentclass(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . '|\w*'
      \ .')'


" inoremap <silent><expr><CR> pumvisible() ? deoplete#mappings#close_popup()."\<Plug>(neosnippet_expand_or_jump)" : "\<CR>"
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


