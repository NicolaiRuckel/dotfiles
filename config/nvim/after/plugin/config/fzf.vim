if !exists(':FZF')
    finish
endif

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

let g:fzf_files_options =
\ '--preview "(coderay {} || cat {}) 2> /dev/null | head -'.&lines.'"'

let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.85 } }

" Always enable preview window on the right with 60% width
let g:fzf_preview_window = 'right:60%'

" Customise the Files command to use rg which respects .gitignore files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#run(fzf#wrap('files', fzf#vim#with_preview({ 'dir': <q-args>, 'sink': 'e', 'source': 'rg --files --hidden' }), <bang>0))

" Add an AllFiles variation that ignores .gitignore files
command! -bang -nargs=? -complete=dir AllFiles
    \ call fzf#run(fzf#wrap('allfiles', fzf#vim#with_preview({ 'dir': <q-args>, 'sink': 'e', 'source': 'rg --files --hidden --no-ignore' }), <bang>0))

nnoremap <Leader>G :Ag<Cr>
nnoremap <Leader>g :Rg<Cr>
nnoremap <Leader>f :call fzf#vim#gitfiles('', fzf#vim#with_preview('right'))<CR>
nmap <leader>F :AllFiles<cr>
" nmap <Leader>f :GFiles<CR>
nnoremap <Leader>a :Files<CR>
nnoremap <Leader>l :BLines<CR>
nnoremap <Leader>L :Lines<CR>
nnoremap <Leader>t :BTags<CR>
nnoremap <Leader>T :Tags<CR>

augroup Fzf
    autocmd!
    autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>
augroup END
