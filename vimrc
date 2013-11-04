runtime bundle/vim-pathogen/autoload/pathogen.vim

" ######################
" general settings
" ######################

set cc=80
colorscheme molokai
"backspace working in vim 7.3
set bs=2
"set bg=dark
"moar colors
set t_Co=256
"make Line Numbers grey
hi LineNr ctermfg=darkgray
set mouse=nv
set shiftwidth=4
set encoding=utf-8
set tabstop=4
"set expandtab
"Always show current position
set ruler 
"Turn on wildmenu
set wildmenu 
"filtes not shown in wild menu
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

"set list
"set lcs=tab:▸\

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

nmap <Leader>e :e .<CR>
nmap <F2> :TlistToggle<CR>

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
	autocmd FileType html setlocal ts=2 sw=2 et cc=
	autocmd FileType css setlocal ts=2 sw=2 et
	autocmd FileType javascript setlocal ts=4 sw=4 et
	autocmd FileType c setlocal ts=4 sw=4 noet
	autocmd FileType ada setlocal ts=3 sw=3 et
	autocmd FileType tex setlocal ts=2 sw=2 et
endif

" ######################
" plugins
" ######################

call pathogen#infect()
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
let g:syntastic_mode_map = { 'mode': 'active',
                               \ 'passive_filetypes': ['html'] }
