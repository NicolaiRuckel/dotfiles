""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Plug
" https://github.com/junegunn/vim-plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Automatically install plugins
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/fzf.vim' " needs fzf installed on the system
Plug 'https://github.com/scrooloose/syntastic'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/andreypopp/vim-colors-plain'
Plug 'https://github.com/esneider/YUNOcommit.vim'
Plug 'https://github.com/mhinz/vim-signify'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/tpope/vim-unimpaired'
Plug 'rust-lang/rust.vim'
Plug 'https://github.com/arzg/vim-rust-syntax-ext'
Plug 'https://github.com/cespare/vim-toml'
Plug 'sheerun/vim-polyglot'
Plug 'https://github.com/vimwiki/vimwiki'
Plug 'skywind3000/asyncrun.vim'
Plug 'https://github.com/rhysd/vim-grammarous'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'micarmst/vim-spellsync'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/jeffkreeftmeijer/vim-numbertoggle'
Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'
Plug 'rhysd/git-messenger.vim'
Plug 'https://github.com/ludovicchabant/vim-gutentags'
Plug 'https://github.com/skywind3000/gutentags_plus'
Plug 'https://github.com/EinfachToll/DidYouMean'
Plug 'mboughaba/i3config.vim'
Plug 'https://github.com/simnalamburt/vim-mundo'
Plug 'https://github.com/fisadev/vim-isort'
Plug 'liuchengxu/vista.vim'
Plug 'https://github.com/Yggdroot/indentLine'
Plug 'https://github.com/jonathanfilip/vim-lucius'
Plug 'arcticicestudio/nord-vim'
Plug 'https://github.com/NLKNguyen/papercolor-theme'
Plug 'ayu-theme/ayu-vim'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set exrc                    " run .exrc files if present
set secure

set fileformat=unix         " set fileformat to unix
set encoding=utf-8          " because other encodings are stupid
set bs=2                    " make backspace working in vim 7.3
set tm=500                  " set timeoutlen to 500
set splitright              " splits appear right

" Does some magic with relative and absolute line numbers via the
" vim-numbertoggle plugin.
set number relativenumber

set noscrollbind " for oni; should be fixed in next release

filetype plugin on

""" Backup, Swap and Undo
set undofile                " persistent undo
set directory=~/.config/nvim/swap,/tmp
set backupdir=~/.config/nvim/backup,/tmp
set undodir=~/.config/nvim/undo,/tmp

""" NetRW
let g:netrw_liststyle = 1 " Detail View
let g:netrw_sizestyle = "H" " Human-readable file sizes
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+' " hide dotfiles
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
set background=light        " dark background
syntax enable               " enable syntax processing

""" Spaces and Tabs
set tabstop=4               " number of visual spaces per TAB
set softtabstop=4           " number of spaces in tab when editing
set expandtab               " tabs are spaces

""" UI Config
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
" Highlight column after current textwidth
set colorcolumn=+1
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

""" Leader Shortcuts
let mapleader=" "

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

nnoremap <silent> <Leader><space> :wa<CR>:RunAsync<CR>
nnoremap <Leader>/ :wa<CR>:RunAsync 

nnoremap <Leader>s :set spell!<CR>

fun! StripTrailingWhitespace()
    " Only strip if the b:noStripeWhitespace variable isn't set
    if exists('b:noStripWhitespace')
      return
    endif
    %s/\s\+$//e
endfun

autocmd FileType diff,vim,markdown let b:noStripWhitespace=1
autocmd BufWritePre * call StripTrailingWhitespace()

" Automatically check if opened file has changed on focus gain like gvim does.
" see https://github.com/neovim/neovim/issues/1936
set autoread
au FocusGained * :checktime

" ------------------------------------------------------------------------------
" Terminal
" ------------------------------------------------------------------------------

" Esc to exit terminal mode
tnoremap <Esc> <C-\><C-n>

" Set terminal colorscheme
let g:terminal_color_0  = '#303030'
let g:terminal_color_1  = '#ff5f5f'
let g:terminal_color_2  = '#afd787'
let g:terminal_color_3  = '#d7d7af'
let g:terminal_color_4  = '#87d7ff'
let g:terminal_color_5  = '#d7afd7'
let g:terminal_color_6  = '#87d7af'
let g:terminal_color_7  = '#d7d7d7'
let g:terminal_color_8  = '#303030'
let g:terminal_color_9  = '#ff5f5f'
let g:terminal_color_10 = '#afd787'
let g:terminal_color_11 = '#d7d7af'
let g:terminal_color_12 = '#87d7ff'
let g:terminal_color_13 = '#d7afd7'
let g:terminal_color_14 = '#87d7af'
let g:terminal_color_15 = '#d7d7d7'

" ------------------------------------------------------------------------------
" Plugins
" ------------------------------------------------------------------------------

"""  DidYouMean
let g:dym_use_fzf = 1

""" Deoplete
let g:deoplete#enable_at_startup = 1

""" jedi-vim
" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

""" gutentags
" Don't pollute project directories
let g:gutentags_cache_dir = expand('~/.cache/tags')

""" fzf
nmap <Leader>G :Ag<Cr>
nmap <Leader>g :Rg<Cr>

nmap <Leader>f :GFiles<CR>
nmap <Leader>a :Files<CR>

nmap <Leader>l :BLines<CR>
nmap <Leader>L :Lines<CR>

nmap <Leader>t :BTags<CR>
nmap <Leader>T :Tags<CR>

""" fzf-wordnet
imap <C-S> <Plug>(fzf-complete-wordnet)

""" netrw
let g:netrw_list_hide='\.swp$,\.o$,\.ali$,\.swo$,\.pyc$'

""" Y U NO COMMIT
" ...AFTER 20 LINES???!?!
let g:YUNOcommit_after = 20

""" Taglist
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
let Tlist_Use_Right_Window=1
let Tlist_Exit_OnlyWindow=1

""" Grammarous
let g:grammarous#default_comments_only_filetypes = {
            \ '*' : 1, 'tex' : 0, 'markdown' : 0,
            \ }

""" vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:tex_conceal='abdmg'

""" UltiSnips
let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-Tab>'


""" vista
let g:vista_default_executive = 'ctags'

""" IndentLine
let g:indentLine_char = '▏'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Statusline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" enable statusline all the time
set laststatus=2

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
set statusline+=%#CursorColumn#
set statusline+=\ %f                  " Show file name
set statusline+=%m\                   " Show whether file has been modified
set statusline+=%=                    " Right align the following
set statusline+=%{Get_asyncrun_status()}
set statusline+=\ %y                  " Filetype
set statusline+=\ %{&fileencoding?&fileencoding:&encoding} " File encoding
set statusline+=\[%{&fileformat}\]    " File format
set statusline+=\ %p%%                " Percentage through file
set statusline+=\ %l:%c               " Line number:Column number
set statusline+=\

" fzf bibtex
" from: https://github.com/msprev/fzf-bibtex
" Requirements
"   go get github.com/msprev/fzf-bibtex/cmd/bibtex-ls
"   go install github.com/msprev/fzf-bibtex/cmd/bibtex-ls
"   go install github.com/msprev/fzf-bibtex/cmd/bibtex-markdown
"   go install github.com/msprev/fzf-bibtex/cmd/bibtex-cite
function! Bibtex_ls()
    let bibfiles = (
                \ globpath('.', '*.bib', v:true, v:true) +
                \ globpath('$TEXMFHOME/bibtex/bib/bibliography/', '*.bib', v:true, v:true) +
                \ globpath('*/', '*.bib', v:true, v:true)
                \ )
    let bibfiles = join(bibfiles, ' ')
    let source_cmd = 'bibtex-ls '.bibfiles
    return source_cmd
endfunction

function! s:bibtex_cite_sink_insert(lines)
    let r=system('bibtex-cite -prefix="\cite{" -postfix="}" -separator=", " ', a:lines)
    execute ':normal! a' . r
    call feedkeys('a', 'n')
endfunction

inoremap <silent> @@ <c-g>u<c-o>:call fzf#run({
                        \ 'source': Bibtex_ls(),
                        \ 'sink*': function('<sid>bibtex_cite_sink_insert'),
                        \ 'up': '40%',
                        \ 'options': '--ansi --layout=reverse-list --multi --prompt "Cite> "'})<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc.nvim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType json syntax match Comment +\/\/.\+$+

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for format selected region
xmap <leader>ff  <Plug>(coc-format-selected)
nmap <leader>ff  <Plug>(coc-format-selected)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

let g:coc_global_extensions = [
      \ 'coc-json',
      \ 'coc-python',
      \ 'coc-java',
      \ 'coc-texlab',
      \ 'coc-html',
      \ 'coc-css',
      \ 'coc-rls',
      \ 'coc-rust-analyzer',
      \ 'coc-vimlsp',
      \ 'coc-highlight',
      \ 'coc-github',
      \ 'coc-docker',
      \ 'coc-sh',
      \ 'coc-markdownlint',
      \ 'coc-tag',
      \ 'coc-emoji',
      \]

" Show documentation with K
nnoremap <silent> K :call <SID>show_documentation()<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autogroups
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup configgroup
    autocmd!
    autocmd BufRead,BufNewFile *.tex set filetype=tex
    autocmd FileType make setlocal ts=8 sw=8 noet
    autocmd FileType cmake setlocal ts=2 sw=2 et
    autocmd FileType html setlocal ts=2 sw=2 tw=0
    autocmd FileType css setlocal ts=2 sw=2 tw=0
    autocmd FileType text setlocal ts=2 sw=2 sts=2 et spell
    autocmd BufEnter *.txt setlocal ts=2 sw=2 sts=2 spell
    autocmd FileType javascript setlocal ts=4 sw=4 et
    autocmd FileType c setlocal ts=4 sw=4 noet
    autocmd FileType cpp setlocal ts=2 sw=2 sts=2 et
    autocmd FileType java setlocal ts=4 sw=4 sts=4 et tw=100
    autocmd FileType ada setlocal ts=3 sw=3 sts=3 et
    autocmd FileType tex setlocal ts=2 sw=2 et spell tw=0
         \| syntax spell toplevel
    autocmd FileType python setlocal ts=4 sw=4 sts=4 et tw=79
    autocmd FileType markdown setlocal ts=4 sw=4 formatoptions+=t tw=80 spell
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd FileType rust setlocal ts=4 sw=4 sts=4 et tw=100
         \| if !exists("g:async_command") | let g:async_command = 'cargo build'
         \| endif
         \| nnoremap <buffer> <Leader>/ :wa<CR>:RunAsync cargo
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal ts=4 sw=4 sts=4
    autocmd FileType bib setlocal ts=2 sw=2 sts=2 et tw=0
    autocmd FileType json setlocal ts=2 sw=2 sts=2
    autocmd FileType lua setlocal ts=4 sw=4 sts=4 et
         \| nnoremap <Leader>. :wa<CR>:!love .<CR>
    autocmd FileType help setlocal nospell
    autocmd FileType vim setlocal ts=4 sw=4 sts=4 et
    autocmd FileType gtkrc setlocal commentstring=#\ %s
    autocmd FileType matlab setlocal commentstring=%\ %s
    autocmd FileType desktop setlocal commentstring=#\ %s
    autocmd FileType gitcommit setlocal spell tw=72
    autocmd FileType xml setlocal et ts=2 sw=2 sts=2 tw=0
    autocmd FileType dosini setlocal commentstring=#\ %s
    autocmd BufEnter *.gradle setlocal ts=4 sw=4 sts=4 tw=0
    autocmd Filetype go setlocal tw=100 " Go style guide does not restrict the
                                        " line length but 100 seems reasonable.
    autocmd Filetype dockerfile setlocal tw=0
augroup END

" automatically sort Python imports on write
autocmd BufWritePre *.py :Isort

" fix a problem with the interactive terminal and vim-fugitive
" see: https://github.com/tpope/vim-fugitive/issues/957
augroup nvim_term
    au!
    au TermOpen * startinsert
    au TermClose * stopinsert
augroup END

" i3 config detection
aug i3config_ft_detection
    au!
    au BufNewFile,BufRead ~/dotfiles/config/i3/config set filetype=i3config
aug end

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Backups
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
