function! StripTrailingWhitespace() abort
    " Only strip if the b:noStripeWhitespace variable isn't set
    if exists('b:noStripWhitespace')
      return
    endif
    %s/\s\+$//e
endfun

augroup StripTrailingWhitespace
    autocmd!
    autocmd FileType diff,vim,markdown let b:noStripWhitespace=1
    autocmd BufWritePre * call StripTrailingWhitespace()
augroup END
