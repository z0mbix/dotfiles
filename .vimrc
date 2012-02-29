"
" Vim 7 config
" z0mbix
" Last update: 28 Feb 2012
"

set statusline=%<%f%h%m%r%w%y%=%l/%L,%c\ %P\ \|\ %n
set number                              " show line numbers
set ruler                               " show line and column no
set hidden                              " hidden buffers?
set showcmd                             " show command in last line
set nocompatible                        " not compatible with vi
set showmode                            " show mode in mode line
set modeline                            " show mode line
set ignorecase                          " ignore case when searching
set incsearch                           " search while typing
set backspace=indent,eol,start          " super backspacing
set smartcase                           " smart searching
set tabstop=4                           " default tabs to 4 spaces
set shiftwidth=4                        " match default tab spacing
set hlsearch                            " highlight search results
set autoindent                          " auto indent new lines
set linebreak                           " enable linebreaks
set showbreak=>>                        " what to put infront of linebreaks
set history=200                         " set command and search history
set noerrorbells                        " don't annoy me
set novisualbell                        " disable visual bell
set report=0                            " always report lines changed
set showmatch                           " show matching brackets
set foldenable                          " enable folding
set foldmethod=indent                   " fold lines with equal indent
set foldlevel=100                       " set fold close level
set laststatus=2                        " always show status line
set pastetoggle=<C-p>                   " Ctrl+p to toggle pasting
set spellfile=~/.vimspell.add"          " my words
set confirm                             " ask to save files
set t_Co=256                            " use all 256 colors
set autoread                            " reload files changed outside vim"
set viminfo='100,f1                     " save up to 100 marks, enable capital marks
set list                                " Show invisible characters

set scrolloff=8                         " start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

filetype on
filetype plugin on
set background=dark
colorscheme solarized

" Quickly toggle `set list` (Show/Hide invisible characters) with \l
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs 
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮

" .rc are shell files
au BufNewFile,BufRead *.rc set ft=sh

" .phtml and .sync are php files
au BufNewFile,BufRead *.phtml,*.sync set ft=php

" these are rubyish files
au BufNewFile,BufRead *.rake,*.mab set ft=ruby
au BufNewFile,BufRead *.erb set ft=eruby

" Ruby - what tabs?
au FileType ruby,eruby set ts=2 sw=2 tw=79 et sts=2 smartindent

" Puppet
au BufRead,BufNewFile *.pp set ft=puppet
au FileType puppet set ts=2 sw=2 tw=79 et sts=2 smartindent

" Yum repos
au BufRead,BufNewFile *.repo set ft=yum

" yaml
au FileType yaml set ts=2 sw=2 et

" source code gets wrapped at <80
au FileType asm,javascript,php,html,perl,c,cpp set tw=79 autoindent

" makefiles and c have tabstops at 8 for portability
au FileType make,c,cpp set ts=8 sw=8

" Only do this part when compiled with support for autocommands
if has("autocmd")
  augroup redhat
    " In text files, always limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
  augroup END 
endif

" Quit NERDTree when last file closed
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
  syntax on
endif

" Highlight statusbar
hi statusline ctermbg=white ctermfg=magenta
hi statuslinenc ctermbg=gray ctermfg=darkgray

" Highlight line if in insert mode
au InsertEnter * set cursorline
au InsertLeave * set nocursorline

" Don't pollute directories with swap files, keep them in one place
silent !mkdir -p ~/.vim/{backup,swp}/
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

" PHP stuff
let php_sql_query=1
let php_htmlInStrings=1
let perl_extended_vars=1

" Insert mode maps
imap ;EM zombie@zombix.org
imap ;WWW http://www.zombix.org/

" Fix common typos
iab teh     the
iab Teh     The


" Set title string and push it to xterm/screen window title
set titlestring=vim\ %<%F%(\ %)%m%h%w%=%l/%L-%P 
set titlelen=70
if &term == "screen"
  set t_ts=k
  set t_fs=\
endif
if &term == "screen" || &term == "xterm"
    set title
endif

" automatically reload vimrc when it's saved
"au BufWritePost .vimrc so ~/.vimrc

if has('gui_macvim')
  "  switch OSX windows with swipes
  nnoremap <silent> <SwipeLeft> :macaction _cycleWindowsBackwards:<CR>
  nnoremap <silent> <SwipeRight> :macaction _cycleWindows:<CR>

  " TextMate indentation key mappings for mvim Cmd+[ and Cmd+]
  nmap <D-[> <<
  nmap <D-]> >>
  vmap <D-[> <gv
  vmap <D-]> >gv
endif

" Remove annoying F1 help
inoremap <F1> <nop>
nnoremap <F1> <nop>
vnoremap <F1> <nop>

" Retab and Format the File with Spaces
nnoremap <leader>T :set expandtab<cr>:retab!<cr>

" Use ctrl+n/p to switch buffers
nnoremap <C-N> :next<Enter>
nnoremap <C-P> :prev<Enter>

" Remap 'jj' to Esc
inoremap jj <Esc>

" Map F2 to NERDTree
map <F2> :NERDTreeToggle<CR>

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Improve up/down movement on wrapped lines
nnoremap j gj
nnoremap k gk

" Remove ^M from file with \m
map <Leader>m :%s/^M//<CR>

" select all with \a
map <Leader>a ggVG

" Source ~/.vimrc with \s
nmap <Leader>s :source $HOME/.vimrc<CR>

" Clear search highlighting with ESC
nnoremap <CR> :nohlsearch<CR>/<BS>

" Lazy comments
map ,# :s/^/#/<CR>:nohlsearch<CR>
map ,/ :s/^/\/\//<CR>:nohlsearch<CR>
map ," :s/^/\"/<CR>:nohlsearch<CR>
map ,; :s/^/;/<CR>:nohlsearch<CR>

" undofile - This allows you to use undos after exiting and restarting
" This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
" :help undo-persistence
" This is only present in 7.3+
if exists("+undofile")
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif

" Stuff I don't want up on github
if filereadable(glob("~/.vimrc-private"))
  source ~/.vimrc-private
endif
