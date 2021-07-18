if !exists(':ALEInfo')
    finish
endif

" Let ALE and Coc work together
" https://github.com/dense-analysis/ale#5iii-how-can-i-use-ale-and-cocnvim-together
let g:ale_disable_lsp = 1

let g:ale_linters = {
\   'tex': ['chktex'],
\   'python': ['pydocstyle', 'pylint', 'flake8'],
\}

let g:ale_tex_chktex_options = '--nowarn 1 -I'

let g:ale_fixers = {'python': ['isort', 'black']}
