
if has('cscope')
      set cscopetag nocscopeverbose

        if has('quickfix')
                set cscopequickfix=s-,c-,d-,i-,t-,e-
    endif
endif
"set tags+=./tags
"set tags+=/usr/src/linux-3.4.4/tags
"set tags+=~/carmnet/src/trunk/danums/olsrd/tags
"set tags+=~/carmnet/src/trunk/danums/libcommod/tags
"set tags+=~/carmnet/src/trunk/danums/lkm/tags


map <leader>5 :!ctags -R --c++-kinds=+p --fields=+iaSl --extra=+q <CR>
map <leader>6 :!cscope -R -b -q <CR> :cs reset<CR><CR>
let OmniCpp_ShowPrototypeInAbbr = 0
" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::


    "cs add /usr/src/linux-3.4.4/cscope.out /usr/src/linux-3.4.4
    "cs add ~/carmnet/src/trunk/danums/olsrd/cscope.out ~/carmnet/src/trunk/danums/olsrd
    "cs add ~/carmnet/src/trunk/danums/libcommod/cscope.out ~/carmnet/src/trunk/danums/libcommod
    "cs add ~/carmnet/src/trunk/danums/lkm/cscope.out ~/carmnet/src/trunk/danums/lkm
"cs add /usr/src/linux-source-2.6.35/cscope.out /usr/src/linux-source-2.6.35
