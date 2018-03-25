if !exists('g:esearch')
    let g:esearch = {}
endif
let g:esearch.backend = 'system'

if v:version >= 800
    let g:esearch.backend = 'vim8'
elseif has('nvim')
    let g:esearch.backend = 'nvim'
endif

if executable('rg')
    let g:esearch.adapter = 'rg'
    let g:esearch#adapter#rg#options = '--vimgrep --smart-case --hidden'
endif

let g:esearch.use = ['visual', 'hlsearch', 'last']
let g:esearch.out = 'win' " 'qflist'
let g:esearch.batch_size = 1000
