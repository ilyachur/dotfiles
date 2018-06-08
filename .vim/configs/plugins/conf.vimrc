let s:CONF_DIRECTORY = expand('<sfile>:p:h')
let s:vim_configuration_files = [
\ 'vim-plug.vimrc',
\ 'a.vimrc',
\ 'ack.vimrc',
\ 'ale.vimrc',
\ 'calendar.vimrc',
\ 'color.vimrc',
\ 'ctrlp.vimrc',
\ 'debuger.vimrc',
\ 'diff.vimrc',
\ 'doxygen.vimrc',
\ 'esearch.vimrc',
\ 'gitv.vimrc',
\ 'gtest.vimrc',
\ 'indentline.vimrc',
\ 'latex.vimrc',
\ 'local_vimrc.vimrc',
\ 'nerdcommenter.vimrc',
\ 'nerdtree.vimrc',
\ 'python-mode.vimrc',
\ 'quickmenu.vimrc',
\ 'rtags.vimrc',
\ 'startify.vimrc',
\ 'syntastic.vimrc',
\ 'translate.vimrc',
\ 'ultisnips.vimrc',
\ 'vim-cpp-enhanced-highlight.vimrc',
\ 'wintabs.vimrc',
\ 'youcompleteme.vimrc',
\]

for file in s:vim_configuration_files
  execute('source ' . s:CONF_DIRECTORY . '/' . file)
endfor
