" Common
set laststatus=2        " Always show statusline
let use_delimiters = 1


" delimiters{{{ "
if !g:use_delimiters
    let left_sep = ""
    let left_alt_sep = ""
    let right_sep = ""
    let right_alt_sep = ""
else
    let left_sep = "\ue0b0"
    let left_alt_sep = "\ue0b1"
    let right_sep = "\ue0b2"
    let right_alt_sep = "\ue0b3"
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
                \ 'statBgFg'    : 15,
                \ 'statBgBg'    : 236,
                \ 'statModifFg' : 160,
                \ 'error'       : 161,
                \}
    let inactiveColorsAndModes= {
                \ 'n'           : 172,
                \ 'i'           : 66,
                \ 'v'           : 132,
                \ 'V'           : 132,
                \ ''          : 132,
                \ 'R'           : 166,
                \ 'statBgFg'    : 244,
                \ 'statBgBg'    : 234,
                \ 'statModifFg' : 88,
                \ 'error'       : 89,
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
                \ 'statBgFg'    : '#ffffff',
                \ 'statBgBg'    : '#32302f',
                \ 'statModifFg' : '#d70000',
                \ 'error'       : '#d7005f',
                \}
    let inactiveColorsAndModes= {
                \ 'n'           : '#d79921',
                \ 'i'           : '#458588',
                \ 'v'           : '#b16286',
                \ 'V'           : '#b16286',
                \ ''          : '#b16286',
                \ 'R'           : '#d65d0e',
                \ 'statBgFg'    : '#808080',
                \ 'statBgBg'    : '#1d2021',
                \ 'statModifFg' : '#870000',
                \ 'error'       : '#87005f',
                \}
endif
" }}} Default colors "
" Status line color function {{{ "
function! ChangeAccentColor(active)
    let accentColor=get(g:colorsAndModes, mode(), g:colorsAndModes['error'])
    let statBgFg = g:colorsAndModes['statBgFg']
    let statBgBg = g:colorsAndModes['statBgBg']
    let statModifFg = g:colorsAndModes['statModifFg']

    if !a:active
        let accentColor=get(g:inactiveColorsAndModes, mode(), g:inactiveColorsAndModes['error'])
        let statBgFg = g:inactiveColorsAndModes['statBgFg']
        let statBgBg = g:inactiveColorsAndModes['statBgBg']
        let statModifFg = g:inactiveColorsAndModes['statModifFg']
    endif
    " Status line background
    execute 'hi statusBackground '.g:colorType.'fg='.statBgFg.' '.g:colorType.'bg='.statBgBg
    " Modified color
    execute 'hi statusModified '.g:colorType.'fg='.statModifFg.' '.g:colorType.'bg='.statBgBg
    " Workaround for mode background
    execute 'hi statusModeBackground '.g:colorType.'fg='.statBgFg.' '.g:colorType.'bg='.accentColor.' '.g:colorType.'=bold'
    execute 'hi statusModeBackgroundReverse '.g:colorType.'fg='.accentColor.' '.g:colorType.'bg='.statBgBg.' '.g:colorType.'=bold'

    execute 'hi TabLineSel '.g:colorType.'fg='.statBgFg.' '.g:colorType.'=bold '.g:colorType.'bg='.accentColor
    execute 'hi TabLine '.g:colorType.'bg='.statBgBg.' '.g:colorType.'fg='.accentColor
    execute 'hi CursorLineNr '.g:colorType.'fg='.accentColor
    execute 'hi StatusLine '.g:colorType.'fg='.statBgFg.' '.g:colorType.'bg='.accentColor.' '.g:colorType.'=bold'
    execute 'hi StatusLineNC '.g:colorType.'fg='.statBgFg.' '.g:colorType.'bg='.accentColor.' '.g:colorType.'=NONE'
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
    return  gutentags#statusline('[', ']')
endfunction

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunctio
" }}} Common functions "

function! StatusLine(winnum)
    let active = a:winnum == winnr()
    let statLine  = ""
    " Left {{{ "
    let statLine .= "%{ChangeAccentColor(".active.")}"                          " Changing the statusline color
    let statLine .= "%#statusModeBackground#"                                   " Switch to statusModeBackground hi group
    let statLine .= " "                                                         " Space
    let statLine .= "%{toupper(g:currentmode[mode()])}"                         " Current mode
    let statLine .= " "                                                         " Space
    if active
        let statLine .= "%{PasteMode()}"                                        " Show paste mode if enabled
    endif
    let statLine .= "%#statusModeBackgroundReverse#"                            " Left separator
    let statLine .= g:left_sep
    let statLine .= "%#statusBackground#"                                       " Switch to statusBackground hi group
    let statLine .= " "                                                         " Space
    let statLine .= "[%n]"                                                      " buffernr
    let statLine .= " "                                                         " Space
    if winwidth(a:winnum) > 80
        let statLine .= "%<%{CTagsInfo()}"                                      " ctags type
        let statLine .= " "                                                     " Space
        let statLine .= "%<%{GitInfo()}"                                        " Git Branch name
        let statLine .= " "                                                     " Space
    endif
    if !active
        let statLine .= "%<%t"                                                  " File name (only name)
    else
        let statLine .= "%<%f"                                                  " File name
    endif
    let statLine .= "%#statusModified#"                                         " Switch to statusModifien hi group
    let statLine .= "%m"                                                        " modified
    let statLine .= "%#statusBackground#"                                       " Switch to statusBackground hi group
    let statLine .= "%{ReadOnly()}%w"                                           " Is it read only file and preview windows flag [Preview]
    let statLine .= " "                                                         " Space
    if active && winwidth(a:winnum) > 80
        if exists('*SyntasticStatuslineFlag')
            let statLine .= "%#warningmsg#"                                     " Switch to warning hi group
            let statLine .= "%{SyntasticStatuslineFlag()}"                      " Syntastic errors
        endif
        let statLine .= "%#statusBackground#"                                   " Switch to statusBackground hi group
        let statLine .= " "                                                     " Space
    endif
    " }}} Left "
    let statLine .= "%="                                                        " Long space
    " Right {{{ "
    if winwidth(a:winnum) > 60
        let statLine .= "%y"                                                    " FileType
        let statLine .= " "                                                     " Space
    endif
    if active && winwidth(a:winnum) > 80
        let statLine .= "%{(&fenc!=''?&fenc:&enc)}"                             " Encoding
        let statLine .= " "                                                     " Space
        let statLine .= "[%{&ff}]"                                              " File format
        let statLine .= " "                                                     " Space
    endif
    let statLine .= "%(%{FileSize()}%)"                                         " File size
    let statLine .= " "                                                         " Space
    if active
        let statLine .= "%#statusModeBackgroundReverse#"                        " Right separator
        let statLine .= g:right_sep
        let statLine .= "%#statusModeBackground#"                               " Switch to statusModeBackground hi group
        let statLine .= " "                                                     " Space
        let statLine .= "%3p%%"                                                 " Total (%)
        let statLine .= " "                                                     " Space
        let statLine .= "l: %2l/%L, c: %c"                                      " Line and column
        let statLine .= " "                                                     " Space
        let statLine .= "%{LinterStatus()}"
    endif
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
