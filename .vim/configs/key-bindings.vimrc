" Common {{{ "
" Leader key mapping {{{ "
" Map leader key to custom
let mapleader=","
" \ works instead of ,
noremap \ ,
" }}} Leader key mapping "
" History key mapping {{{ "
" Trick from 'Practical VIM' filtering for history
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
" }}} History key mapping "
" Hot keys to change window size {{{ "
nmap <C-h> <c-w><
nmap <C-l> <c-w>>
nmap <C-j> <c-w>-
nmap <C-k> <c-w>+
" }}} Hot keys to change window size "
" Copy and paste mapping {{{ "
" Copy and paste to system buffer
nnoremap <C-y> "+Y
vnoremap <C-y> "+y
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP

if has("gui_running")
    map  <silent>  <S-Insert>  "+p
    imap <silent>  <S-Insert>  <Esc>"+pa
endif

" 'global' buffer from file
vmap <leader>y :w! ~/.vim/.glob_buf<CR>
nmap <leader>y :.w! ~/.vim/.glob_buf<CR>
nmap <leader>p :r ~/.vim/.glob_buf<CR>
nmap <leader>P k:r ~/.vim/.glob_buf<CR>
" }}} Copy and paste mapping "
" }}} Common "
" Search {{{ "
" FZF {{{ "
function! s:FZFSession(...)
    if exists(':FZF')
        return fzf#run({
                    \ 'source': ctrlp_session#list(),
                    \ 'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index',
                    \ 'down':    '40%',
                    \ 'sink':    function('ctrlp_session#load')})
    endif
endfunction

nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>h :History<CR>
nnoremap <silent> <leader>: :History:<CR>
nnoremap <silent> <leader>t :FZFCMakeSelectTarget<CR>
nnoremap <silent> <leader>s :call <SID>FZFSession()<CR>
" }}} FZF "
" Makes * and # work on visual mode too {{{ "
function! s:VSetSearch(cmdtype)
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n',
    'g')
    let @s = temp
endfunction

xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>
" }}} Makes * and # work on visual mode too "
nmap <leader>ff <Plug>(FerretAck)
nmap <leader>fr <Plug>(FerretAcks)
nmap <silent> <leader>fw <Plug>(FerretAckWord)
" Search workspace symbols
nnoremap <silent> <leader>fs :<C-u>CocList -I symbols<cr>
" Find symbol of current document
nnoremap <silent> <leader>fl :<C-u>CocList outline<cr>
" }}} Search "
" Files navigation {{{ "
" Tabs {{{ "
map gw <Plug>(wintabs_next)
map gW <Plug>(wintabs_previous)
map <leader>q <Plug>(wintabs_close)
" }}} Tabs "
map <leader>fm :EditVifm<CR>
" }}} Files navigation "
" Development {{{ "
" Compile key mapping {{{ "
nnoremap <silent> <leader>r :CMake<CR>
nnoremap <F5> :CMakeBuild<CR>
" }}} Compile key mapping "
" Debugger {{{ "
nnoremap <silent> <leader>ds   :call vimspector#Launch()<CR>
nnoremap <silent> <F9>         :call vimspector#Continue()<CR>
nnoremap <silent> <leader>dk   :call vimspector#Reset()<CR>
nnoremap <silent> <leader>dr   :call vimspector#Restart()<CR>
nnoremap <silent> <leader>dp   :call vimspector#Pause()<CR>
nnoremap <silent> <leader>db   :call vimspector#ToggleBreakpoint()<CR>
nnoremap <silent> <leader>df   :call vimspector#AddFunctionBreakpoint( expand( '<cexpr>'  )  )<CR>
nnoremap <silent> <F8>         :call vimspector#StepOver()<CR>
nnoremap <silent> <F7>         :call vimspector#StepInto()<CR>
nnoremap <silent> <F6>         :call vimspector#StepOut()<CR>
" }}} Debugger "
" LSP {{{ "
" Remap keys for gotos
nmap <silent> <leader>g <Plug>(lsp-definition)
nmap <silent> <leader>gt <Plug>(lsp-type-definition)
nmap <silent> <leader>gi <Plug>(lsp-implementation)
nmap <silent> <leader>gr <Plug>(lsp-references)

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(lsp-previous-diagnostic)
nmap <silent> ]g <Plug>(lsp-next-diagnostic)

" Remap for rename current word
nmap <leader>rn <Plug>(lsp-rename)
nmap <silent> <leader>qf <Plug>(lsp-code-action-float)

" }}} LSP "
" VCS {{{ "
nnoremap <silent> <leader>vs :Gstatus<CR>
nnoremap <silent> <leader>vb :Gblame<CR>
nnoremap <silent> <leader>vc :Gcommit<CR>
nnoremap <silent> <leader>vca :Gcommit --amend<CR>
nnoremap <silent> <leader>vp :Gpush<CR>
nnoremap <silent> <leader>vpf :Gpush --force<CR>
nnoremap <silent> <leader>vP :Gpull<CR>
nnoremap <silent> <leader>vv :Gitv<CR>

nnoremap <silent> <leader>vu :SignifyHunkUndo<cr>

nmap <silent> ]c <plug>(signify-next-hunk)
nmap <silent> [c <plug>(signify-prev-hunk)
nmap ]C 9999]c
nmap [C 9999[c
" }}} VCS "
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%' " Get directory of current file
" }}} Development "
" Other {{{ "
" Reload vim configuration {{{ "
nnoremap <leader>rs :source ~/.vimrc<CR>
" }}} Reload vim configuration "
" }}} Other "
