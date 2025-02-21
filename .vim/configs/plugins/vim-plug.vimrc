call plug#begin('~/.vim/plugged')

" Programming {{{ "
" C++ {{{ "
" {{{ Build systems
if executable('cmake')
    Plug 'ilyachur/cmake4vim'
endif
Plug 'ilyachur/gtest-vim'
" }}}
" }}} C++ "
" Debugging {{{ "
if !g:isWindows && !g:isAndroid
    Plug 'puremourning/vimspector', { 'do': './install_gadget.py --all --disable-tcl --disable-go' }
endif
" }}} Debugging "
" {{{ Markdown
Plug 'iamcco/markdown-preview.vim'                      " Markdown preview plugin
" }}}
" {{{ Code Completion "
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
" }}} Code Completion "
" {{{ Other "
Plug 'scrooloose/nerdcommenter'                         " Enable commentaries

if executable('ctags') || executable('cscope') || executable('gtags')
    Plug 'ludovicchabant/vim-gutentags'                 " Ctags support
endif
Plug 'rhysd/vim-clang-format'                           " clang-format
" }}} Other "
" Syntax highlighting {{{ "
" Use highlight from CoC "semanticTokens.filetypes": ["*"]
" Plug 'jackguo380/vim-lsp-cxx-highlight' " Doesn't support clangd 13
" Plug 'octol/vim-cpp-enhanced-highlight'
" }}} Syntax highlighting "
" }}} Programming "
" Git {{{ "
Plug 'tpope/vim-fugitive'                               " Git plugin
Plug 'rbong/vim-flog'                                   " Gitk for vim
Plug 'mhinz/vim-signify'                                " Extencion for git
Plug 'rhysd/committia.vim'                              " extended commit message
Plug 'sodapopcan/vim-twiggy'                            " a nice inteface for dealing with Git branches
" }}} Git "
" Search {{{ "
Plug 'wincent/ferret'                                   " Fast search and replace
if !g:isWindows
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
else
    Plug 'junegunn/fzf'
endif
Plug 'junegunn/fzf.vim'                                 " FZF for vim
" }}} Search "
" Project {{{ "
Plug 'tpope/vim-dispatch'                               " Project compiling
Plug 'embear/vim-localvimrc'                            " Local vimrc files for projects
Plug 'editorconfig/editorconfig-vim'                    " Editor configuration for a project
" }}} Project "
" File Tree {{{ "
Plug 'tpope/vim-vinegar'                                " vinegar.vim enhances netrw
Plug 'vifm/vifm.vim'                                    " Integrate vifm to vim
" }}} File Tree "
" Text manipulation {{{ "
Plug 'mg979/vim-visual-multi'                           " Plugin for multiple cursors
Plug 'mbbill/undotree'                                  " The ultimate undo history visualizer for VIM
" }}} Text manipulation "
" Common {{{ "
if v:version > 704 || (v:version == 704 && has('patch248'))     " systemlist function was added in patch 248
    Plug 'chrisbra/vim-diff-enhanced' " Diff viewer
endif
Plug 'mhinz/vim-startify'                               " Nice start screen
Plug 'will133/vim-dirdiff'                              " Dir diff viewer
Plug 'majutsushi/tagbar'                                " Tagbar
Plug 'zefei/vim-wintabs'                                " Separate tabs for windows
Plug 'farmergreg/vim-lastplace'                         " Intelligently reopen files at your last edit position
Plug 'vim-scripts/netrw.vim'                            " Remote file editing
" }}} Common "
" View {{{ "
Plug 'vim-scripts/LargeFile'                            " Enable big files support for vim
Plug 'yggdroot/indentline'                              " Displaying thin vertical lines at each indentation level
" Color schemes {{{ "
Plug 'lifepillar/vim-solarized8'
Plug 'morhetz/gruvbox'
" }}} Color schemes "
" }}} View "
" Other {{{ "
Plug 'chiphogg/vim-prototxt'                            " Enable prototxt support
Plug 'vim-scripts/DoxygenToolkit.vim'                   " Enable doxygen support
Plug 'okcompute/vim-ctrlp-session'                      " Vim sessions
Plug 'bogado/file-line'                                 " For open file:line
Plug 'lervag/vimtex'                                    " Latex support
Plug 'liuchengxu/graphviz.vim'                          " Graphiz support

if !g:isWindows
    Plug 'echuraev/translate-shell.vim', { 'do': 'wget -O ~/.vim/trans git.io/trans && chmod +x ~/.vim/trans'  }
endif
" }}} Other "

call plug#end()

let g:plug_threads = 8
