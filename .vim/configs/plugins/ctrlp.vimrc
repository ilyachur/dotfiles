let g:ctrlp_show_hidden = 1

if executable('rg')
    " --column: Show column number
    " --line-number: Show line number
    " --no-heading: Do not show file headings in results
    " --fixed-strings: Search term as a literal string
    " --ignore-case: Case insensitive search
    " --no-ignore: Do not respect .gitignore, etc...
    " --hidden: Search hidden files and folders
    " --follow: Follow symlinks
    " --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
    " --color: Search color options
    set grepprg=rg\ --color=never
    let g:ctrlp_user_command = 'rg %s --files --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color=never'
    let g:ctrlp_use_caching = 0
endif

nnoremap <silent> <leader>f :CtrlPRoot<CR>
nnoremap <silent> <leader>fs :CtrlPSSH<CR>
nnoremap <silent> <leader>b :CtrlPBuffer<CR>
nnoremap <silent> <leader>h :CtrlPMRU<CR>
nnoremap <silent> <leader>: :CtrlPCmdline<CR>
