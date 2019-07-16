packadd! vimspector

nnoremap <silent> <leader>ds   :call vimspector#Launch()<CR>
nnoremap <silent> <F9>         :call vimspector#Continue()<CR>
nnoremap <silent> <leader>dk   :call vimspector#Stop()<CR>
nnoremap <silent> <leader>dr   :call vimspector#Restart()<CR>
nnoremap <silent> <leader>dp   :call vimspector#Pause()<CR>
nnoremap <silent> <leader>db   :call vimspector#ToggleBreakpoint()<CR>
nnoremap <silent> <leader>df   :call vimspector#AddFunctionBreakpoint( expand( '<cexpr>'  )  )<CR>
nnoremap <silent> <F8>         :call vimspector#StepOver()<CR>
nnoremap <silent> <F7>         :call vimspector#StepInto()<CR>
nnoremap <silent> <F6>         :call vimspector#StepOut()<CR>
