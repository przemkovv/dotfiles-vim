
" An action can be a reference to a function that processes selected lines
function! myfunctions#fzf#build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

function! myfunctions#fzf#build_location_list(lines)
  call setloclist(0, map(copy(a:lines), '{ "filename": v:val }'))
  lopen
  ll
endfunction

function! myfunctions#fzf#FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let height = &lines - 6
  let width = float2nr(&columns - (&columns * 2 / 10))
  " let width = float2nr(150)
  let horizontal = float2nr((&columns - width) / 2)
  let vertical = 1

  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction

