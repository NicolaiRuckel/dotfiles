if !exists(':CocInfo')
    finish
endif

autocmd FileType json syntax match Comment +\/\/.\+$+

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use `[g` and `]g` to navigate diagnostics
nnoremap <silent> [g <Plug>(coc-diagnostic-prev)
nnoremap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for format selected region
xmap <leader>ff  <Plug>(coc-format-selected)
nmap <leader>ff  <Plug>(coc-format-selected)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

function! s:show_documentation() abort
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

let g:coc_global_extensions = [
      \ 'coc-json',
      \ 'coc-pyright',
      \ 'coc-java',
      \ 'coc-vimtex',
      \ 'coc-highlight',
      \ 'coc-html',
      \ 'coc-css',
      \ 'coc-rls',
      \ 'coc-rust-analyzer',
      \ 'coc-vimlsp',
      \ 'coc-github',
      \ 'coc-docker',
      \ 'coc-sh',
      \ 'coc-markdownlint',
      \ 'coc-tag',
      \ 'coc-emoji',
      \]

" Show documentation with K
nnoremap <silent> K :call <SID>show_documentation()<CR>
