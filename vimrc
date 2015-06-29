""""""""""""""
"" PATHOGEN ""
""""""""""""""
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()


""""""""""""""""""""""
"" GENERAL SETTINGS ""
""""""""""""""""""""""

filetype plugin indent on
set cc=80
set tw=80
set formatoptions+=t
set ff=unix
set cursorline

"moar colors
set t_Co=256
colorscheme lucius
set bg=dark

set history=10000

" make backspace working in vim 7.3
set bs=2

set mouse=nv
set shiftwidth=4
set encoding=utf-8
set tabstop=4
set expandtab
set ruler
set tm=500
syntax on
set number
set ai
set si
set scrolloff=5

set dictionary+=/usr/share/dict/american-english
set dictionary+=/usr/share/dict/ngerman

set list
set lcs=tab:▸\ ,trail:_

set undofile


"""""""""""""""
"" WILD MENU ""
"""""""""""""""

set wildmenu
set wildmode=full
set wildignore=*.o,*.obj,*.exe,*~,*.swp,*.log,*.out
set wildignorecase
set wildcharm=<Tab>


"""""""""""""""""""""
"" SEARCH SETTINGS ""
"""""""""""""""""""""

set smartcase
set ignorecase
set incsearch
set hlsearch


"""""""""""""""""
"" KEYBINDINGS ""
"""""""""""""""""

let mapleader = ","


nnoremap ; :

nmap <Leader>e :NERDTreeToggle<CR>

"F3 for paste
set pt=<F3>

command W w
command Q q

nnoremap <C-Up> :call AdjustFontSize(1)<CR>:echo &guifont<CR>
nnoremap <C-Down> :call AdjustFontSize(-1)<CR>:echo &guifont<CR>

nnoremap <leader>w <C-w>v<C-w>l

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" turn of search highlight
nnoremap <leader><space> :noh<cr>


"""""""""""
"" RULES ""
"""""""""""

if has("autocmd")
    autocmd FileType make setlocal ts=8 sw=8 noet
    autocmd FileType html setlocal ts=2 sw=2 et omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css setlocal ts=2 sw=2 et omnifunc=csscomplete#CompleteCSS
    autocmd FileType javascript setlocal ts=4 sw=4 et
    autocmd FileType c setlocal ts=4 sw=4 noet
    autocmd FileType ada setlocal ts=3 sw=3 et
    autocmd FileType tex setlocal ts=2 sw=2 et
    autocmd FileType python setlocal ts=2 sw=2 et
endif


"""""""""""""
"" PLUGINS ""
"""""""""""""

" CtrlP
nnoremap <Leader>e :CtrlP<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>m :CtrlPMRUFiles<CR>
nnoremap <Leader>c :CtrlP %:h<CR>
"let g:ctrlp_match_window = 'max:50,results:50'
let g:ctrlp_reuse_window = 'help'

let g:netrw_list_hide='\.swp$,\.o$,\.ali$,\.swo$,\.pyc$'


" Y U NO COMMIT AFTER 20 LINES???!?!
let g:YUNOcommit_after = 20


let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'


"airline
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
let g:airline_section_z = '%3l,%-3c %P'


"nerdtree
let NERDTreeIgnore=['\.swp$', '\.o$', '\.ali$', '\.swo$', '\*$']
let NERDTreeMouseMode=2
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif "close NT if last window


"taglist
let Tlist_Use_Right_Window=1
let Tlist_Exit_OnlyWindow=1
nnoremap <Leader>t :TlistToggle<CR>


"""""""""""""""
"" FUNCTIONS ""
"""""""""""""""

function! AdjustFontSize(amount)
  let &guifont=substitute(&guifont,'\zs\d\+','\=eval(submatch(0)+a:amount)','')
endfunction
