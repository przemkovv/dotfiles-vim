
" use ghc functionality for haskell files
" au Bufenter *.hs compiler ghc
let g:haddock_browser = "w3m"
" let g:haskellmode_completion_ghc = 0
setlocal omnifunc=necoghc#omnifunc
setlocal equalprg=hindent\ --style\ cramer

" haskell-vim {{{
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
" }}}
