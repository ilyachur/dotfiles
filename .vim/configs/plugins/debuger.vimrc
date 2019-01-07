" let g:vebugger_leader='<Leader>d'

let g:vebugger_view_source_cmd='edit'
let g:vebugger_use_tags=1

if !has("nvim")
    " set custom vebugger key bindings
    nnoremap <silent> <leader>ds :VBGstepIn<CR>
    nnoremap <silent> <leader>dn :VBGstepOver<CR>
    nnoremap <silent> <leader>do :VBGstepOut<CR>
    nnoremap <silent> <leader>dc :VBGcontinue<CR>
    nnoremap <silent> <leader>dt :VBGtoggleTerminalBuffer<CR>
    nnoremap <silent> <leader>db :VBGtoggleBreakpointThisLine<CR>
    nnoremap <silent> <leader>dB :VBGclearBreakpoints<CR>
    nnoremap <silent> <leader>de :VBGevalWordUnderCursor<CR>
    nnoremap <silent> <leader>dk :VBGkill<CR>
    nnoremap <silent> <leader>dw :exe "VBGrawWrite ".input("VBG> ")<CR>
    nnoremap <silent> <leader>dE :exe "VBGeval ".input("VBG-Eval> ")<CR>
    nnoremap <silent> <leader>dX :exe "VBGexecute ".input("VBG-Exec> ")<CR>
    nnoremap <silent> <leader>dx :exe "VBGexecute ".getline(".")<CR>

    vnoremap <silent> <leader>de :VBGevalSelectedText<CR>
    vnoremap <silent> <leader>dx :VBGexecuteSelectedText<CR>
    vnoremap <silent> <leader>dw :VBGrawWriteSelectedText<CR>
else
    nnoremap <silent> <leader>ds :LL step<CR>
    nnoremap <silent> <leader>dn :LL next<CR>
    nnoremap <silent> <leader>do :LL finish<CR>
    nnoremap <silent> <leader>dc :LL continue<CR>
    nmap <leader>db <Plug>LLBreakSwitch
    nnoremap <silent> <leader>dk :LL process interrupt<CR>
    nnoremap <silent> <leader>de :LL print <C-R>=expand('<cword>')<CR>
    nnoremap <silent> <leader>dd :LLmode debug<CR>
    nnoremap <silent> <leader>dq :LLmode code<CR>
    nnoremap <silent> <leader>di :LLstdin<CR>

    vnoremap <silent> <leader>de :<C-U>LL print <C-R>=lldb#util#get_selection()<CR><CR>
    vmap <leader>di <Plug>LLStdInSelected
endif
