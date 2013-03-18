" ######################
" general settings
" ######################

set cc=80
colorscheme molokai
"backspace working in vim 7.3
set bs=2
set bg=dark
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
"filtes not shown in wild menu
set wildignore=*.o,*.obj,*.exe,*~,*.swp,*.log,*.out 
set history=700
" Turn backup off, since all important stuff is in git anyway...
set nobackup
set nowb
set noswapfile
set noerrorbells
set novisualbell
set tm=500
syntax on
set number 
set ai 
set si 

" ######################
" search settings
" ######################

set smartcase 
set ignorecase
set incsearch 

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
vnoremap <space> zf

"map <F2> :e .<CR>
map <F2> :NERDTreeToggle<CR>

"F3 for paste
set pt=<F3>

" ######################
" LaTeX-Settings
" ######################

filetype plugin indent on
au BufEnter *.tex set autowrite
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf'
let g:Tex_CompileRule_pdf = 'pdflatex -interaction=nonstopmode $*'
let g:Tex_GotoError = 1
"This setting controls whether Latex-Suite automatically creates manual folds for a file when it is opened. You can still use the \rf mapping to refresh/create folds even when this variable is set to zero. 
let g:Tex_AutoFolding = 0
"let g:Tex_ViewRule_pdf = '/Applications/Preview.app/Contents/MacOS/Preview'
let g:Tex_ViewRule_pdf = 'open -a Preview' 
let g:tex_flavor='latex'
let g:Tex_IgnoreLevel = 8
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a single file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" ######################
" Pathogen
" ######################

call pathogen#infect()
