
" let b:fswitchdst = 'cpp,h,hpp' 
let b:fswitchlocs = '.'
setlocal foldmethod=marker foldmarker={,} foldlevel=99
setlocal keywordprg=:term\ cppman
setlocal equalprg=clang-format\ -assume-filename=%
setlocal tabstop=2 shiftwidth=2 expandtab softtabstop=2

" vim-cpp-enhanced-highlight {{{
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_member_variable_highight = 1
let g:cpp_concepts_highlights = 1
" }}}
