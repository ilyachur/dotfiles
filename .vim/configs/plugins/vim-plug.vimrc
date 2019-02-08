 call plug#begin('~/.vim/plugged')

" Programming {{{ "
" C++ {{{ "
" Syntax highlighting {{{ "
Plug 'octol/vim-cpp-enhanced-highlight'
" }}} Syntax highlighting "
" {{{ Tests
Plug 'alepez/vim-gtest'             " Google tests
" }}}
" {{{ Build systems
Plug 'ilyachur/cmake4vim'
" }}}
" Navigation {{{ "
Plug 'vim-scripts/a.vim'                                " Switch to header
Plug 'LucHermitte/lh-vim-lib'                           " Dependency of local_vimrc and vim fold for cpp
" Plug 'LucHermitte/VimFold4C'                            " Folding for cpp
" }}} Navigation "
" }}} C++ "
" Python {{{ "
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
" }}} Python "
" Debugging {{{ "
if !g:isWindows && !g:isAndroid
    Plug 'Shougo/vimproc.vim', { 'do' : 'make' }
    Plug 'idanarye/vim-vebugger', { 'branch': 'develop' }
    if has("nvim")
        Plug 'dbgx/lldb.nvim', { 'do': ':UpdateRemotePlugins' }
    endif
endif
" }}} Debugging "
" Json {{{ "
Plug 'elzr/vim-json', { 'for': 'json' }                   " Color highlighting for json
" }}} Json "
" {{{ Markdown
Plug 'iamcco/markdown-preview.vim'         " Markdown preview plugin
" }}}
" {{{ Other
Plug 'neoclide/coc.nvim', {'do': 'yarn install'}
Plug 'scrooloose/nerdcommenter'                         " Enable commentaries

if executable('ctags') || executable('cscope') || executable('gtags')
    Plug 'ludovicchabant/vim-gutentags'                 " Ctags support
endif

if executable('rdm') && !has("nvim")
    Plug 'lyuts/vim-rtags'                              " Rtags support
endif
" }}}
" }}} Programming "
" Snippets {{{ "
" For working it is necessary to have python3 installed
" On Windows you have to have the same architecture (32 or 64 bits) versions of vim and python
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'   " Snippets.
" }}} Snippets "
" Tmux {{{ "
if !g:isWindows
    Plug 'tmux-plugins/vim-tmux-focus-events'
endif
" }}} Tmux "
" Git {{{ "
Plug 'tpope/vim-fugitive'                               " Git plugin
Plug 'gregsexton/gitv', {'on': ['Gitv']}                " Gitk for vim
Plug 'mhinz/vim-signify'                                " Extencion for git
Plug 'rhysd/committia.vim'                              " extended commit message
Plug 'idanarye/vim-merginal', { 'branch': 'develop' }   " a nice inteface for dealing with Git branches
" }}} Git "
" Search {{{ "
Plug 'osyo-manga/vim-over'              " Replace highlighter
Plug 'wincent/ferret'                   " Fast search and replace
Plug 'romainl/vim-qf', { 'for': 'qf' }  " Tame the quickfix window
if !g:isWindows
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
else
    Plug 'junegunn/fzf'
endif
Plug 'junegunn/fzf.vim'                 " FZF for vim
" }}} Search "
" Project {{{ "
Plug 'tpope/vim-dispatch'             " Project compiling
Plug 'embear/vim-localvimrc'            " Local vimrc files for projects
Plug 'editorconfig/editorconfig-vim'    " Editor configuration for a project
" }}} Project "
" File Tree {{{ "
Plug 'scrooloose/nerdtree', { 'on':  'NERDTree' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-vinegar'              " vinegar.vim enhances netrw
" }}} File Tree "
" Text manipulation {{{ "
Plug 'wellle/targets.vim'               " Add various text objects to VIM
Plug 'terryma/vim-multiple-cursors'     " Plugin for multiple cursors
Plug 'tmhedberg/matchit'                " Extend behavior of %
Plug 'machakann/vim-multiselect'        " A library plugin to handle multiple visual selections
Plug 'mbbill/undotree'                  " The ultimate undo history visualizer for VIM
Plug 'cohama/lexima.vim'                " Vim plugin, insert or delete brackets, parens, quotes in pair
" }}} Text manipulation "
" Common {{{ "
if v:version > 704 || (v:version == 704 && has('patch248'))     " systemlist function was added in patch 248
    Plug 'chrisbra/vim-diff-enhanced' " Diff viewer
endif
Plug 'mhinz/vim-startify'               " Nice start screen
Plug 'w0rp/ale'                         " Syntax checking plugin
Plug 'will133/vim-dirdiff'              " Dir diff viewer
Plug 'majutsushi/tagbar'                " Tagbar
Plug 'zefei/vim-wintabs'                " Separate tabs for windows
Plug 'farmergreg/vim-lastplace'         " Intelligently reopen files at your last edit position
Plug 'vim-scripts/netrw.vim'            " Remote file editing
Plug 'AndrewRadev/undoquit.vim'         " Save closed buffers/windows
" }}} Common "
" View {{{ "
Plug 'vim-scripts/LargeFile'            " Enable big files support for vim
Plug 'yggdroot/indentline'              " Displaying thin vertical lines at each indentation level
Plug 'morhetz/gruvbox'                  " Color scheme
" Plug 'mattboehm/vim-unstack'            " Parse stack traces
" }}} View "
" Other {{{ "
Plug 'itchyny/calendar.vim'             " Calendar in VIM
Plug 'chiphogg/vim-prototxt'            " Enable prototxt support
Plug 'vim-scripts/DoxygenToolkit.vim'   " Enable doxygen support
Plug 'skywind3000/quickmenu.vim'        " Quickmenu for launch configurations
Plug 'okcompute/vim-ctrlp-session'      " Vim sessions
Plug 'bogado/file-line'                 " For open file:line
Plug 'jceb/vim-orgmode'                 " Org mode
Plug 'dhruvasagar/vim-table-mode'       " Table mod
Plug 'kevinhui/vim-docker-tools'        " Docker tools
Plug 'rmolin88/pomodoro.vim'            " Pomodoro TM

if !g:isWindows
    Plug 'echuraev/translate-shell.vim', { 'do': 'wget -O ~/.vim/trans git.io/trans && chmod +x ~/.vim/trans'  }
endif
" }}} Other "

call plug#end()

let g:plug_threads = 8
