let s:CONF_DIRECTORY = expand('<sfile>:p:h')
let s:vim_configuration_files = [
\ 'common-functions.vimrc',
\ 'common.vimrc',
\ 'key-bindings.vimrc',
\ 'file-association.vimrc',
\ 'statusline.vimrc',
\]

for file in s:vim_configuration_files
  execute('source ' . s:CONF_DIRECTORY . '/' . file)
endfor
