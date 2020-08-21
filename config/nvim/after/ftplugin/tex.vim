setlocal textwidth=0
setlocal spell
syntax spell toplevel

if exists(':VimtexInfo')
    nnoremap <silent> <Leader><space> :wa<CR>:VimtexCompile<CR>
endif
