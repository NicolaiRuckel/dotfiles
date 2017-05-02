" most settings and comments are taken from
" http://dougblack.io/words/a-good-vimrc.html

" Vim-Plug
" https://github.com/junegunn/vim-plug
call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'https://github.com/kien/ctrlp.vim'
Plug 'https://github.com/scrooloose/syntastic'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/jonathanfilip/vim-lucius'
Plug 'https://github.com/esneider/YUNOcommit.vim'
Plug 'https://github.com/mhinz/vim-signify'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/mhinz/vim-signify'
Plug 'https://github.com/neomake/neomake'

if exists('g:nyaovim_version')
" NyaoVim plugins
  Plug 'https://github.com/rhysd/nyaovim-markdown-preview'
endif

call plug#end()

" General
set fileformat=unix         " set fileformat to unix
set encoding=utf-8          " because other encodings are stupid
set bs=2                    " make backspace working in vim 7.3
set tm=500                  " set timeoutlen to 500

" Dictionary
set dictionary+=/usr/share/dict/american-english
set dictionary+=/usr/share/dict/ngerman

" Spell
set spelllang=en,de_20

" Colors
set t_Co=256                " more colors for more fun!
colorscheme lucius
set background=light        " light background
syntax enable               " enable syntax processing

" Spaces and Tabs
set tabstop=4               " number of visual spaces per TAB
set softtabstop=4           " number of spaces in tab when editing
set expandtab               " tabs are spaces

" UI Config
set number                  " show line numbers
set relativenumber          " show relative line numbers
set showcmd                 " show command in bottom bar
set cursorline              " highlight current line
set autoindent
set smartindent
filetype plugin indent on   " load filetype-specific indent files and plugins
set wildmenu                " visual autocomplete for command menu
set wildmode=full
set wildignore+=*.o,*.obj,*.exe,*~,*.swp,*.log,*.out,*.ali,*.zip,*/obj/*,*.gcno
set wildignore+=*.git/*,*.pyc
set wildignorecase
set wildcharm=<Tab>
set lazyredraw              " redraw only when we need to
set showmatch               " highlight matching [{()}]
set colorcolumn=80          " highlight 80th charactercoloumn
set textwidth=80
set history=10000           " vim has to remember a lot of commands
set mouse=nv                " allows usage of mouse
set ruler                   " show ruler
set scrolloff=5             " minimum number of lines above and below the cursor
set list                    " make whitespace characters visible
set lcs=tab:▸\ ,trail:_     " symbols for tabs and trailing whitespaces

" Searching
set incsearch               " search as characters are entered
set hlsearch                " highlight matches
set smartcase
set ignorecase

" turn of search highlight
" this did strange things in vim but hopefully works in nvim
nnoremap <silent> <ESC> :noh<CR><ESC>

" Folding {{{
set foldenable              " enable folding
set foldlevelstart=10       " open most folds by default
set foldnestmax=10          " 10 nested fold max
set foldmethod=indent       " fold based on indent level

" space open/closes folds
nnoremap <space> za

" Leader Shortcuts {{{
let mapleader=","           " leader is comma

nnoremap <leader>w <C-w>v<C-w>l

nnoremap <leader>v :vsplit<cr>

" " Copy to primary
vnoremap  <leader>y  "*y
nnoremap  <leader>Y  "*yg_
nnoremap  <leader>y  "*y

" " Paste from primary
nnoremap <leader>p "*p
nnoremap <leader>P "*P
vnoremap <leader>p "*p
vnoremap <leader>P "*P

nnoremap <Leader>. :wa<CR>:Neomake!<CR>
nnoremap <Leader>/ :w<CR>:Neomake<CR>

" Keybindings
nnoremap ; :

set pt=<F3>                 " paste mode

command W w
command Q q

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ------------------------------------------------------------------------------
" Plugins
" ------------------------------------------------------------------------------

" CtrlP
nnoremap <Leader>e :CtrlP<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>m :CtrlPMRUFiles<CR>
nnoremap <Leader>c :CtrlP %:h<CR>

"let g:ctrlp_match_window = 'max:50,results:50'
let g:ctrlp_reuse_window = 'help'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']

let g:netrw_list_hide='\.swp$,\.o$,\.ali$,\.swo$,\.pyc$'

" Y U NO COMMIT AFTER 20 LINES???!?!
let g:YUNOcommit_after = 20

" Taglist
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
let Tlist_Use_Right_Window=1
let Tlist_Exit_OnlyWindow=1

nnoremap <Leader>t :TlistToggle<CR>

" Airline
let g:airline_theme='papercolor'
set laststatus=2
set noshowmode
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.branch = '⎇'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
"let g:airline#extensions#syntastic#enabled = 1
let g:airline_detect_paste=1
let g:airline_symbols.readonly = ''
"let g:airline_section_a =
let g:airline_section_b = '%t'
let g:airline_section_c = ''
"let g:airline_section_b = '%{getcwd()}'
"let g:airline_section_c = '%t'
"let g:airline_section_z = '%3l,%-3c %P'
let g:airline_section_z = '%-3c %P'

" Nerdtree
let NERDTreeIgnore=['\.swp$', '\.o$', '\.ali$', '\.swo$', '\*$']
let NERDTreeMouseMode=2
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif "close NT if last window

nmap <Leader>e :NERDTreeToggle<CR>

" Markdown-Preview
if exists('g:nyaovim_version')
  let g:markdown_preview_eager = 1
  "let g:markdown_preview_no_default_mapping = 1
endif

" Neomake
let g:neomake_tex_enabled_makers = ['rubber']

" Autogroups
augroup configgroup
    autocmd!
    autocmd FileType make setlocal ts=8 sw=8 noet
    autocmd FileType html setlocal ts=2 sw=2 et omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css setlocal ts=2 sw=2 et omnifunc=csscomplete#CompleteCSS
    autocmd FileType javascript setlocal ts=4 sw=4 et
    autocmd FileType c setlocal ts=4 sw=4 noet
    autocmd FileType ada setlocal ts=3 sw=3 sts=3 et
    autocmd FileType tex setlocal ts=2 sw=2 et spell
    autocmd FileType python setlocal ts=2 sw=2 et
    autocmd FileType markdown setlocal ts=4 sw=4 formatoptions+=t spell
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
    autocmd BufEnter plaintex setlocal ts=2 sw=2 sts=2 spell
    autocmd FileType bib setlocal ts=2 sw=2 sts=2 et
augroup END

" Backups
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
"set undofile
