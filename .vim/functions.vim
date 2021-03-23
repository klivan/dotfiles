" Function to open current Split in Full Screen mode
function! s:zoom_toggle() abort
  if 1 == winnr('$')
    return
  endif
  let restore_cmd = winrestcmd()
  wincmd |
  wincmd _
  " If the layout did not change, it's a toggle (un-zoom).
  if restore_cmd ==# winrestcmd()
    exe t:zoom_restore
  else
    let t:zoom_restore = restore_cmd
  endif
endfunction

nnoremap <silent> <leader>z  :<C-u>call <SID>zoom_toggle()<CR>
nnoremap + :<C-u>call <SID>zoom_toggle()<CR>

" Creates directory if not exists
function! EnsureDirExists (dir)
  if !isdirectory(a:dir)
    if exists("*mkdir")
      call mkdir(a:dir,'p')
    else
      echo "Please create directory: " . a:dir
    endif
  endif
endfunction

call EnsureDirExists($HOME . '/.vim/undodir/')
call EnsureDirExists($HOME . '/.vim/sessions/')

