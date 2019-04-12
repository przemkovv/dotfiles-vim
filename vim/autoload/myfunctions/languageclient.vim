" Automatic Hover
function! myfunctions#languageclient#DoNothingHandler(output)
endfunction

function! myfunctions#languageclient#IsDifferentHoverLineFromLast()
  if !exists('b:last_hover_line')
    return 1
  endif

  return b:last_hover_line !=# line('.') || b:last_hover_col !=# col('.')
endfunction

function! myfunctions#languageclient#GetHoverInfo()
  " Only call hover if the cursor position changed.
  "
  " This is needed to prevent infinite loops, because hover info is displayed
  " in a popup window via nvim_buf_set_lines() which puts the cursor into the
  " popup window and back, which in turn calls CursorMoved again.
  if mode() == 'n' && myfunctions#languageclient#IsDifferentHoverLineFromLast()
    let b:last_hover_line = line('.')
    let b:last_hover_col = col('.')

    " call LanguageClient_textDocument_hover({'handle': v:true}, 'myfunctions#languageclient#DoNothingHandler')
    call LanguageClient_clearDocumentHighlight()
    call LanguageClient_textDocument_documentHighlight({'handle': v:true}, 'myfunctions#languageclient#DoNothingHandler')
  endif
endfunction

