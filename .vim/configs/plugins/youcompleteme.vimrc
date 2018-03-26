" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Code completion plugin
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
" let g:ycm_use_ultisnips_completer = 1

" Python complition
" let g:ycm_python_binary_path = '/usr/local/bin/python3'
let g:ycm_python_binary_path = 'python3'

" let g:ycm_add_preview_to_completeopt = 1
" let g:ycm_autoclose_preview_window_after_completion = 0
" let g:ycm_autoclose_preview_window_after_insertion = 1

" Goto definition
map <leader>g :YcmCompleter GoTo<CR>

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
"set shortmess+=c
