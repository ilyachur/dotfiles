let g:ale_sign_column_always = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_set_highlights = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_linters = {
            \   'cpp': ['cpplint'],
            \}
