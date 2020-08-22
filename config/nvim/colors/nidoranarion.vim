" nidoranarion.vim -- Vim color scheme.
" Author:      Nicolai Ruckel (nicolai@ruckel.de)
" Webpage:     https://www.nicolairuckel.com
" Description: Lorem ipsum dolor sit amet.
" Last Change: 2020-07-15

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "nidoranarion"

if ($TERM =~ '256' || &t_Co >= 256) || has("gui_running")
    hi Normal ctermbg=NONE ctermfg=0 cterm=NONE guibg=NONE guifg=#090300 gui=NONE
    hi NonText ctermbg=NONE ctermfg=7 cterm=NONE guibg=NONE guifg=#d6d5d4 gui=NONE
    hi Comment ctermbg=NONE ctermfg=10 cterm=NONE guibg=NONE guifg=#24a159 gui=NONE
    hi Constant ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi Error ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi Identifier ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi Ignore ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi PreProc ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi Special ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi Statement ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi String ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi Todo ctermbg=NONE ctermfg=9 cterm=NONE guibg=NONE guifg=#d91e18 gui=NONE
    hi Type ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi Underlined ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi StatusLine ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi StatusLineNC ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi VertSplit ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi TabLine ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi TabLineFill ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi TabLineSel ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi Title ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi CursorLine ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi LineNr ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi CursorLineNr ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi helpLeadBlank ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi helpNormal ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi Visual ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi VisualNOS ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi Pmenu ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi PmenuSbar ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi PmenuSel ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi PmenuThumb ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi FoldColumn ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi Folded ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi WildMenu ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi SpecialKey ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi DiffAdd ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi DiffChange ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi DiffDelete ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi DiffText ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi IncSearch ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi Search ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi Directory ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi MatchParen ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi SpellBad ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE guisp=#d91e18
    hi SpellCap ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE guisp=#1e90ff
    hi SpellLocal ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE guisp=#e26a6a
    hi SpellRare ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE guisp=#007faa
    hi ColorColumn ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi SignColumn ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi ErrorMsg ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi ModeMsg ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi MoreMsg ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi Question ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi Cursor ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi CursorColumn ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi QuickFixLine ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi Conceal ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi ToolbarLine ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi ToolbarButton ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi debugPC ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE
    hi debugBreakpoint ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4a4453 gui=NONE

elseif &t_Co == 8 || $TERM !~# '^linux' || &t_Co == 16
    set t_Co=16

    hi Normal ctermbg=NONE ctermfg=black cterm=NONE
    hi NonText ctermbg=NONE ctermfg=gray cterm=NONE
    hi Comment ctermbg=NONE ctermfg=green cterm=NONE
    hi Constant ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi Error ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi Identifier ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi Ignore ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi PreProc ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi Special ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi Statement ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi String ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi Todo ctermbg=NONE ctermfg=red cterm=NONE
    hi Type ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi Underlined ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi StatusLine ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi StatusLineNC ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi VertSplit ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi TabLine ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi TabLineFill ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi TabLineSel ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi Title ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi CursorLine ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi LineNr ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi CursorLineNr ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi helpLeadBlank ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi helpNormal ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi Visual ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi VisualNOS ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi Pmenu ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi PmenuSbar ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi PmenuSel ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi PmenuThumb ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi FoldColumn ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi Folded ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi WildMenu ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi SpecialKey ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi DiffAdd ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi DiffChange ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi DiffDelete ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi DiffText ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi IncSearch ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi Search ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi Directory ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi MatchParen ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi SpellBad ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi SpellCap ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi SpellLocal ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi SpellRare ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi ColorColumn ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi SignColumn ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi ErrorMsg ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi ModeMsg ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi MoreMsg ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi Question ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi Cursor ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi CursorColumn ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi QuickFixLine ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi Conceal ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi ToolbarLine ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi ToolbarButton ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi debugPC ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi debugBreakpoint ctermbg=NONE ctermfg=darkgray cterm=NONE
endif

hi link EndOfBuffer NonText
hi link Number Constant
hi link StatusLineTerm StatusLine
hi link StatusLineTermNC StatusLineNC
hi link WarningMsg Error
hi link CursorIM Cursor
hi link Terminal Normal

let g:terminal_ansi_colors = [
        \ '#090300',
        \ '#96281b',
        \ '#008040',
        \ '#634806',
        \ '#0F4880',
        \ '#532f61',
        \ '#005051',
        \ '#d6d5d4',
        \ '#4a4453',
        \ '#d91e18',
        \ '#24a159',
        \ '#b8860b',
        \ '#1e90ff',
        \ '#e26a6a',
        \ '#007faa',
        \ '#f7f7f7',
        \ ]

" Generated with RNB (https://github.com/romainl/vim-rnb)
