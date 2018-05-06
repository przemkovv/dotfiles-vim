
function! myfunctions#airline#AirlineInit()
  call airline#parts#define_raw('file2', "%#User1#%t %m")
  call airline#parts#define_raw('path2', "%{expand('%:h')}/")
  let g:airline_section_c = airline#section#create(['%<','path2', 'file2',  'readonly'])

  let g:airline_section_x = airline#section#create_right(['tagbar'])
  let g:airline_section_y = airline#section#create_right(['filetype'])
  " let g:airline_section_y = airline#section#create(['%{airline#util#wrap(airline#parts#filetype(),0)}'])
  " let g:airline_section_z = airline#section#create(['%3p%%',  ' %c:%l/%L [%{winnr()}]'])
  let g:airline_section_z = airline#section#create(['%3p%%',  ' %c:%l/%L'])
endfunction
