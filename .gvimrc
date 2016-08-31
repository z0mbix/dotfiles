if has("gui_running")
  if has("gui_gtk2")
    set guifont=Hack\ 9
  elseif has("gui_win32")
    set guifont=Hack\ 9
  elseif has("gui_macvim")
    set guifont=Hack:h12
    set fullscreen
  elseif has("gui_vimr")
    set guifont=Hack:h12
    set fullscreen
  endif
endif

set guioptions=
set background=dark
colorscheme onedark
