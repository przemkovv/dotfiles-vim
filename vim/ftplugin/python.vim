
"let g:flake8_builtins="_,apply"
augroup filetype_python 
   autocmd!
   "autocmd BufWritePost *.py call Flake8()
   autocmd FileType python set omnifunc=pythoncomplete#Complete
   autocmd BufWritePre *.py :%s/\s\+$//e
augroup END

let g:pymode_lint_checker = "pyflakes,pylint,pep8,mccabe"

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=80
setlocal smarttab
setlocal expandtab
set nosmartindent
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

