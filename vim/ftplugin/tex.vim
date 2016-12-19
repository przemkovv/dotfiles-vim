" this is mostly a matter of taste. but LaTeX looks good with just a bit
" of indentation.
set sw=4
" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:

set number
set numberwidth=5
set spell
set spelllang=en,pl

setlocal wrap linebreak textwidth=0
" setlocal showbreak=…
let &showbreak='↳ '

" let maplocalleader = ",,"
