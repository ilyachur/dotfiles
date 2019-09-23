" ferret

let g:ferret_search_options = ''
if executable('rg')
    let g:ferret_search_options = '--hidden'
endif

let g:FerretExecutableArguments = {
            \ 'rg': '--vimgrep --no-heading --no-config --max-columns 4096 --hidden',
            \ }

nmap <leader>ff <Plug>(FerretAck)
nmap <leader>fr <Plug>(FerretAcks)
nmap <silent> <leader>fw <Plug>(FerretAckWord)
