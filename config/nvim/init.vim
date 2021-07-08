""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Plug
" https://github.com/junegunn/vim-plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/vista.vim'
Plug 'https://github.com/yegappan/taglist'
Plug 'dense-analysis/ale'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'rhysd/git-messenger.vim'
Plug 'https://github.com/esneider/YUNOcommit.vim'
Plug 'https://github.com/mhinz/vim-signify'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/tpope/vim-unimpaired'
Plug 'jmckiern/vim-venter'
Plug 'skywind3000/asyncrun.vim'
Plug 'micarmst/vim-spellsync'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/EinfachToll/DidYouMean'
Plug 'lervag/vimtex'
Plug 'https://github.com/fisadev/vim-isort'
Plug 'rust-lang/rust.vim'
Plug 'https://github.com/arzg/vim-rust-syntax-ext'
Plug 'https://github.com/plasticboy/vim-markdown'
Plug 'https://github.com/cespare/vim-toml'
Plug 'https://github.com/tpope/vim-dispatch'
call plug#end()

" Automatically install plugins
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

set exrc                    " run .exrc files if present
set secure

set fileformat=unix         " set fileformat to unix
set encoding=utf-8          " because other encodings are stupid
set backspace=2             " make backspace working in vim 7.3
set timeoutlen=500          " set timeoutlen to 500
set splitright
set splitbelow
"
" virtual line breaks on word boundaries with correct indentation
set linebreak
set breakindent

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Set the terminal's title
set title

" Minimal width of split windows. This should be enough for 80 characters and
" Git indicators.
set winwidth=82

""" Backup, Swap and Undo
set undofile                " persistent undo
set directory=~/.config/nvim/swap,/tmp
set undodir=~/.config/nvim/undo,/tmp
set backup
set backupskip=/tmp/*,/private/tmp/*
set backupdir=~/.config/nvim/backup,/tmp
set writebackup

""" NetRW
let g:netrw_liststyle = 1 " Detail View
let g:netrw_sizestyle = "H" " Human-readable file sizes
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+' " hide dotfiles
" let g:netrw_list_hide='\.swp$,\.o$,\.ali$,\.swo$,\.pyc$'
let g:netrw_hide = 1 " hide dotfiles by default
let g:netrw_banner = 0 " Turn off banner

""" Dictionary
set dictionary+=/usr/share/dict/american-english
set dictionary+=/usr/share/dict/ngerman

""" Spell
set spelllang=en,de_20

" use <C-l> to correct previous spelling mistake
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

""" Colors
set t_Co=256                " more colors for more fun!
set termguicolors

colorscheme lucius
LuciusWhite

set background=light        " light background
syntax enable               " enable syntax processing
set conceallevel=0          " Just show me the code and don't try to be smart

""" Spaces and Tabs
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab

""" UI Config
set number                  " show line numbers
set showcmd                 " show command in bottom bar
set cursorline              " highlight current line
set autoindent
filetype plugin indent on   " load filetype-specific indent files and plugins

" Bash-like completion in wild menu
" see https://stackoverflow.com/questions/526858/how-do-i-make-vim-do-normal-bash-like-tab-completion-for-file-names
set wildmode=longest,list,full
set wildmenu                " visual autocomplete for command menu
set wildignore+=*.o,*.obj,*.exe,*~,*.swp,*.log,*.out,*.ali,*.zip,*/obj/*,*.gcno
set wildignore+=*.git/*,*.pyc
set wildignorecase
set wildcharm=<Tab>

set lazyredraw              " redraw only when we need to
set showmatch               " highlight matching [{()}]

" Highlight column *after* current textwidth
set colorcolumn=+1
set history=10000           " vim has to remember a lot of commands
set mouse=nv                " allows usage of mouse
set ruler                   " show ruler
set scrolloff=5             " minimum number of lines above and below the cursor
set list                    " make whitespace characters visible
set lcs=tab:▸\ ,trail:·     " symbols for tabs and trailing whitespaces

" Searching
set incsearch               " search as characters are entered
set hlsearch                " highlight matches
set smartcase
set ignorecase

" Substition
"get an incremental visual feedback when doing the substitude command.
set inccommand=split

" turn of search highlight
" this did strange things in vim but hopefully works in nvim
nnoremap <silent> <ESC> :noh<CR><ESC>

" Folding
set foldenable              " enable folding
set foldlevelstart=10       " open most folds by default
set foldnestmax=10          " 10 nested fold max
set foldmethod=indent       " fold based on indent level

" Automatically check if opened file has changed on focus gain like gvim does.
" see https://github.com/neovim/neovim/issues/1936
set autoread
augroup Focus
    autocmd!
    autocmd FocusGained * :checktime
augroup END
