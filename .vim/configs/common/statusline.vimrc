" Common
set laststatus=2        " Always show statusline
let g:use_delimiters = 1


" delimiters{{{ "
if !exists('g:use_delimiters') || !g:use_delimiters
    let left_sep = ""
    let right_sep = ""
else
    let left_sep = "\ue0b0"
    let right_sep = "\ue0b2"
endif
" }}} Delimiters "
" Status line modes {{{ "
let g:currentmode={
    \ 'n'  : 'N',
    \ 'no' : 'N·Operator Pending',
    \ 'v'  : 'V',
    \ 'V'  : 'V·Line',
    \ '' : 'V·Bloc',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ '' : 'S·Block',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'Rv' : 'V·Replace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal',
\}
" }}} Status line modes "
" Default colors {{{ "
" Dark gruvbox
if !(has('termguicolors') && &termguicolors) && !has('gui_running')
    let colorType='cterm'
    let colorsAndModes= {
                \ 'n'           : 214,
                \ 'i'           : 109,
                \ 'v'           : 175,
                \ 'V'           : 175,
                \ ''          : 175,
                \ 'R'           : 208,
                \ 'statFg'      : 15,
                \ 'bg0'         : 236,
                \ 'bg1'         : 243,
                \ 'red'         : 167,
                \}
    let inactiveColorsAndModes= {
                \ 'n'           : 172,
                \ 'i'           : 66,
                \ 'v'           : 132,
                \ 'V'           : 132,
                \ ''          : 132,
                \ 'R'           : 166,
                \ 'statFg'      : 244,
                \ 'bg0'         : 234,
                \ 'bg1'         : 237,
                \ 'red'         : 124,
                \}
else
    let colorType='gui'
    let colorsAndModes= {
                \ 'n'           : '#fabd2f',
                \ 'i'           : '#83a598',
                \ 'v'           : '#d3869b',
                \ 'V'           : '#d3869b',
                \ ''          : '#d3869b',
                \ 'R'           : '#fe8019',
                \ 'statFg'      : '#ffffff',
                \ 'bg0'         : '#32302f',
                \ 'bg1'         : '#7c6f64',
                \ 'red'         : '#fb4934',
                \}
    let inactiveColorsAndModes= {
                \ 'n'           : '#d79921',
                \ 'i'           : '#458588',
                \ 'v'           : '#b16286',
                \ 'V'           : '#b16286',
                \ ''          : '#b16286',
                \ 'R'           : '#d65d0e',
                \ 'statFg'      : '#808080',
                \ 'bg0'         : '#1d2021',
                \ 'bg1'         : '#3c3836',
                \ 'red'         : '#cc241d',
                \}
endif
" }}} Default colors "
" Status line color function {{{ "
function! ChangeAccentColor(active)
    let accentColor=get(g:colorsAndModes, mode(), g:colorsAndModes['red'])
    let red = g:colorsAndModes['red']
    let statFg = g:colorsAndModes['statFg']
    let bg0 = g:colorsAndModes['bg0']
    let bg1 = g:colorsAndModes['bg1']

    if !a:active
        let accentColor=get(g:inactiveColorsAndModes, mode(), g:inactiveColorsAndModes['red'])
        let red = g:inactiveColorsAndModes['red']
        let statFg = g:inactiveColorsAndModes['statFg']
        let bg0 = g:inactiveColorsAndModes['bg0']
        let bg1 = g:inactiveColorsAndModes['bg1']
    endif
    " Status line background
    " Modified color
    execute 'hi statusModified '.g:colorType.'fg='.red.' '.g:colorType.'bg='.bg0
    execute 'hi statusBackground '.g:colorType.'fg='.statFg.' '.g:colorType.'bg='.bg0
    execute 'hi statusBackgroundBg1 '.g:colorType.'fg='.statFg.' '.g:colorType.'bg='.bg1
    " Workaround for mode background
    execute 'hi statusModeBackground '.g:colorType.'fg='.statFg.' '.g:colorType.'bg='.accentColor.' '.g:colorType.'=bold'

    execute 'hi statusReverseAccentBg0 '.g:colorType.'fg='.accentColor.' '.g:colorType.'bg='.bg0.' '.g:colorType.'=bold'
    execute 'hi statusReverseAccentBg1 '.g:colorType.'fg='.accentColor.' '.g:colorType.'bg='.bg1.' '.g:colorType.'=bold'
    execute 'hi statusReverseBg1 '.g:colorType.'fg='.bg1.' '.g:colorType.'bg='.bg0.' '.g:colorType.'=bold'

    execute 'hi TabLineSel '.g:colorType.'fg='.statFg.' '.g:colorType.'=bold '.g:colorType.'bg='.accentColor
    execute 'hi TabLine '.g:colorType.'bg='.bg0.' '.g:colorType.'fg='.accentColor
    execute 'hi CursorLineNr '.g:colorType.'fg='.accentColor
    return ''
endfunction
" }}} Status line color function "
" Common functions {{{ "
" Find out current buffer's size and output it.
function! FileSize()
    let bytes = getfsize(expand('%:p'))
    if (bytes >= 1024)
        let kbytes = bytes / 1024
    endif
    if (exists('kbytes') && kbytes >= 1000)
        let mbytes = kbytes / 1000
    endif

    if bytes <= 0
        return '0'
    endif

    if (exists('mbytes'))
        return mbytes . 'MB'
    elseif (exists('kbytes'))
        return kbytes . 'KB'
    else
        return bytes . 'B'
    endif
endfunction

function! PasteMode()
    if &paste
        return ': PASTE '
    else
        return ''
endfunction

function! ReadOnly()
    if &readonly || !&modifiable
        if g:isWindows
            return '[ro]'
        endif
        return ''
    else
        return ''
endfunction

function! GitInfo()
    let git = fugitive#head()
    if git != ''
        if g:isWindows
            return 'git:'.fugitive#head()
        endif
        return ' '.fugitive#head()
    else
        return ''
    endif
endfunction

function! CTagsInfo()
    if (!exists('g:loaded_gutentags'))
        return ''
    endif
    return  gutentags#statusline('[', ']')
endfunction
" }}} Common functions "
" Sections {{{ "
function! Section1(active, size)
    let statLine = "%#statusModeBackground#"                                    " Switch to statusModeBackground hi group
    let statLine .= " "                                                         " Space
    let statLine .= "%{toupper(g:currentmode[mode()])}"                         " Current mode
    let statLine .= " "                                                         " Space
    if a:active
        let statLine .= "%{PasteMode()}"                                        " Show paste mode if enabled
    endif
    if a:size > 80
        let statLine .= "%#statusReverseAccentBg1#"                             " Left separator
    else
        let statLine .= "%#statusReverseAccentBg0#"                             " Left separator
    endif
    let statLine .= g:left_sep

    return statLine
endfunction

function! Section2(active, size)
    let statLine = ""                                                           " Switch to statusBackground hi group
    if a:size > 80
        let statLine .= "%#statusBackgroundBg1#"                                " Switch to statusBackground hi group
        let statLine .= " "                                                     " Space
        let statLine .= "%<%{GitInfo()}"                                        " Git Branch name
        let statLine .= " "                                                     " Space
        let statLine .= "%#statusReverseBg1#"                                   " Left separator
        let statLine .= g:left_sep
    endif

    return statLine
endfunction

function! Section3(active, size)
    let statLine = "%#statusBackground#"                                        " Switch to statusBackground hi group

    let statLine .= "[%n]"                                                      " buffernr
    let statLine .= " "                                                         " Space
    if !a:active
        let statLine .= "%<%t"                                                  " File name (only name)
    else
        let statLine .= "%<%f"                                                  " File name
    endif
    let statLine .= "%#statusModified#"                                         " Switch to statusModifien hi group
    let statLine .= "%m"                                                        " modified
    let statLine .= "%#statusBackground#"                                       " Switch to statusBackground hi group
    let statLine .= "%{ReadOnly()}%w"                                           " Is it read only file and preview windows flag [Preview]
    let statLine .= "%="                                                        " Long space
    return statLine
endfunction

function! Section4(active, size)
    let statLine = "%#statusReverseBg1#"                                        " Right separator
    let statLine .= g:right_sep
    let statLine .= "%#statusBackgroundBg1#"                                    " Switch to statusBackground hi group

    if a:size > 60
        let statLine .= "%<%{CTagsInfo()}"                                      " ctags type
        let statLine .= " "                                                     " Space
        let statLine .= "%y"                                                    " FileType
        let statLine .= " "                                                     " Space
    endif
    if a:active && a:size > 80
        let statLine .= "%{(&fenc!=''?&fenc:&enc)}"                             " Encoding
        let statLine .= " "                                                     " Space
        let statLine .= "[%{&ff}]"                                              " File format
        let statLine .= " "                                                     " Space
    endif
    let statLine .= "%(%{FileSize()}%)"                                         " File size
    let statLine .= " "                                                         " Space
    return statLine
endfunction

function! Section5(active, size)
    let statLine = ""
    if a:active
        let statLine .= "%#statusReverseAccentBg1#"                                " Right separator
        let statLine .= g:right_sep
        let statLine .= "%#statusModeBackground#"                               " Switch to statusModeBackground hi group
        let statLine .= " "                                                     " Space
        let statLine .= "%3p%%"                                                 " Total (%)
        let statLine .= " "                                                     " Space
        let statLine .= "l: %2l/%L, c: %c"                                      " Line and column
    endif
    return statLine
endfunction
" }}} Sections "

function! StatusLine(winnum)
    let active = a:winnum == winnr()
    let size = winwidth(a:winnum)
    let statLine = "%{ChangeAccentColor(".active.")}"                           " Changing the statusline color
    " Left {{{ "
    let statLine .= Section1(active, size)
    let statLine .= Section2(active, size)
    " }}} Left "
    let statLine .= Section3(active, size)
    " Right {{{ "
    let statLine .= Section4(active, size)
    let statLine .= Section5(active, size)
    " }}} Right "
    return statLine
endfunction

function! s:RefreshStatusLine()
    for nr in range(1, winnr('$'))
        call setwinvar(nr, '&statusline', '%!StatusLine('.nr.')')
    endfor
endfunction

augroup status
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * call <SID>RefreshStatusLine()
augroup END
