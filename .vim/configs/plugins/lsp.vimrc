let g:coc_global_extensions = [
    \ 'coc-json',
    \ 'coc-tag',
    \ 'coc-yaml',
    \ 'coc-lists',
    \ 'coc-yank',
    \ 'coc-vimtex',
    \ 'coc-python',
    \ 'coc-dictionary',
    \ 'coc-ultisnips',
    \]

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')
" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)
