"
" Vim 7 config
" z0mbix <zombie@zombix.org>
" Last update: 07/01/2011
"

set statusline=%<%f%h%m%r%w%y%=%l/%L,%c\ %P\ \|\ %n
set title
set number								" show line numbers
set ruler								" show line and column no
set hidden								" hidden buffers?
set showcmd								" show command in last line
set nocompatible						" not compatible with vi
set showmode							" show mode in mode line
set modeline							" show mode line
set ignorecase							" ignore case when searching
set incsearch							" search while typing
set backspace=indent,eol,start			" super backspacing
set smartcase							" smart searching
set tabstop=4							" default tabs to 4 spaces
set shiftwidth=4						" match default tab spacing
set hlsearch							" highlight search results
set autoindent							" auto indent new lines
set linebreak							" enable linebreaks
set showbreak=>>						" what to put infront of linebreaks
set history=200							" set command and search history
set noerrorbells						" don't annoy me
set novisualbell						" disable visual bell
set report=0							" always report lines changed
set showmatch							" show matching brackets
set foldenable							" enable folding
set foldmethod=indent					" fold lines with equal indent
set foldlevel=100						" set fold close level
set laststatus=2 						" always show status line
set pastetoggle=<C-p>					" Ctrl+p to toggle pasting
set spellfile=~/.vimspell.add" 			" my words
set confirm								" ask to save files
"set t_Co=256							" use all 256 colors
"syntax on								" enable syntax highlighting
filetype on
filetype plugin on
"color torte
"color desert
color z0mbix

" .phtml and .sync are php files
au BufNewFile,BufRead *.phtml,*.sync set ft=php

" these are rubyish files
au BufNewFile,BufRead *.rake,*.mab set ft=ruby
au BufNewFile,BufRead *.erb set ft=eruby

" ruby - what tabs?
au FileType ruby,eruby set ts=2 sw=2 tw=79 et sts=2 smartindent

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

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
  syntax on
endif

" highlight statusbar
hi statusline ctermbg=black ctermfg=green
hi statuslinenc ctermbg=gray ctermfg=darkgray

" Highlight line if in insert mode
"hi CursorLine ctermbg=green ctermfg=black cterm=none
"au InsertEnter * set cursorline
"au InsertLeave * set nocursorline

" don't pollute directories with swap files, keep them in one place
silent !mkdir -p ~/.vim/{backup,swp}/
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

" Language specific stuff
let php_sql_query=1
let php_htmlInStrings=1
let php_folding=1
let perl_extended_vars=1

" Insert mode maps
imap ;EM zombie@zombix.org
imap ;WWW http://www.zombix.org/

" Normal mode paps
nmap ,s :source $HOME/.vimrc

" Use ctrl+n/p to switch buffers
nnoremap <C-N> :next<Enter>
nnoremap <C-P> :prev<Enter>

" vim: tabstop=8:shiftwidth=8:
