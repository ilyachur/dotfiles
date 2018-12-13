let g:signify_realtime = 0

let g:Gitv_OpenHorizontal = 1
let g:Gitv_DoNotMapCtrlKey = 1

nnoremap <silent> <leader>vs :Gstatus<CR>
nnoremap <silent> <leader>vb :Gblame<CR>
nnoremap <silent> <leader>vc :Gcommit<CR>
nnoremap <silent> <leader>vca :Gcommit --amend<CR>
nnoremap <silent> <leader>vp :Gpush<CR>
nnoremap <silent> <leader>vpf :Gpush --force<CR>
nnoremap <silent> <leader>vP :Gpull<CR>
nnoremap <silent> <leader>vv :Gitv<CR>
