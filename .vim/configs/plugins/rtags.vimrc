let g:rtagsAutoLaunchRdm = 1
let g:rtagsUseDefaultMappings = 0

" Symbol info
nnoremap <silent> <leader>gi :call rtags#SymbolInfo()<CR>
" Follow location
nnoremap <silent> <leader>gj :call rtags#JumpTo(g:SAME_WINDOW)<CR>
" Follow declaration location
nnoremap <silent> <leader>gJ :call rtags#JumpTo(g:SAME_WINDOW, { '--declaration-only' : '' })<CR>
" Follow location (open in horizontal split)
nnoremap <silent> <leader>gS :call rtags#JumpTo(g:H_SPLIT)<CR>
" Follow location (open in vertical split)
nnoremap <silent> <leader>gV :call rtags#JumpTo(g:V_SPLIT)<CR>
" Follow location open in a new tab
nnoremap <silent> <leader>gT :call rtags#JumpTo(g:NEW_TAB)<CR>
" Jump to parent
nnoremap <silent> <leader>gp :call rtags#JumpToParent()<CR>
" Find subclasses
nnoremap <silent> <leader>gC :call rtags#FindSuperClasses()<CR>
" Find superclasses
nnoremap <silent> <leader>gc :call rtags#FindSubClasses()<CR>
" Find references
nnoremap <silent> <leader>gf :call rtags#FindRefs()<CR>
" Call tree (o - open node, Enter - jump)
nnoremap <silent> <leader>gF :call rtags#FindRefsCallTree()<CR>
" Find references by name
nnoremap <silent> <leader>gn :call rtags#FindRefsByName(input("Pattern? ", "", "customlist,rtags#CompleteSymbols"))<CR>
" Find symbols by name
nnoremap <silent> <leader>gs :call rtags#FindSymbols(input("Pattern? ", "", "customlist,rtags#CompleteSymbols"))<CR>
" Reindex current file
nnoremap <silent> <leader>gr :call rtags#ReindexFile()<CR>
" List all available projects
nnoremap <silent> <leader>gl :call rtags#ProjectList()<CR>
" Rename symbol under cursor
nnoremap <silent> <leader>rw :call rtags#RenameSymbolUnderCursor()<CR>
" Find virtuals
nnoremap <silent> <leader>gv :call rtags#FindVirtuals()<CR>
" Jump to previous location
nnoremap <silent> <leader>gb :call rtags#JumpBack()<CR>
" Diagnose file for warnings and errors
nnoremap <silent> <leader>gd :call rtags#Diagnostics()<CR>
