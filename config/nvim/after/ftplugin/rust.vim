setlocal shiftwidth=4
setlocal softtabstop=4
setlocal textwidth=100

if !exists("g:async_command") 
    let g:async_command = 'cargo build'
endif

nnoremap <buffer> <Leader>/ :wa<CR>:RunAsync cargo
