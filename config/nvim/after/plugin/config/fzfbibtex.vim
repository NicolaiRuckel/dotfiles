" fzf bibtex
" from: https://github.com/msprev/fzf-bibtex
" Requirements
"   go get github.com/msprev/fzf-bibtex/cmd/bibtex-ls
"   go install github.com/msprev/fzf-bibtex/cmd/bibtex-ls
"   go install github.com/msprev/fzf-bibtex/cmd/bibtex-markdown
"   go install github.com/msprev/fzf-bibtex/cmd/bibtex-cite
function! Bibtex_ls() abort
    let bibfiles = (
                \ globpath('.', '*.bib', v:true, v:true) +
                \ globpath('$TEXMFHOME/bibtex/bib/bibliography/', '*.bib', v:true, v:true) +
                \ globpath('*/', '*.bib', v:true, v:true)
                \ )
    let bibfiles = join(bibfiles, ' ')
    let source_cmd = 'bibtex-ls '.bibfiles
    return source_cmd
endfunction

function! s:bibtex_cite_sink_insert(lines) abort
    let r=system('bibtex-cite -prefix="\cite{" -postfix="}" -separator=", " ', a:lines)
    execute ':normal! a' . r
    call feedkeys('a', 'n')
endfunction

inoremap <silent> @@ <c-g>u<c-o>:call fzf#run({
                        \ 'source': Bibtex_ls(),
                        \ 'sink*': function('<sid>bibtex_cite_sink_insert'),
                        \ 'up': '40%',
                        \ 'options': '--ansi --layout=reverse-list --multi --prompt "Cite> "'})<CR>
