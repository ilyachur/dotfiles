if !g:isWindows && !g:isAndroid
    let g:local_vimrc_options = get(g:, 'local_vimrc_options', {})
    let g:local_vimrc = '.local_vimrc'
    call lh#local_vimrc#munge('whitelist', $HOME)
    " and in order to clear your asklist::
    call lh#local_vimrc#filter_list('asklist', 'v:val != $HOME')
endif
