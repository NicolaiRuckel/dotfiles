let g:ale_linters = {
\   'tex': ['lacheck', 'proselint'],
\   'python': ['pylint', 'flake8'],
\}

let g:ale_fixers = {'python': ['isort', 'black']}
