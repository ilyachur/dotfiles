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
    let g:nvimgdb_disable_start_keymaps = 1
    nnoremap <silent> <leader>dB :GdbBreakpointClearAll<CR>
    nnoremap <silent> <leader>dk :GdbDebugStop<CR>

    let g:nvimgdb_config_override = {
                \ 'key_until':      '<leader>dt',
                \ 'key_continue':   '<leader>dc',
                \ 'key_next':       '<leader>dn',
                \ 'key_step':       '<leader>ds',
                \ 'key_finish':     '<leader>do',
                \ 'key_breakpoint': '<leader>db',
                \ 'key_frameup':    '<leader>du',
                \ 'key_framedown':  '<leader>dd',
                \ 'key_eval':       '<leader>de',
                \ }
endif
