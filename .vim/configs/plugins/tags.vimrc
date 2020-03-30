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
    \ '--extra=+qf',
    \ '--c++-kinds=+p',
    \ ]

" Find alternate
" Use --extra=+f for ctags
function! SwithSource(splitType)
    let extMap = {
        \ 'cpp': ['hpp', 'h'],
        \ 'cxx': ['hpp', 'h'],
        \ 'c': ['hpp', 'h'],
        \ 'hpp': ['cpp', 'cxx', 'c'],
        \ 'h': ['cpp', 'cxx', 'c'],
    \ }
    let kinds = ['F']
    let fileName = expand('%:t:r')
    let ext = expand('%:e')

    if has_key(extMap, ext)
        for altExt in extMap[ext]
            let altFile = fileName.".".altExt
            for entry in taglist(altFile)
                if index(kinds, entry.kind) > -1
                    if (a:splitType == "h")
                        silent! execute ":split"
                    elseif (a:splitType == "v")
                        silent! execute ":vsplit"
                    elseif (a:splitType == "t")
                        silent! execute ":tab split"
                    endif
                    silent! execute ":tag ".entry.name
                    return
                endif
            endfor
        endfor
    endif
    echohl ErrorMsg |
                \ echomsg "Cannot find alternate file for: ".@% |
                \ echohl None
    return
endfunction

command! -nargs=0 A call SwithSource("")
command! -nargs=0 AV call SwithSource("v")
command! -nargs=0 AS call SwithSource("h")
command! -nargs=0 AT call SwithSource("t")

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
