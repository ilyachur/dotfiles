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
\ 'easygrep.vimrc',
\ 'local_vimrc.vimrc',
\ 'fzf.vimrc',
\ 'startify.vimrc',
\ 'vim-cpp-enhanced-highlight.vimrc',
\ 'ack.vimrc',
\ 'conquegdb.vimrc',
\ 'python-mode.vimrc',
\ 'color.vimrc',
\ 'gtest.vimrc',
\ 'doxygen.vimrc',
\ 'nerdcommenter.vimrc',
\ 'quickmenu.vimrc',
\ 'ale.vimrc',
\ 'a.vimrc',
\]

for file in s:vim_configuration_files
  execute('source ' . s:CONF_DIRECTORY . '/' . file)
endfor
