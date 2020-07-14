if !exists(':AsyncRun')
    finish
endif

nnoremap <silent> <Leader><space> :wa<CR>:RunAsync<CR>
nnoremap <Leader>/ :wa<CR>:RunAsync 
