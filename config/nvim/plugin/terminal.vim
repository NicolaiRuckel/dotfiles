" Esc to exit terminal mode
tnoremap <Esc> <C-\><C-n>

" Set terminal colorscheme
let g:terminal_color_0  = '#303030'
let g:terminal_color_1  = '#ff5f5f'
let g:terminal_color_2  = '#afd787'
let g:terminal_color_3  = '#d7d7af'
let g:terminal_color_4  = '#87d7ff'
let g:terminal_color_5  = '#d7afd7'
let g:terminal_color_6  = '#87d7af'
let g:terminal_color_7  = '#d7d7d7'
let g:terminal_color_8  = '#303030'
let g:terminal_color_9  = '#ff5f5f'
let g:terminal_color_10 = '#afd787'
let g:terminal_color_11 = '#d7d7af'
let g:terminal_color_12 = '#87d7ff'
let g:terminal_color_13 = '#d7afd7'
let g:terminal_color_14 = '#87d7af'
let g:terminal_color_15 = '#d7d7d7'

" fix a problem with the interactive terminal and vim-fugitive
" see: https://github.com/tpope/vim-fugitive/issues/957
augroup nvim_term
    autocmd!
    autocmd TermOpen * startinsert
    autocmd TermClose * stopinsert
augroup END
