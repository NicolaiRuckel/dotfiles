runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" ######################
" general settings
" ######################

filetype plugin indent on
set cc=80
set ff=unix
colorscheme molokai

"backspace working in vim 7.3
set bs=2

"set bg=dark
"
"moar colors
set t_Co=256
"make Line Numbers grey
hi LineNr ctermfg=darkgray
set mouse=nv
set shiftwidth=4
set encoding=utf-8
set tabstop=4
set expandtab
"Always show current position
set ruler
"Turn on wildmenu
set wildmenu
"files not shown in wild menu
set wildignore=*.o,*.obj,*.exe,*~,*.swp,*.log,*.out
set history=700
" Turn backup off, since all important stuff is in git anyway...
"set nobackup
set nowb
set noswapfile
set noerrorbells
set novisualbell
set tm=500
syntax on
set number
set ai
set si
set scrolloff=5

set dictionary+=/usr/share/dict/american-english
set dictionary+=/usr/share/dict/ngerman

set list
set lcs=tab:▸\ 

" ######################
" search settings
" ######################

set smartcase
set ignorecase
set incsearch
set hlsearch


" ######################
" keybindings
" ######################

inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

"use space for folding and unfolding
nnoremap <space> za

nmap <Leader>e :NERDTreeToggle<CR>

"F3 for paste
set pt=<F3>

"compile LaTeX-file and open output
map <leader>t :! pdflatex %; open %:r.pdf<CR>
command W w
command Q q

" ######################
" rules
" ######################
if has("autocmd")
    autocmd FileType make setlocal ts=8 sw=8 noet
    autocmd FileType html setlocal ts=2 sw=2 et cc= omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css setlocal ts=2 sw=2 et cc= omnifunc=csscomplete#CompleteCSS
    autocmd FileType javascript setlocal ts=4 sw=4 et
    autocmd FileType c setlocal ts=4 sw=4 noet
    autocmd FileType ada setlocal ts=3 sw=3 et
    autocmd FileType tex setlocal ts=2 sw=2 et
    autocmd FileType python setlocal ts=2 sw=2 et
endif

" ######################
" plugins
" ######################

let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
"let g:syntastic_mode_map = { 'mode': 'active',
"                               \ 'passive_filetypes': ['html'] }

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

"nerdtree
let NERDTreeIgnore=['\.swp$', '\.o$', '\.ali$', '\.swo$', '\*$']
let NERDTreeMouseMode=2
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif "close NT if last window
