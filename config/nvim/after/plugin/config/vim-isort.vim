if !exists(':Isort')
    finish
endif

let g:vim_isort_config_overrides = {
            \ "multi_line_output": 3,
            \ "include_trailing_comma": "True",
            \ "force_grid_wrap": 0,
            \ "use_parentheses": "True",
            \ "ensure_newline_before_comments": "True"
            \ }

autocmd BufWritePre *.py :Isort
