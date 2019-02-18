
" let b:fswitchdst = 'cpp,h,hpp' 
let b:fswitchlocs = '.'
setlocal foldmethod=marker foldmarker={,} foldlevel=99
setlocal keywordprg=:term\ cppman
setlocal equalprg=clang-format\ -assume-filename=%
setlocal formatexpr=LanguageClient#textDocument_rangeFormatting()
setlocal tabstop=2 shiftwidth=2 expandtab softtabstop=2

" vim-cpp-enhanced-highlight {{{
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_member_variable_highight = 1
let g:cpp_concepts_highlights = 1
" }}}

function! FormatFile()
  let l:lines="all"
  pyf /usr/share/clang/clang-format.py
endfunction
function! FormatSelection()
  pyf /usr/share/clang/clang-format.py
endfunction

nnoremap <buffer> <Leader>= :call FormatFile()<CR>
vnoremap <buffer> <Leader>= :call FormatSelection()<CR>

augroup ft_cpp_include
  autocmd!
  autocmd BufRead,BufNewFile /usr/include/c++/* set syntax=cpp
augroup END
