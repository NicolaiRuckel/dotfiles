if !exists(':Git')
    finish
endif

nnoremap <C-s> :Git<CR>

" asynchrone `git push`
command! -bang -bar -nargs=* Gpush execute 'Dispatch<bang> -dir=' .
      \ fnameescape(FugitiveGitDir()) 'git push' <q-args>
