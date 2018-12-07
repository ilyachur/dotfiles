" ferret

let g:ferret_search_options = ''
if executable('rg')
    let g:ferret_search_options = '--hidden'
endif

nnoremap <silent> <leader>ff :exe "Ack ".input("Search: ", "", "shellcmd")." ".g:ferret_search_options<CR>
nnoremap <silent> <leader>fw :exe "Ack ".input("Search: ", expand("<cword>"), "shellcmd")." ".g:ferret_search_options<CR>
