let g:gutentags_project_root = ['.git', '.local_vimrc', '.hg', '.svn']
let g:gutentags_add_default_project_roots  = 1
let g:gutentags_add_ctrlp_root_markers = 0

if !g:isWindows
    let g:gutentags_cache_dir = expand('~/.cache/vim/ctags')
    command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')
endif

let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_empty_buffer = 0

let g:gutentags_ctags_extra_args = [
    \ '--tag-relative=yes',
    \ '--fields=+ailmnS',
    \ ]

" let g:gutentags_ctags_exclude = [
"     \ '*.git', '*.svn', '*.hg',
"     \ 'build',
"     \ 'bin',
"     \ 'temp'
"     \ 'docs',
"     \ '*.md',
"     \ '*.json', '*.xml', '*.bin',
"     \ '*.pyc', '*.class',
"     \ '*.pdb',
"     \ 'tags*',
"     \ 'cscope*',
"     \ '*.exe', '*.dll',
"     \ '*.mp3', '*.ogg', '*.flac',
"     \ '*.bmp', '*.jpg', '*.gif', '*.png', '*.ico',
"     \ '*.so', '*.a',
"     \ '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2', '*.rar', '*.zip',
"     \ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
"     \ ]
"
" let g:gutentags_modules = ['ctags', 'gtags_cscope']
if executable('rdm') && !has("nvim")
    let g:rtagsAutoLaunchRdm = 1
    let g:rtagsUseDefaultMappings = 0

    " Symbol info
    nnoremap <silent> <leader>ri :call rtags#SymbolInfo()<CR>
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
    nnoremap <silent> <leader>rd :call rtags#Diagnostics()<CR>
endif
