let s:ext = 'so'

if g:isWindows
    let s:ext = 'dll'
elseif g:isMac
    let s:ext = 'dylib'
endif

let g:clighter8_libclang_path=$HOME.'/.vim/plugged/YouCompleteMe/third_party/ycmd/libclang.'.s:ext
