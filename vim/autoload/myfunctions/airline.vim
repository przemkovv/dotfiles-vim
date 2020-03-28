
function! LspError() abort
  let errorCount = 0
  if luaeval('vim.lsp.buf.server_ready()')
    let errorCount = luaeval("vim.lsp.util.buf_diagnostics_count(\"Error\")")
  endif
  return 'E: '.errorCount
endfunction

function! LspWarning() abort
  let warningCount = 0
  if luaeval('vim.lsp.buf.server_ready()')
    let warningCount = luaeval("vim.lsp.util.buf_diagnostics_count(\"Warning\")")
  endif
  return 'W: '.warningCount
endfunction

function! LspStatus() abort
  let sl = ''
  if luaeval('vim.lsp.buf.server_ready()')
    let sl.='LSP: on'
  else
    let sl.='LSP: off'
  endif
  return sl
endfunction

function! CMakeStat()
  let l:cmake_build_dir = get(g:, 'cmake_build_dir', 'build')
  let l:build_dir = finddir(l:cmake_build_dir, '.;')

  let l:retstr = ""
  if l:build_dir != ""
    if filereadable(build_dir . '/CMakeCache.txt')
      let cmcache = readfile(build_dir . '/CMakeCache.txt')
      for line in cmcache
        if line =~ "CMAKE_BUILD_TYPE"
          let value = reverse(split(line, '='))[0]
          let retstr = retstr . value . " "
        elseif line =~ "RUN_TESTS"
          let value = reverse(split(line, '='))[0]
          let retstr = retstr . "T" . value . " "
        endif
      endfor
    endif
  endif
  return substitute(retstr, '^\s*\(.\{-}\)\s*$', '\1', '')
endfunction

call airline#parts#define('cmake', {'function': 'CMakeStat'})
let g:airline_section_b = airline#section#create_left(['cmake'])

function! myfunctions#airline#AirlineInit()
  call airline#parts#define_function('nvim-lsp-status', 'LspStatus')
  call airline#parts#define_function('nvim-lsp-error', 'LspError')
  call airline#parts#define_function('nvim-lsp-warning', 'LspWarning')
  call airline#parts#define_condition('nvim-lsp-warning',  "luaeval('vim.lsp.buf.server_ready()')")
  call airline#parts#define_condition('nvim-lsp-error',  "luaeval('vim.lsp.buf.server_ready()')")

  call airline#parts#define_raw('file2', "%#User1#%t %m")
  call airline#parts#define_raw('path2', "%{expand('%:h')}/")
  let g:airline_section_c = airline#section#create(['%<','path2', 'file2',  'readonly'])

  let g:airline_section_x = airline#section#create_right(['tagbar'])
  let g:airline_section_y = airline#section#create_right(['filetype'])
  " let g:airline_section_y = airline#section#create(['%{airline#util#wrap(airline#parts#filetype(),0)}'])
  " let g:airline_section_z = airline#section#create(['%3p%%',  ' %c:%l/%L [%{winnr()}]'])
  let g:airline_section_z = airline#section#create_right([ 'nvim-lsp-status', '%3p%% ',  ' %c:%l/%L'])
  let g:airline_section_error = airline#section#create_right([
        \ 'nvim-lsp-error',
        \ 'ycm_error_count',
        \ 'syntastic-err',
        \ 'eclim',
        \ 'languageclient_error_count'])
  let g:airline_section_warning = airline#section#create_right([
        \ 'nvim-lsp-warning',
        \ 'ycm_warning_count',
        \ 'syntastic-warn',
        \ 'languageclient_warning_count',
        \ 'whitespace'])
  " let w:airline_section_z = airline#section#create_right(['nvim-lsp'])
endfunction
