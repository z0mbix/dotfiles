"
" Vim 7 config
" z0mbix
" Last update: 28 Feb 2012
"

scriptencoding utf-8
set encoding=utf-8

set statusline=%<%f%h%m%r%w%y%=%l/%L,%c\ %P\ \|\ %n
set number                              " show line numbers
"set relativenumber                      " show relative line numbers
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
set listchars=tab:›\ ,eol:¬,trail:⋅     " set the characters for the invisibles
set list                                " Show invisible characters
set splitbelow                          " splits show up below by default
set splitright                          " splits go to the right by default
"set colorcolumn=80                      " highlight 80 character limit
set scrolloff=8                         " start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" Tab completion settings
set wildmode=list:longest     " Wildcard matches show a list, matching the longest first
set wildignore+=.git,.hg,.svn " Ignore version control repos
set wildignore+=*.6           " Ignore Go compiled files
set wildignore+=*.pyc         " Ignore Python compiled files
set wildignore+=*.rbc         " Ignore Rubinius compiled files
set wildignore+=*.swp         " Ignore vim backups

let mapleader=";"                      " The <leader> key

filetype on
filetype plugin on
set background=dark

" Quickly toggle `set list` (Show/Hide invisible characters) with \l
nmap <leader>' :set list!<CR>

let g:vim_home_path = "~/.vim"

execute "set rtp+=" . g:vim_home_path . "/bundle/vundle/"
let g:vundle_default_git_proto = 'https'
call vundle#rc(g:vim_home_path. "/bundle")

Bundle 'gmarik/vundle'

" Language plugins
Bundle "elzr/vim-json"
Bundle "empanda/vim-varnish"
Bundle "groenewege/vim-less"
"Bundle "Glench/Vim-Jinja2-Syntax"
"Bundle "kchmck/vim-coffee-script"
Bundle "PProvost/vim-ps1"
Bundle "rodjek/vim-puppet"
Bundle "tpope/vim-markdown"
"Bundle "nono/vim-handlebars"

" Other plugins
Bundle "airblade/vim-gitgutter"
Bundle "godlygeek/tabular"
Bundle "kien/ctrlp.vim"
Bundle "Lokaltog/vim-easymotion"
Bundle "Lokaltog/vim-powerline"
Bundle "mileszs/ack.vim"
Bundle "mhinz/vim-startify"
Bundle "scrooloose/syntastic"
Bundle "tpope/vim-eunuch"
Bundle "tpope/vim-fugitive"
Bundle 'flazz/vim-colorschemes'

" Set colour after vim-colorschemes
color Monokai

filetype plugin indent on

" .rc are shell files
au BufNewFile,BufRead *.rc set ft=sh
au FileType sh set ts=2 sw=2 et

" .phtml and .sync are php files
au BufNewFile,BufRead *.phtml,*.sync set ft=php

" Ruby - what tabs?
au FileType ruby,eruby set ts=2 sw=2 tw=79 et sts=2 smartindent
au BufNewFile,BufRead *.rake,*.mab set ft=ruby
au BufNewFile,BufRead *.erb set ft=eruby

" Puppet
au BufRead,BufNewFile *.pp set ft=puppet
au FileType puppet set ts=2 sw=2 tw=79 et sts=2 smartindent

" Yum repos
au BufRead,BufNewFile *.repo set ft=yum

" YAML
au FileType yaml set ts=2 sw=2 et

" source code gets wrapped at <80
au FileType asm,javascript,php,html,perl,c,cpp set tw=79 autoindent

" makefiles and c have tabstops at 8 for portability
au FileType make,c,cpp set ts=8 sw=8

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " In text files, always limit the width of text to 78 characters
  autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif

  " Clear whitespace at the end of lines automatically
  autocmd BufWritePre * :%s/\s\+$//e
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
" Map F2 to NERDTree
map <leader>t :NERDTreeToggle<CR>

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Improve up/down movement on wrapped lines
nnoremap j gj
nnoremap k gk

" Make navigating around splits easier
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" Remove ^M from file with \m
map <Leader>m :%s/^M//<CR>

" select all with \a
map <Leader>a ggVG

" Source ~/.vimrc with \s
nmap <Leader>s :source $HOME/.vimrc<CR>

" Shortcut to yanking to the system clipboard
map <leader>y "*y
map <leader>p "*p

" Clear search highlighting with ESC
noremap <silent><leader>/ :nohlsearch<cr>

" CtrlP
nnoremap <leader>t :CtrlP<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>l :CtrlPLine<cr>

" Lazy comments
map ,# :s/^/#/<CR>:nohlsearch<CR>
map ,/ :s/^/\/\//<CR>:nohlsearch<CR>
map ," :s/^/\"/<CR>:nohlsearch<CR>
map ,; :s/^/;/<CR>:nohlsearch<CR>

"set clipboard=unnamed,unnamedplus

" Command to write as root if we don't have permission
cmap w!! %!sudo tee > /dev/null %

" JSON
let g:vim_json_syntax_conceal = 0

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
