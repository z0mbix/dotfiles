scriptencoding utf-8
set encoding=utf-8

set statusline=%<%f%h%m%r%w%y%=%l/%L,%c\ %P\ \|\ %n
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
set laststatus=2						" always show status line
set pastetoggle=<C-p>					" Ctrl+p to toggle pasting
set spellfile=~/.vimspell.add"			" my words
set confirm								" ask to save files
set t_Co=256							" use all 256 colors
set autoread							" reload files changed outside vim
set viminfo='100,f1						" save up to 100 marks, enable capital marks
set listchars=tab:›\ ,eol:¬,trail:·,extends:❯,precedes:❮ " set the characters for the invisibles
set list								" Show invisible characters
set splitbelow							" splits show up below by default
set splitright							" splits go to the right by default
" set colorcolumn=80						" highlight 80 character limit
" let &colorcolumn=join(range(81,999),",")
set scrolloff=4							" start scrolling when we're 4 lines away from margins
set sidescrolloff=15					" start scrolling when we're 15 lines away from margins
set sidescroll=1 						" Enable side scrolling
set nrformats=							" Treat numbers as decimal instead of octal
set noswapfile              " We live in the future

" Tab completion settings
set wildmenu
" set wildmode=list:longest                        " Wildcard matches show a list, matching the longest first
set wildmode=full
set wildignore+=.git,.hg,.svn                    " Ignore version control repos
set wildignore+=*.6                              " Ignore Go compiled files
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc                            " Python byte code

let mapleader=","                                " The <leader> key

filetype off                                     " required for vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

let g:vim_home_path = "~/.vim"

execute "set rtp+=" . g:vim_home_path . "/bundle/vundle/"
let g:vundle_default_git_proto = 'https'
call vundle#rc(g:vim_home_path. "/bundle")

Bundle 'gmarik/vundle'

" Language plugins
Bundle "elzr/vim-json"
Bundle "empanda/vim-varnish"
Bundle "evanmiller/nginx-vim-syntax"
Bundle "groenewege/vim-less"
Bundle "PProvost/vim-ps1"
Bundle "rodjek/vim-puppet"
Bundle "tpope/vim-markdown"
Bundle "fatih/vim-go"

" Other plugins
Bundle "scrooloose/nerdtree"
Bundle "airblade/vim-gitgutter"
Bundle "kien/ctrlp.vim"
Bundle "Lokaltog/vim-easymotion"
Bundle "bling/vim-airline"
Bundle "mileszs/ack.vim"
Bundle "scrooloose/syntastic"
Bundle "tpope/vim-eunuch"
Bundle "tpope/vim-fugitive"
Bundle "flazz/vim-colorschemes"
Bundle "chriskempson/base16-vim"
Bundle "terryma/vim-multiple-cursors"
Bundle "joonty/vdebug"
Bundle "ervandew/supertab"
Bundle "tpope/vim-surround"
Bundle "tpope/vim-repeat"
Bundle "henrik/vim-reveal-in-finder"
Bundle "tpope/vim-commentary"
Bundle "tpope/vim-unimpaired"
Bundle "duff/vim-bufonly"
Bundle "rbgrouleff/bclose.vim"
Bundle "nathanaelkane/vim-indent-guides"
Bundle "danro/rename.vim"
Bundle "michaeljsmith/vim-indent-object"
Bundle "Townk/vim-autoclose"
Bundle "amiorin/vim-project"
Bundle "rking/ag.vim"
Bundle "bling/vim-bufferline"
Bundle "terryma/vim-expand-region"
Bundle 'junegunn/vim-easy-align'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tpope/vim-endwise"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"

" Set colour after vim-colorschemes
set background=dark
color base16-ocean

filetype plugin indent on

" .rc are shell files
au BufNewFile,BufRead *.rc,*.sh set ft=sh
au FileType sh set ts=2 sw=2 et smartindent

" Ruby - what tabs?
au BufNewFile,BufRead *.rake,*.mab,*.ru set ft=ruby
au BufNewFile,BufRead *.erb set ft=eruby
au BufNewFile,BufRead *.rub set ft=eruby
au BufNewFile,BufRead .irbrc,.pryrc,Capfile,Gemfile,Rakefile,Vagrantfile,Puppetfile set ft=ruby
au FileType ruby,eruby set ts=2 sw=2 tw=79 et sts=2 smartindent

" PHP
au BufNewFile,BufRead *.php set ft=php
au FileType php set ts=4 sw=4 tw=79 et sts=4 smartindent
let php_sql_query=1
let php_htmlInStrings=1

" Perl
let perl_extended_vars=1

" Python
au FileType python set ts=4 sw=4 tw=79 et sts=4

" JavaScript
au BufNewFile,BufRead *.js set ft=javascript
au FileType javascript set ts=2 sw=2 tw=79 et sts=2 smartindent

" JSON
let g:vim_json_syntax_conceal = 0

" nginx
au BufRead,BufNewFile */etc/nginx/* set ft=nginx ts=4 sw=4 sts=4 et smartindent
autocmd FileType nginx set commentstring=#\ %s


" Abbreviations
inoreabbrev teh the
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q


" Resize splits when the window is resized
au VimResized * :wincmd =

" simple separators for buffer list
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" The Silver Searcher
if executable('ag')
	let g:ackprg = 'ag --nogroup --nocolor --column'
	" Bind K to grep (with the silver searcher) for the word under cursor
	nnoremap K :Ag <cword> *<CR>
endif


" " miniBufExpl
" let g:miniBufExplMapWindowNavVim = 1
" let g:miniBufExplMapWindowNavArrows = 1
" let g:miniBufExplMapCTabSwitchBufs = 1
" let g:miniBufExplModSelTarget = 1
" let g:miniBufExplCycleArround = 1
" let g:miniBufExplUseSingleClick = 1
" let g:miniBufExplBRSplit = 1

let g:bufferline_echo = 0

" Switch buffers
" map <C-Tab> :MBEbn<CR>
" map <C-S-Tab> :MBEbp<CR>
map <C-Tab> :bn<CR>
map <C-S-Tab> :bp<CR>
map <D-1> :b1<CR>
map <D-2> :b2<CR>
map <D-3> :b3<CR>
map <D-4> :b4<CR>
map <D-5> :b5<CR>
map <D-6> :b6<CR>
map <D-7> :b7<CR>
map <D-8> :b8<CR>
map <D-9> :b9<CR>

" Bclose
map <leader>x :Bclose<CR>
map <leader>X :Bclose!<CR>

" vim-expand-region
" Extend the global default (NOTE: Remove comments in dictionary before sourcing)
call expand_region#custom_text_objects({
      \ "\/\\n\\n\<CR>": 1,
      \ 'a]' :1,
      \ 'ab' :1,
      \ 'aB' :1,
      \ 'ii' :0,
      \ 'ai' :0,
      \ })

" :)
map q: :q

" Easily go to the top/bottom of the file
nnoremap <CR> G
nnoremap <BS> gg

" Run current buffer through jq back in to the same buffer
map <leader>J :%!jq .<CR>
" Run current file through jq to see if it parses successfully
map <leader>j :!jq -M -c . % 2>&1 >/dev/null<CR>

runtime macros/matchit.vim
map <tab> %

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L $
vnoremap L g_

nnoremap <leader>o :CtrlP<CR>

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap <Leader>a <Plug>(EasyAlign)

" Indent Guides
" let g:indent_guides_enable_on_vim_startup = 1

" Puppet
au BufRead,BufNewFile *.pp set ft=puppet
au FileType puppet set ts=2 sw=2 tw=79 et sts=2 smartindent
autocmd FileType puppet set commentstring=#\ %s

" Yum repos
au BufRead,BufNewFile *.repo set ft=yum

" YAML
au BufRead,BufNewFile *.yml,*.yaml set ft=yaml
au FileType yaml set ts=4 sw=4 et

" source code gets wrapped at <80
au FileType asm,javascript,php,html,perl,c,cpp set tw=79 autoindent

" makefiles and c have tabstops at 8 for portability
au FileType make,c,cpp set ts=8 sw=8

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " Save when focus is lost
  "au FocusLost * :wa
  " In text files, always limit the width of text to 78 characters
  autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif

  " Clear whitespace at the end of lines automatically
  autocmd BufWritePre * :%s/\s\+$//e

  " automatically reload vimrc when it's saved
  autocmd BufWritePost .vimrc source $HOME/.vimrc
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

augroup ps_nerdtree
  au!
  au Filetype nerdtree setlocal nolist
  au Filetype nerdtree nnoremap <buffer> H :vertical resize -10<cr>
  au Filetype nerdtree nnoremap <buffer> L :vertical resize +10<cr>
augroup END

let NERDTreeHighlightCursorline = 1
let NERDTreeIgnore = ['.vim$', '\~$', '.*\.pyc$', 'pip-log\.txt$', 'whoosh_index',
                    \ 'xapian_index', '.*.pid', 'monitor.py', '.*-fixtures-.*.json',
                    \ '.*\.o$', 'db.db', 'tags.bak', '.*\.pdf$', '.*\.mid$',
                    \ '.*\.midi$']

let NERDTreeMinimalUI = 0
let NERDTreeDirArrows = 1
let NERDChristmasTree = 1
let NERDTreeChDirMode = 2
let NERDTreeMapJumpFirstChild = 'gK'
let g:NERDTreeWinSize = 40

" Ranger
nnoremap <leader>r :silent !ranger %:h<cr>:redraw!<cr>
nnoremap <leader>R :silent !ranger<cr>:redraw!<cr>

" Uppercase previous word with Ctrl+u
inoremap <C-u> <esc>mzgUiw`za

" Formatting, TextMate-style
nnoremap Q gqip
vnoremap Q gq

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

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
silent !mkdir -p ~/.vim/{backup,swap,cache}/
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

" Puppet stuff
let g:syntastic_puppet_puppetlint_args='--no-80chars-check
  \ --no-autoloader_layout-check
  \ --no-quoted_booleans-check
  \ --no-class_inherits_from_params_class-check'

" Fix common typos
iab teh		the
iab Teh		The

if !exists("g:vdebug_options")
  let g:vdebug_options = {}
endif

" listen on all interfaces
let g:vdebug_options['server'] = '10.4.0.1'
let g:vdebug_options['port'] = '9001'
let g:vdebug_options['path_maps'] = { '/home/vagrant' : '/Users/David' }

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

if has('gui_macvim')
  "  switch OSX windows with swipes
  nnoremap <silent> <SwipeLeft> :macaction _cycleWindowsBackwards:<CR>
  nnoremap <silent> <SwipeRight> :macaction _cycleWindows:<CR>

  " TextMate indentation key mappings for mvim Cmd+[ and Cmd+]
  nmap <D-[> <<
  nmap <D-]> >>
  vmap <D-[> <gv
  vmap <D-]> >gv

  " Source the gvimrc file after saving it
  if has("autocmd")
    autocmd bufwritepost .gvimrc source ~/.gvimrc
  endif
endif

" Remove annoying F1 help
inoremap <F1> <nop>
nnoremap <F1> <nop>
vnoremap <F1> <nop>

nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>s <C-w>s<C-w>l

" One less key to hit
"nnoremap ; :

" Show registers
" nnoremap <leader>r :registers<cr>

" Retab and Format the File with Spaces
nnoremap <leader>T :set expandtab<cr>:retab!<cr>

" Toggle line numbers
nnoremap <leader>N :setlocal number!<cr>:setlocal norelativenumber!<cr>

" Remap 'jj' to Esc
inoremap jj <Esc>

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

" Easily fix = & : alignments
nmap <Leader>T= :Tabularize /=<CR>
vmap <Leader>T= :Tabularize /=<CR>
nmap <Leader>T: :Tabularize /:\zs<CR>
vmap <Leader>T: :Tabularize /:\zs<CR>

" Quickly toggle `set list` (Show/Hide invisible characters)
nmap <leader>' :set list!<CR>

" Quickly edit ~/.vimrc file
"nmap <leader>v :tabedit $MYVIMRC<CR>
nnoremap <leader>v <C-w><C-v><C-l>:e $MYVIMRC<cr>

" NERDTree mappings
map <F2> :NERDTreeToggle<CR>
map <leader>n :NERDTreeToggle<CR>

" Remove ^M from file
map <leader>m :%s/^M//<CR>

" select all
map <leader>a ggVG

" Shortcut to yanking to the system clipboard
map <leader>y "*y
map <leader>p "*p

" Clear search highlighting with ESC
noremap <silent><leader>/ :nohlsearch<cr>

" CtrlP
nnoremap <leader>t :CtrlP<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>l :CtrlPLine<cr>

" Hop to start/end of line
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" " Space to toggle folds.
" nnoremap <Space> za
" vnoremap <Space> za

set clipboard=unnamed,unnamedplus

" Command to write as root if we don't have permission
cmap w!! %!sudo tee > /dev/null %

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
if filereadable(glob("~/.vim/private"))
  source ~/.vim/private
endif
