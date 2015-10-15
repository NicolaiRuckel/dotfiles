" most settings and comments are taken from
" http://dougblack.io/words/a-good-vimrc.html

" Pathogen {{{
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
" }}}
" General {{{
set fileformat=unix         " set fileformat to unix
set encoding=utf-8          " because other encodings are stupid
set bs=2                    " make backspace working in vim 7.3
set tm=500                  " set timeoutlen to 500
" }}}
" Dictionary {{{
set dictionary+=/usr/share/dict/american-english
set dictionary+=/usr/share/dict/ngerman
" }}}
" Colors {{{{
set t_Co=256                " more colors for more fun!
colorscheme lucius          " awesome colorscheme
set background=dark         " dark background
syntax enable               " enable syntax processing
" }}}
" Spaces and Tabs {{{
set tabstop=4               " number of visual spaces per TAB
set softtabstop=4           " number of spaces in tab when editing
set expandtab               " tabs are spaces
" }}}
" UI Config {{{
set number                  " show line numbers
set showcmd                 " show command in bottom bar
set cursorline              " highlight current line
set autoindent
set smartindent
filetype plugin indent on   " load filetype-specific indent files and plugins
set wildmenu                " visual autocomplete for command menu
set wildmode=full
set wildignore=*.o,*.obj,*.exe,*~,*.swp,*.log,*.out
set wildignorecase
set wildcharm=<Tab>
set lazyredraw              " redraw only when we need to
set showmatch               " highlight matching [{()}]
set colorcolumn=80          " highlight 80th charactercoloumn
set textwidth=80
set formatoptions+=t        " automatic word wrapping at 80 characters
set history=10000           " vim has to remember a lot of commands
set mouse=nv                " allows usage of mouse
set ruler                   " show ruler
set scrolloff=5             " minimum number of lines above and below the cursor
set list                    " make whitespace characters visible
set lcs=tab:▸\ ,trail:_     " symbols for tabs and trailing whitespaces
" }}}
" Searching {{{
set incsearch               " search as characters are entered
set hlsearch                " highlight matches
set smartcase
set ignorecase

" turn of search highlight
nnoremap <leader><space> :noh<cr>
" }}}
" Folding {{{
set foldenable              " enable folding
set foldlevelstart=10       " open most folds by default
set foldnestmax=10          " 10 nested fold max
set foldmethod=indent       " fold based on indent level

" space open/closes folds
nnoremap <space> za
" }}}
" Leader Shortcuts {{{
let mapleader=","           " leader is comma
" }}}
" Keybindings {{{
nnoremap ; :

set pt=<F3>                 " paste mode

command W w
command Q q

nnoremap <leader>w <C-w>v<C-w>l

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" }}}
" CtrlP {{{
nnoremap <Leader>e :CtrlP<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>m :CtrlPMRUFiles<CR>
nnoremap <Leader>c :CtrlP %:h<CR>

"let g:ctrlp_match_window = 'max:50,results:50'
let g:ctrlp_reuse_window = 'help'

let g:netrw_list_hide='\.swp$,\.o$,\.ali$,\.swo$,\.pyc$'
" }}}
" Y U NO COMMIT AFTER 20 LINES???!?! {{{
let g:YUNOcommit_after = 20
" }}}
" Taglist {{{
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
let Tlist_Use_Right_Window=1
let Tlist_Exit_OnlyWindow=1

nnoremap <Leader>t :TlistToggle<CR>
" }}}
" Airline {{{
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
" }}}
" Nerdtree {{{
let NERDTreeIgnore=['\.swp$', '\.o$', '\.ali$', '\.swo$', '\*$']
let NERDTreeMouseMode=2
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif "close NT if last window

nmap <Leader>e :NERDTreeToggle<CR>
" }}}
" Autogroups {{{
augroup configgroup
    autocmd!
    autocmd FileType make setlocal ts=8 sw=8 noet
    autocmd FileType html setlocal ts=2 sw=2 et omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css setlocal ts=2 sw=2 et omnifunc=csscomplete#CompleteCSS
    autocmd FileType javascript setlocal ts=4 sw=4 et
    autocmd FileType c setlocal ts=4 sw=4 noet
    autocmd FileType ada setlocal ts=3 sw=3 et
    autocmd FileType tex setlocal ts=2 sw=2 et
    autocmd FileType python setlocal ts=2 sw=2 et
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END
" }}}
" Backups {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
"set undofile
" }}}
" Functions {{{
function! AdjustFontSize(amount)
  let &guifont=substitute(&guifont,'\zs\d\+','\=eval(submatch(0)+a:amount)','')
endfunction

nnoremap <C-Up> :call AdjustFontSize(1)<CR>:echo &guifont<CR>
nnoremap <C-Down> :call AdjustFontSize(-1)<CR>:echo &guifont<CR>
" }}}

" vim:foldmethod=marker:foldlevel=0
