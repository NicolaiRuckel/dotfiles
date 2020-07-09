" enable statusline all the time
set laststatus=2

function! GitBranch()
    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
    let l:branchname = GitBranch()
    return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

" AsyncRun
function! RunAsync(...)
    if a:0 == 1
        let g:async_command = a:1
    elseif !exists("g:async_command")
        let g:async_command = 'make'
    endif
    exec "AsyncRun " . g:async_command
endfunction
command! -nargs=? RunAsync :call RunAsync(<f-args>)

function! Get_asyncrun_status()
    let async_status = g:asyncrun_status
    if async_status == 'running'
        return g:async_command . ' •'
    elseif async_status == 'success'
        return g:async_command . ' ✔'
    elseif async_status == 'failure'
        return g:async_command . ' ✘'
    else
        return ''
    endif
endfunction

set statusline=                       " Custom status line
set statusline+=%#PmenuSel#           " Show git branch if it exists
set statusline+=%{StatuslineGit()}
set statusline+=%#CursorColumn#
set statusline+=\ %f                  " Show file name
set statusline+=%m\                   " Show whether file has been modified
set statusline+=%=                    " Right align the following
set statusline+=%{Get_asyncrun_status()}
set statusline+=\ %y                  " Filetype
set statusline+=\ %{&fileencoding?&fileencoding:&encoding} " File encoding
set statusline+=\[%{&fileformat}\]    " File format
set statusline+=\ %p%%                " Percentage through file
set statusline+=\ %l:%c               " Line number:Column number
set statusline+=\
