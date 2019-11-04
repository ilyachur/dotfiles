let s:CONF_DIRECTORY = expand('<sfile>:p:h')
let s:vim_configuration_files = [
\ 'vim-plug.vimrc',
\ 'ale.vimrc',
\ 'calendar.vimrc',
\ 'clang-format.vimrc',
\ 'color.vimrc',
\ 'diff.vimrc',
\ 'fm.vimrc',
\ 'fzf.vimrc',
\ 'git.vimrc',
\ 'indentline.vimrc',
\ 'latex.vimrc',
\ 'local_vimrc.vimrc',
\ 'lsp.vimrc',
\ 'markdown.vimrc',
\ 'nerdcommenter.vimrc',
\ 'search.vimrc',
\ 'startify.vimrc',
\ 'syntastic.vimrc',
\ 'tags.vimrc',
\ 'translate.vimrc',
\ 'ultisnips.vimrc',
\ 'vim-cpp-enhanced-highlight.vimrc',
\ 'wintabs.vimrc',
\]

for file in s:vim_configuration_files
  execute('source ' . s:CONF_DIRECTORY . '/' . file)
endfor
