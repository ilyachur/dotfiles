" ferret

" Disable \v mode
let g:FerretVeryMagic = 0

let g:FerretExecutableArguments = {
            \ 'rg': '--vimgrep --no-heading --no-config --max-columns 4096 --hidden --smart-case',
            \ }
