let s:CONF_DIRECTORY = expand('<sfile>:p:h')
let s:vim_configuration_files = [
\ 'vim-plug.vimrc',
\ 'youcompleteme.vimrc',
\ 'syntastic.vimrc',
\ 'nerdtree.vimrc',
\ 'diff.vimrc',
\ 'latex.vimrc',
\ 'wintabs.vimrc',
\ 'ultisnips.vimrc',
\ 'calendar.vimrc',
\ 'gitv.vimrc',
\ 'indentline.vimrc',
\ 'esearch.vimrc',
\ 'local_vimrc.vimrc',
\ 'ctrlp.vimrc',
\ 'startify.vimrc',
\ 'vim-cpp-enhanced-highlight.vimrc',
\ 'ack.vimrc',
\ 'debuger.vimrc',
\ 'python-mode.vimrc',
\ 'color.vimrc',
\ 'gtest.vimrc',
\ 'doxygen.vimrc',
\ 'nerdcommenter.vimrc',
\ 'quickmenu.vimrc',
\ 'ale.vimrc',
\ 'a.vimrc',
\ 'translate.vimrc',
\]

for file in s:vim_configuration_files
  execute('source ' . s:CONF_DIRECTORY . '/' . file)
endfor
