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
" " C# {{{ "
" Code Completion {{{ "
if !g:isAndroid
    if !g:isWindows
"        Plug 'OmniSharp/omnisharp-vim', { 'do': 'git submodule update --init --recursive && cd server && xbuild  /p:TargetFrameworkVersion=v4.5' }         " C# completion
    else
        " For enable msbuild add to path variable path to .NET framework. E.g.: C:\Windows\Microsoft.NET\Framework\v4.0.30319
"        Plug 'OmniSharp/omnisharp-vim', { 'do': 'git submodule update --init --recursive && cd server && msbuild' }         " C# completion
    endif
endif
" }}} Code Completion "
" Syntax highlighting {{{ "
Plug 'OrangeT/vim-csharp', { 'for': 'cs' }                  " C# highlighting
" }}} Syntax highlighting "
" }}} C# "
" Python {{{ "
" Code Completion {{{ "
" It provides by YCM. See C++ code completion.
" }}} Code Completion "
Plug 'python-mode/python-mode', { 'for': 'python' }
" }}} Python "
" Debugging {{{ "
if !g:isWindows && !g:isAndroid
    Plug 'echuraev/Conque-GDB', { 'on': 'ConqueGdb' }         " Conque GDB
endif
" }}} Debugging "
" Json {{{ "
Plug 'elzr/vim-json', { 'for': 'json' }                   " Color highlighting for json
" }}} Json "
" Code formatting {{{ "
" Plug 'rhysd/vim-clang-format'                             " Format code with specific coding style
" }}} Code formatting "
" {{{ Other
" Plug 'airblade/vim-rooter'                                " detect root folder
Plug 'scrooloose/nerdcommenter'                           " Enable commentaries
" Plug 'pseewald/vim-anyfold'                               " Enable folding"
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
" " Tmux {{{ "
" if !g:isWindows
"     " Text Completion {{{ "
"     Plug 'wellle/tmux-complete.vim'                       " Add completion for text from tmux panel
"     " }}} Text Completion "
"     " Syntax highlight {{{ "
"     Plug 'pearance/vim-tmux', { 'for': 'tmux' }                 " Tmux configuration highlight
"     " }}} Syntax highlight "
" endif
" " }}} Tmux "
" " Git {{{ "
Plug 'tpope/vim-fugitive'                " Git plugin
Plug 'junegunn/gv.vim'                   " Git commit browser
Plug 'airblade/vim-gitgutter'            " Extencion for git
" Plug 'gregsexton/gitv', {'on': ['Gitv']} " Gitk for vim
" Plug 'tpope/vim-git'                     " git syntax highlight
Plug 'rhysd/committia.vim'               " extended commit message
Plug 'idanarye/vim-merginal'             " a nice inteface for dealing with Git branches
" " }}} Git "
" Search {{{ "
Plug 'osyo-manga/vim-over'            " Replace highlighter
Plug 'mileszs/ack.vim'                " Run ack in vim
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
" Plug 'tpope/vim-vinegar'              " vinegar.vim enhances netrw
" Plug 'francoiscabrol/ranger.vim'      " Integrate ranger file manager to vim
" }}} File Tree "
" Text manipulation {{{ "
" Plug 'wellle/targets.vim'             " Add various text objects to VIM
Plug 'terryma/vim-multiple-cursors'   " Plugin for multiple cursors
Plug 'tmhedberg/matchit'              " Extend behavior of %
" Plug 'tpope/vim-repeat'               " Extend behavior of .
" Plug 'tpope/vim-surround'             " Work with surroundings in pairs.
" Plug 'junegunn/vim-easy-align'        " Vim alignment plugin
" Plug 'godlygeek/tabular'              " Also alignment plugin
" }}} Text manipulation "
" Common {{{ "
if v:version > 704 || (v:version == 704 && has('patch248'))     " systemlist function was added in patch 248
    Plug 'chrisbra/vim-diff-enhanced' " Diff viewer
endif
Plug 'mhinz/vim-startify'             " Nice start screen
Plug 'w0rp/ale'                       " Syntax checking plugin
Plug 'will133/vim-dirdiff'            " Dir diff viewer
" Plug 'jiangmiao/auto-pairs'           " Add auto-pairs
" Plug 'tpope/vim-unimpaired'           " Fast navigation
" Plug 'majutsushi/tagbar'              " Tagbar
Plug 'zefei/vim-wintabs'              " Separate tabs for windows
" Plug 'easymotion/vim-easymotion'      " Easy motion in files
" Plug 'EinfachToll/DidYouMean'         " Make a suggestion which file did you want to open
Plug 'farmergreg/vim-lastplace'       " Intelligently reopen files at your last edit position
" Plug 'qpkorr/vim-renamer'             " Rename list of files
" }}} Common "
" View {{{ "
Plug 'vim-scripts/LargeFile'          " Enable big files support for vim
Plug 'yggdroot/indentline'            " Displaying thin vertical lines at each indentation level
" Plug 'ntpeters/vim-better-whitespace' " Highlight whitespaces
" Plug 'chrisbra/Colorizer'             " A plugin to color colornames and codes
" Plug 'powerman/vim-plugin-AnsiEsc'    " Enable highlighting AnsiEsc in vim
Plug 'morhetz/gruvbox'                " Color scheme
" }}} View "
" Other {{{ "
" Plug 'itchyny/calendar.vim'           " Calendar in VIM
" Plug 'vimwiki/vimwiki'                " Organize notes
" "Plug 'kuoe0/vim-janitor'              " Clean up blank lines and spaces
Plug 'chiphogg/vim-prototxt'          " Enable prototxt support
" Plug 'fidian/hexmode'                 " Enable HEX editor
" Plug 'vim-scripts/DoxygenToolkit.vim' " Enable doxygen support
Plug 'skywind3000/quickmenu.vim'      " Quickmenu for launch configurations
Plug 'manasthakur/vim-sessionist'       " Vim sessions
" }}} Other "

call plug#end()

let g:plug_threads = 8
