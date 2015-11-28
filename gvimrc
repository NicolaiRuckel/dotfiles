if has("gui_macvim")
  set guifont=Monaco:h12
else
    "set guifont=Hermit:h8
    set guifont=Liberation\ Mono\ 10
    set guioptions-=m "remove menu bar
    set guioptions-=T "remove toolbar
    set guioptions-=e " gui tabs
endif
set lines=100
set columns=100
"escape removes highlight of searches
"this does strange things in vim but works in gvim
nnoremap <silent> <ESC> :noh<CR><ESC>
