 call plug#begin('~/.vim/plugged')

" Programming {{{ "
" C++ {{{ "
" Code Completion {{{ "
if !g:isAndroid
    if v:version > 704 || (v:version == 704 && has('patch1578'))     " This is a limitation of YCM
       Plug 'Valloric/YouCompleteMe', { 'do': 'python install.py --clang-completer' }
    endif
   Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
endif
" }}} Code Completion "
" Syntax highlighting {{{ "
" Plug 'octol/vim-cpp-enhanced-highlight'
" }}} Syntax highlighting "
" {{{ Tests
Plug 'alepez/vim-gtest'             " Google tests
" }}}
" {{{ Build systems
Plug 'ilyachur/cmake4vim'
" }}}
" Navigation {{{ "
Plug 'vim-scripts/a.vim'                    " Switch to header
" }}} Navigation "
" }}} C++ "
" Python {{{ "
" Code Completion {{{ "
" It provides by YCM. See C++ code completion.
" }}} Code Completion "
Plug 'python-mode/python-mode', { 'for': 'python' }
" }}} Python "
" Debugging {{{ "
if !g:isWindows && !g:isAndroid
    Plug 'echuraev/Conque-GDB', { 'on': 'ConqueGdb' }         " Conque GDB
    Plug 'Shougo/vimproc.vim', {'do' : 'make'}
    Plug 'idanarye/vim-vebugger', { 'branch': 'develop' }
endif
" }}} Debugging "
" Json {{{ "
Plug 'elzr/vim-json', { 'for': 'json' }                   " Color highlighting for json
" }}} Json "
" {{{ Other
Plug 'scrooloose/nerdcommenter'                           " Enable commentaries
Plug 'bbchung/clighter8'                                  " Refactorin
" }}}
" }}} Programming "
" Snippets {{{ "
" For working it is necessary to have python3 installed
" On Windows you have to have the same architecture (32 or 64 bits) versions of vim and python
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'   " Snippets.
" }}} Snippets "
" Fuzzy Finder {{{ "
" Plugin outside ~/.vim/plugged with post-update hook
" On windows download binaries from the github
if !g:isWindows
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
else
    Plug 'junegunn/fzf'
endif
Plug 'junegunn/fzf.vim'
" }}} Fuzzy Finder "
" Tmux {{{ "
if !g:isWindows
    Plug 'tmux-plugins/vim-tmux-focus-events'
endif
" }}} Tmux "
" Git {{{ "
Plug 'tpope/vim-fugitive'                " Git plugin
Plug 'gregsexton/gitv', {'on': ['Gitv']} " Gitk for vim
Plug 'airblade/vim-gitgutter'            " Extencion for git
Plug 'rhysd/committia.vim'               " extended commit message
Plug 'idanarye/vim-merginal'             " a nice inteface for dealing with Git branches
" }}} Git "
" Search {{{ "
Plug 'osyo-manga/vim-over'            " Replace highlighter
Plug 'mileszs/ack.vim'                " Run ack in vim
Plug 'dkprice/vim-easygrep'             " Run grep
Plug 'romainl/vim-qf', { 'for': 'qf' } " Tame the quickfix window
" }}} Search "
" Project {{{ "
Plug 'tpope/vim-dispatch'             " Project compiling
if !g:isWindows && !g:isAndroid
    Plug 'LucHermitte/lh-vim-lib'         " Dependency of local_vimrc
    Plug 'LucHermitte/local_vimrc'        " Local vimrc files for projects
    Plug 'editorconfig/editorconfig-vim'  " Editor configuration for a project
endif
" }}} Project "
" File Tree {{{ "
Plug 'scrooloose/nerdtree', { 'on':  'NERDTree' } | Plug 'Xuyuanp/nerdtree-git-plugin' " | Plug 'jistr/vim-nerdtree-tabs', { 'on': 'NERDTreeTabsToggle' }
Plug 'tpope/vim-vinegar'              " vinegar.vim enhances netrw
" }}} File Tree "
" Text manipulation {{{ "
Plug 'wellle/targets.vim'             " Add various text objects to VIM
Plug 'terryma/vim-multiple-cursors'   " Plugin for multiple cursors
Plug 'tmhedberg/matchit'              " Extend behavior of %
Plug 'machakann/vim-multiselect'      " A library plugin to handle multiple visual selections
" }}} Text manipulation "
" Common {{{ "
if v:version > 704 || (v:version == 704 && has('patch248'))     " systemlist function was added in patch 248
    Plug 'chrisbra/vim-diff-enhanced' " Diff viewer
endif
Plug 'mhinz/vim-startify'             " Nice start screen
Plug 'w0rp/ale'                       " Syntax checking plugin
Plug 'will133/vim-dirdiff'            " Dir diff viewer
Plug 'majutsushi/tagbar'              " Tagbar
Plug 'zefei/vim-wintabs'              " Separate tabs for windows
Plug 'zefei/vim-wintabs-powerline'
Plug 'farmergreg/vim-lastplace'       " Intelligently reopen files at your last edit position
Plug 'vim-scripts/netrw.vim'          " Remote file editing
" }}} Common "
" View {{{ "
Plug 'vim-scripts/LargeFile'          " Enable big files support for vim
Plug 'yggdroot/indentline'            " Displaying thin vertical lines at each indentation level
Plug 'morhetz/gruvbox'                " Color scheme
" }}} View "
" Other {{{ "
Plug 'itchyny/calendar.vim'           " Calendar in VIM
Plug 'chiphogg/vim-prototxt'          " Enable prototxt support
Plug 'vim-scripts/DoxygenToolkit.vim' " Enable doxygen support
Plug 'skywind3000/quickmenu.vim'      " Quickmenu for launch configurations
Plug 'manasthakur/vim-sessionist'     " Vim sessions
Plug 'bogado/file-line'               " For open file:line
" }}} Other "

call plug#end()

let g:plug_threads = 8
