" let g:vebugger_leader='<Leader>d'

" set custom vebugger key bindings
nnoremap <silent> <leader>ds :VBGstepIn<CR>
nnoremap <silent> <leader>dn :VBGstepOver<CR>
nnoremap <silent> <leader>do :VBGstepOut<CR>
nnoremap <silent> <leader>dc :VBGcontinue<CR>
nnoremap <silent> <leader>dt :VBGtoggleTerminalBuffer<CR>
nnoremap <silent> <leader>db :VBGtoggleBreakpointThisLine<CR>
nnoremap <silent> <leader>dB :VBGclearBreakpoints<CR>
nnoremap <silent> <leader>de :VBGevalWordUnderCursor<CR>
nnoremap <silent> <leader>dw :exe "VBGrawWrite ".input("VBG> ")<CR>
nnoremap <silent> <leader>dE :exe "VBGeval ".input("VBG-Eval> ")<CR>
nnoremap <silent> <leader>dX :exe "VBGexecute ".input("VBG-Exec> ")<CR>
nnoremap <silent> <leader>dx :exe "VBGexecute ".getline(".")<CR>


vnoremap <silent> <leader>de :VBGevalSelectedText<CR>
vnoremap <silent> <leader>dx :VBGexecuteSelectedText<CR>
vnoremap <silent> <leader>dw :VBGrawWriteSelectedText<CR>
