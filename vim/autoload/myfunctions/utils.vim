
function! myfunctions#utils#Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

" In user vimrc
function! myfunctions#utils#UpdateRPlugins(info)
  if has('nvim')
    silent UpdateRemotePlugins
  endif
endfunction

" Automatically create directories on save {{{
function! myfunctions#utils#AutoMakeDirectory()
  let s:directory = expand("<afile>:p:h")
  if !isdirectory(s:directory)
    call mkdir(s:directory, "p")
  endif
endfun
