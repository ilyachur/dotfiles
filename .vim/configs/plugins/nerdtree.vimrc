"-------------------------------------------------------------------------------------------------------
" Module for plugins downloading
"-------------------------------------------------------------------------------------------------------

let g:NERDTreeMouseMode = 2                                 " Single-click to expand the directory, double-click to open the file
let g:NERDTreeShowHidden = 1                                " Show hidden files
let g:NERDTreeMinimalUI=1                                   " Disable display of '?' text and 'Bookmarks' label.

" NERDTree tabs
" let g:nerdtree_tabs_autofind=1
" let g:nerdtree_tabs_focus_on_files=1

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

