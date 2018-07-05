" most settings and comments are taken from
" http://dougblack.io/words/a-good-vimrc.html

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Plug
" https://github.com/junegunn/vim-plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'https://github.com/kien/ctrlp.vim'
Plug 'https://github.com/scrooloose/syntastic'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/jonathanfilip/vim-lucius'
Plug 'https://github.com/andreypopp/vim-colors-plain'
Plug 'https://github.com/esneider/YUNOcommit.vim'
Plug 'https://github.com/mhinz/vim-signify'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'rust-lang/rust.vim'
Plug 'https://github.com/cespare/vim-toml'
Plug 'https://github.com/vimwiki/vimwiki'
Plug 'skywind3000/asyncrun.vim'
Plug 'autozimu/LanguageClient-neovim', {
                        \ 'branch': 'next',
                        \ 'do': 'bash install.sh',
                        \ }
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set exrc                    " run .exrc files if present
set fileformat=unix         " set fileformat to unix
set encoding=utf-8          " because other encodings are stupid
set bs=2                    " make backspace working in vim 7.3
set tm=500                  " set timeoutlen to 500
set splitright              " splits appear right

set noscrollbind " for oni; should be fixed in next release

filetype plugin on

" Backup, Swap and Undo
set undofile                " persistent undo
set directory=~/.config/nvim/swap,/tmp
set backupdir=~/.config/nvim/backup,/tmp
set undodir=~/.config/nvim/undo,/tmp

" NetRW
let g:netrw_liststyle = 1 " Detail View
let g:netrw_sizestyle = "H" " Human-readable file sizes
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+' " hide dotfiles
let g:netrw_hide = 1 " hide dotfiles by default
let g:netrw_banner = 0 " Turn off banner


" Dictionary
set dictionary+=/usr/share/dict/american-english
set dictionary+=/usr/share/dict/ngerman

" Spell
set spelllang=en,de_20

" Colors
set t_Co=256                " more colors for more fun!
colorscheme lucius
LuciusDark
set background=dark        " dark background
" colorscheme plain
syntax enable               " enable syntax processing

" Spaces and Tabs
set tabstop=4               " number of visual spaces per TAB
set softtabstop=4           " number of spaces in tab when editing
set expandtab               " tabs are spaces

" UI Config
set number                  " show line numbers
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
" Highlight all columns after current textwidth
let &colorcolumn=join(map(range(1,999), '"+".v:val'), ",")
set textwidth=80
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

" turn of search highlight
" this did strange things in vim but hopefully works in nvim
nnoremap <silent> <ESC> :noh<CR><ESC>

" Folding
set foldenable              " enable folding
set foldlevelstart=10       " open most folds by default
set foldnestmax=10          " 10 nested fold max
set foldmethod=indent       " fold based on indent level

" Leader Shortcuts
let mapleader=" "

" f open/closes folds
nnoremap <leader>f za

nnoremap <leader>v :vsplit<cr>

" Copy to primary
vnoremap  <leader>y  "*y
nnoremap  <leader>Y  "*yg_
nnoremap  <leader>y  "*y

" Paste from primary
nnoremap <leader>p "*p
nnoremap <leader>P "*P
vnoremap <leader>p "*p
vnoremap <leader>P "*P

" nnoremap <Leader>. :wa<CR>:Neomake!<CR>
" nnoremap <Leader>/ :w<CR>:Neomake<CR>

nnoremap <silent> <Leader>. :wa<CR>:RunAsync<CR>
nnoremap <Leader>/ :wa<CR>:RunAsync 

nnoremap <Leader>s :set spell!<CR>

" Keybindings
nnoremap ; :


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


" Language Client

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Statusline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2            " enable statusline all the time

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

" AsyncRun
function! RunAsync(...)
  if a:0 == 1
    let g:async_command = a:1
  elseif !exists("g:async_command")
    let g:async_command = 'make'
  endif
  exec "AsyncRun " . g:async_command
endfunction
command! -nargs=? RunAsync :call RunAsync(<f-args>)

function! Get_asyncrun_status()
  let async_status = g:asyncrun_status
  if async_status == 'running'
    return g:async_command . ' •'
  elseif async_status == 'success'
    return g:async_command . ' ✔'
  elseif async_status == 'failure'
    return g:async_command . ' ✘'
  else
    return ''
  endif
endfunction

set statusline=                       " Custom status line
set statusline+=%#PmenuSel#           " Show git branch if it exists
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f                  " Show file name
set statusline+=%m\                   " Show whether file has been modified
set statusline+=%=                    " Right align the following
set statusline+=%{Get_asyncrun_status()}
set statusline+=%#CursorColumn#
set statusline+=\ %y                  " Filetype
set statusline+=\ %{&fileencoding?&fileencoding:&encoding} " File encoding
set statusline+=\[%{&fileformat}\]    " File format
set statusline+=\ %p%%                " Percentage through file
set statusline+=\ %l:%c               " Line number:Column number
set statusline+=\ 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autogroups
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup configgroup
    autocmd!
    autocmd BufRead,BufNewFile *.tex set filetype=tex
    autocmd FileType make setlocal ts=8 sw=8 noet
    autocmd FileType cmake setlocal ts=2 sw=2 et
    autocmd FileType html setlocal ts=2 sw=2
    autocmd FileType css setlocal ts=2 sw=2
    autocmd FileType text setlocal ts=2 sw=2 sts=2 et spell
    autocmd BufEnter *.txt setlocal ts=2 sw=2 sts=2 spell
    autocmd FileType javascript setlocal ts=4 sw=4 et
    autocmd FileType c setlocal ts=4 sw=4 noet
    autocmd FileType cpp setlocal ts=2 sw=2 sts=2 et
    autocmd FileType java setlocal ts=2 sw=2 sts=2 et tw=100
    autocmd FileType ada setlocal ts=3 sw=3 sts=3 et
    autocmd FileType tex setlocal ts=2 sw=2 et spell
         \| syntax spell toplevel
    autocmd FileType python setlocal ts=4 sw=4 sts=4 et
    autocmd FileType markdown setlocal ts=4 sw=4 formatoptions+=t spell
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd FileType rust setlocal ts=4 sw=4 sts=4 et tw=100 tw=100
         \| if !exists("g:async_command") | let g:async_command = 'cargo build'
         \| endif
         \| nnoremap <buffer> <Leader>/ :wa<CR>:RunAsync cargo
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal ts=2 sw=2 sts=2
    autocmd FileType bib setlocal ts=2 sw=2 sts=2 et tw=0
    autocmd FileType json setlocal ts=2 sw=2 sts=2
    autocmd FileType lua setlocal ts=4 sw=4 sts=4 et
         \| nnoremap <Leader>. :wa<CR>:!love .<CR>
    autocmd FileType help setlocal nospell
    autocmd FileType vim setlocal ts=2 sw=2 sts=2 et
    autocmd FileType gtkrc setlocal commentstring=#\ %s
    autocmd FileType matlab setlocal commentstring=%\ %s
    autocmd FileType desktop setlocal commentstring=#\ %s
    autocmd FileType gitcommit setlocal spell
    autocmd FileType xml setlocal et ts=2 sw=2 sts=2 tw=0
    autocmd FileType dosini setlocal commentstring=#\ %s
    autocmd BufEnter *.gradle setlocal ts=4 sw=4 sts=4 tw=0
    autocmd Filetype go setlocal tw=100 " Go style guide does not restrict the
                                        " line length but 100 seems reasonable.
    autocmd Filetype dockerfile setlocal tw=0

    autocmd DirChanged * if filereadable(".exrc") | source .exrc | endif
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Backups
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
"set undofile
