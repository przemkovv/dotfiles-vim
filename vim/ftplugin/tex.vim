" this is mostly a matter of taste. but LaTeX looks good with just a bit
" of indentation.
set sw=4
" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:

let g:Tex_DefaultTargetFormat = 'pdf'
" A comma seperated list of formats which need multiple compilations to be
" correctly compiled.
"let g:Tex_MultipleCompileFormats = 'dvi'
"
let g:Tex_ViewRule_pdf = 'xdg-open'
let b:atp_Viewer = 'xdg-open'
"inoremap <space><space> <CR>
set number
set numberwidth=5
set spell
set spelllang=en,pl
setlocal wrap linebreak textwidth=79
setlocal showbreak=…

imap <M-j> <Plug>TexJMotionForward
nmap <M-j> <Plug>TexJMotionForward
imap <M-k> <Plug>TexJMotionBackward
nmap <M-k> <Plug>TexJMotionBackward

let g:atp_tab_map = 1
let maplocalleader = ",,"
let g:syntastic_always_populate_loc_list=1
let g:syntastic_check_on_open = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_loc_list_height = 5
