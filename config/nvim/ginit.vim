set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,a:blinkwait9999999999999

let s:default_fontsize = 10
let s:fontsize = s:default_fontsize
let s:font = "Source Code Pro Light"

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

function! SetFont() abort
  if exists('g:GtkGuiLoaded')
    let s:font = "Source Code Pro Regular"
    call rpcnotify(1, 'Gui', 'Font', s:font . ' ' . s:fontsize)
    let g:GuiInternalClipboard = 1
    let NVIM_GTK_NO_HEADERBAR=1
  elseif exists("g:gui_oni")
    call rpcnotify(1, 'Gui', 'Font', s:font . ' ' . s:fontsize)
  else
    exec "GuiFont " . s:font . ":h" . s:fontsize
  endif
endfunction

call SetFont()

function! AdjustFontSize(delta)
  let s:fontsize += a:delta
  call SetFont()
endfunction

function! ResetFontSize()
  let s:fontsize = s:default_fontsize
  call SetFont()
endfunction

nnoremap <C-=> :call AdjustFontSize(1)<CR>
nnoremap <C-+> :call AdjustFontSize(1)<CR>
nnoremap <C--> :call AdjustFontSize(-1)<CR>
nnoremap <C-0> :call ResetFontSize()<CR>
