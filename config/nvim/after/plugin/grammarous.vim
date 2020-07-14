if !exists(':GrammarousCheck')
    finish
endif
let g:grammarous#default_comments_only_filetypes = {
            \ '*' : 1, 'tex' : 0, 'markdown' : 0,
            \ }
