" vim:foldmethod=marker:foldlevel=0
" Settings {{{
scriptencoding utf-8
set encoding=utf-8                                       " default to utf-8
set statusline=%<%f%h%m%r%w%y%=%l/%L,%c\ %P\ \|\ %n      " dope statusline
set shortmess=atOI                                       " disable start-up message
set number                                               " show line numbers
set relativenumber                                       " show relative line numbers
set ruler                                                " show line and column no
set hidden                                               " hidden buffers?
set showcmd                                              " show command in last line
set nocompatible                                         " not compatible with vi
set ignorecase                                           " ignore case when searching
set incsearch                                            " search while typing
set backspace=indent,eol,start                           " super backspacing
set smartcase                                            " smart searching
set tabstop=4                                            " default tabs to 4 spaces
set shiftwidth=4                                         " match default tab spacing
set hlsearch                                             " highlight search results
set autoindent                                           " auto indent new lines
set linebreak                                            " enable linebreaks
set showbreak=>>                                         " what to put infront of linebreaks
set breakindent                                          " preserve horizontal blocks
set formatoptions+=j formatoptions-=or                   " remove comments when joining lines
set formatoptions+=j                                     " remove comments when joining lines
set nostartofline                                        " keep cursor in same column
set history=200                                          " set command and search history
set noerrorbells                                         " don't annoy me
set novisualbell                                         " disable visual bell
set report=0                                             " always report lines changed
set showmatch                                            " show matching brackets
set foldenable                                           " enable folding
set foldmethod=indent                                    " fold lines with equal indent
set foldlevel=20                                         " set fold close level
set laststatus=2                                         " always show status line
set ttyfast                                              " fast terminal conn for faster redraw
set pastetoggle=<F8>                                     " toggle pasting
set clipboard=unnamed,unnamedplus                        " use system clipboard "
set spellfile=~/.vimspell.add                            " my words
set confirm                                              " ask to save files
set viminfo='100,f1                                      " save up to 100 marks, enable capital marks
set listchars=tab:›\ ,eol:¬,trail:·,extends:❯,precedes:❮,nbsp:_ " set the characters for the invisibles
set list                                                 " Show invisible characters
set splitbelow                                           " splits show up below by default
set splitright                                           " splits go to the right by default
set scrolloff=4                                          " start scrolling when we're 4 lines away from margins
set sidescrolloff=15                                     " start scrolling when we're 15 lines away from margins
set sidescroll=1                                         " enable side scrolling
set nrformats=                                           " treat numbers as decimal instead of octal
set noswapfile                                           " we live in the future
set showtabline=1                                        " only show the tabline when more than one tab open
set autoread                                             " detect files changed outside of vim
set noshowmode                                           " don't show the default vim mode line
set modeline                                             " don't show mode line
set lazyredraw                                           " Redraw only when required
set mouse=a                                              " enable mouse support
set nojoinspaces                                         " remove extra space when joining lines
set wildmenu                                             " Tab completion
set wildmode=list:longest,full                           " Wildcard matches show a list, matching the longest first
set wildignore+=.git,.hg,.svn                            " Ignore version control repos
set wildignore+=*.6                                      " Ignore Go compiled files
set wildignore+=.hg,.git,.svn                            " Version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg           " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest         " compiled object files
set wildignore+=*.spl                                    " compiled spelling word lists
set wildignore+=*.sw?                                    " Vim swap files
set wildignore+=*.DS_Store                               " OSX bullshit
set wildignore+=*.luac                                   " Lua byte code
set wildignore+=*.pyc                                    " Python byte code

if has('nvim')
	set inccommand=nosplit
endif


" undofile - This allows you to use undos after exiting and restarting
" This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
" :help undo-persistence
if exists("+undofile")
	if isdirectory($HOME . '/.vim/undo') == 0
		:silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
	endif
	set undodir=./.vim-undo//
	set undodir+=~/.vim/undo//
	set undofile
endif

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

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10
augroup FastEscape
	autocmd!
	au InsertEnter * set timeoutlen=0
	au InsertLeave * set timeoutlen=1000
augroup END

let mapleader=" "
" }}}

" Plugins {{{
" Auto install vim-plug
if has('nvim')
	let s:plug_dir = '~/.local/share/nvim/plugged'
	let s:plug_file = '~/.local/share/nvim/site/autoload/plug.vim'
else
	let s:plug_dir = '~/.vim/plugged'
	let s:plug_file = '~/.vim/autoload/plug.vim'
endif

if empty(glob(s:plug_file))
	if executable('curl')
		silent execute '!curl -fLo ' . s:plug_file . ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
		autocmd VimEnter * PlugInstall | source $MYVIMRC
	endif
endif

call plug#begin(s:plug_dir)

if has('python') || has('python3')
	Plug 'davidhalter/jedi-vim', { 'for': 'python' }
	Plug 'SirVer/ultisnips'
	Plug 'honza/vim-snippets'
endif

if has('python3')
	if has('nvim')
		Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	else
		Plug 'Shougo/deoplete.nvim'
		Plug 'roxma/nvim-yarp'
		Plug 'roxma/vim-hug-neovim-rpc'
	endif
	Plug 'zchee/deoplete-jedi'
	Plug 'zchee/deoplete-go', { 'do': 'make' }
	let g:deoplete#enable_at_startup = 1
endif

if has('nvim') || v:version >= 800
	Plug 'machakann/vim-highlightedyank'
endif

if executable('go')
	Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' }
	if has('nvim')
		Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.local/share/nvim/plugged/gocode/nvim/symlink.sh' }
	else
		Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
	endif
endif

" Language plugins
Plug 'dougireton/vim-chef', { 'for': 'chef' }
Plug 'ekalinin/Dockerfile.vim', { 'for' : 'Dockerfile' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'fatih/vim-nginx', { 'for': 'nginx' }
Plug 'hashivim/vim-packer', { 'for': 'json' }
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
Plug 'juliosueiras/vim-terraform-completion', { 'for': 'terraform' }
Plug 'martinda/Jenkinsfile-vim-syntax', { 'for': 'jenkinsfile' }
Plug 'ngmy/vim-rubocop', { 'for': 'ruby' }
Plug 'pearofducks/ansible-vim', { 'for': 'ansible' }
Plug 'phenomenes/ansible-snippets', { 'for': 'ansible' }
Plug 'rizzatti/dash.vim'
Plug 'tell-k/vim-autopep8', { 'for': 'python' }
Plug 'z0mbix/vim-shfmt', { 'for': 'sh' }

" Other plugins
Plug 'AndrewRadev/splitjoin.vim'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'FooSoft/vim-argwrap'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'airblade/vim-gitgutter'
Plug 'arcticicestudio/nord-vim'
Plug 'bling/vim-bufferline'
Plug 'bogado/file-line'
Plug 'danro/rename.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'duff/vim-bufonly'
Plug 'enricobacis/vim-airline-clock'
Plug 'ervandew/supertab'
Plug 'henrik/vim-reveal-in-finder'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-after-object'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-peekaboo'
Plug 'kana/vim-submode'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'michaeljsmith/vim-indent-object'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'rbgrouleff/bclose.vim'
Plug 'rhysd/clever-f.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'sodapopcan/vim-twiggy'
Plug 'terryma/vim-expand-region'
Plug 'terryma/vim-multiple-cursors'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tweekmonster/startuptime.vim'
Plug 'valloric/listtoggle'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'wellle/targets.vim'

call plug#end()
" }}}

" Colours/Theme {{{
" Set colour after vim-colorschemes
set background=dark
let g:rehash256 = 1
if (has("termguicolors"))
	set termguicolors
endif
color nord
syntax on
set t_ut=
set fillchars+=vert:│
hi VertSplit ctermbg=none guibg=none
" }}}

" Auto Commands {{{

" Highlight line if in insert mode
autocmd InsertEnter * set cursorline
autocmd InsertLeave * set nocursorline

" git commit messages
autocmd FileType gitcommit set textwidth=72
autocmd FileType gitcommit set colorcolumn=73

" Shell files
autocmd BufNewFile,BufRead *.rc,*.sh set ft=sh
autocmd FileType sh set ts=2 sw=2 et smartindent

" Ruby
autocmd BufNewFile,BufRead *.rake,*.mab,*.ru set ft=ruby
autocmd BufNewFile,BufRead *.erb set ft=eruby
autocmd BufNewFile,BufRead *.rub set ft=eruby
autocmd BufNewFile,BufRead .irbrc,.pryrc,Capfile,Gemfile,Rakefile,Vagrantfile,Puppetfile set ft=ruby
autocmd FileType ruby,eruby set ts=2 sw=2 tw=79 et sts=2 smartindent

" PHP
autocmd BufNewFile,BufRead *.php set ft=php
autocmd FileType php set ts=4 sw=4 tw=79 et sts=4 smartindent
let php_sql_query=1
let php_htmlInStrings=1

" Python
autocmd BufNewFile,BufRead .py set ft=python
autocmd FileType python set ts=4 sw=4 tw=160 et sts=4 smartindent
autocmd FileType python map <buffer> <F7> :call Autopep8()<CR>
let g:autopep8_disable_show_diff = 1
let g:autopep8_max_line_length = 160
let g:autopep8_on_save = 1

" JavaScript
autocmd BufNewFile,BufRead *.js set ft=javascript
autocmd FileType javascript set ts=2 sw=2 tw=79 et sts=2 smartindent

" JSON
autocmd BufNewFile,BufRead *.json,*.json.j2 set ft=json
autocmd FileType json set ts=2 sw=2 et sts=2 smartindent
let g:vim_json_syntax_conceal = 0

" YAML
autocmd BufNewFile,BufRead *.yaml,*.yml.j2,*.yaml.j2,*.yml.j2 set ft=yaml
autocmd FileType yaml set ts=2 sw=2 et sts=2 smartindent

" The Jenkinsfile
autocmd BufNewFile,BufRead *.Jenkinsfile set ft=jenkinsfile
autocmd BufNewFile,BufRead Jenkinsfile set ft=jenkinsfile
autocmd BufNewFile,BufRead Jenkinsfile* set ft=jenkinsfile

" nginx
autocmd BufRead,BufNewFile */etc/nginx/* set ft=nginx ts=4 sw=4 sts=4 et smartindent
autocmd FileType nginx set commentstring=#\ %s

" Puppet
autocmd BufRead,BufNewFile *.pp set ft=puppet
autocmd FileType puppet set ts=2 sw=2 tw=79 et sts=2 smartindent
autocmd FileType puppet set commentstring=#\ %s

" Yum repos
autocmd BufRead,BufNewFile *.repo,*.repo.j2 set ft=yum

" Source code gets wrapped at <80
autocmd FileType asm,javascript,php,html,perl,c,cpp set tw=79 autoindent

" Makefiles and c have tabstops at 8 for portability
autocmd FileType make,c,cpp set ts=8 sw=8

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
			\ if line("'\"") > 0 && line ("'\"") <= line("$") |
			\   exe "normal! g'\"" |
			\ endif

" Clear whitespace at the end of lines automatically
autocmd BufWritePre * :%s/\s\+$//e

" Automatically reload vim config when it's saved
autocmd BufWritePost .vimrc,init.vim source $MYVIMRC

" Resize splits when the window is resized
autocmd VimResized * :wincmd =

" vim-after-object - e.g. ca= / da= etc.
autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')

" Toggle relativenumber in insert mode
augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
	autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" git re-uses the same filename all the time, so ignore viminfo
autocmd BufNewFile,BufRead *.git/* call setpos('.', [0, 1, 1, 0])
" }}}

" Abbreviations {{{
" abbreviations
inoreabbrev teh the
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q ccl<cr>
" }}}

" Variables {{{

" Auto run shfmt on save
let g:shfmt_fmt_on_save = 1
let g:shfmt_extra_args = '-i 2'

" supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
"
" jedi
let g:deoplete#sources#jedi#show_docstring = 1
"
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_airline_tabline = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1 " enable folder glyph flag
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:WebDevIconsOS = 'Darwin'

" vim-gitgutter
let g:gitgutter_map_keys = 0

" UltiSnips
let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" ansible-vim
let g:ansible_extra_keywords_highlight = 1
let g:ansible_attribute_highlight = "ob"

" ansible-snippets
let g:neosnippet#snippets_directory='~/.vim/plugged/ansible-snippets/snippets'

" simple separators for buffer list
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" clever-f
let g:clever_f_timeout_ms = 2000
let g:clever_f_mark_char = 1
" let g:clever_f_mark_char_color = "Type" " yellow from onedark theme

" Stop bufferline from echoing to command bar (vim-bufferline)
let g:bufferline_echo = 0

" Always use two space indentation for shell scripts
let g:vimshfmt_extra_args = '-i 2'
" }}}

" Mappings {{{
" inoremap <expr> <cr> ((pumvisible())?("\<C-y>"):("\<cr>"))

nmap <leader>tb :TagbarToggle<CR>

nnoremap <leader>A :silent ArgWrap<CR>

" Hit that file with a hammer
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" zip a character left and right
nnoremap zl :let @z=@"<cr>xBP:let @"=@z<cr>
nnoremap zr :let @z=@"<cr>x$p:let @"=@z<cr>

" Closing/saving
nmap <Leader>q :q<CR>
nmap <Leader>w :update<CR>

" Dash
nmap <silent> <leader>dl <Plug>DashSearch
vmap <silent> <leader>dl <Plug>DashSearch

" Close quickfix
nmap <Leader>c :cclose<CR>

" Undotree
nmap <Leader>u :UndotreeToggle<CR>

" splitjoin
let g:splitjoin_split_mapping = ''
let g:splitjoin_join_mapping = ''
nnoremap gss :SplitJoinSplit<CR>
nnoremap gsj :SplitJoinJoin<CR>

nmap     <Leader>gs :Gstatus<CR>gg<c-n>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gb :Gblame<CR>

" Search for words
nnoremap <silent> <Leader>fi /<C-R><C-W><CR>
nnoremap <silent> <Leader>fw :Rg <C-R><C-W><CR>
nnoremap <silent> <Leader>fW :Rg <C-R><C-A><CR>
xnoremap <silent> <Leader>fw y:Rg <C-R>"<CR>

" Insert lines above/below
nnoremap <Leader>o o<esc>
nnoremap <Leader>O O<esc>

nnoremap <leader>q :cclose<bar>lclose<cr>

" vim-workspaces toggle
nnoremap <leader>ws :ToggleWorkspace<CR>

" Refill the default register with what was just pasted
xnoremap p pgvy

" Make Y consistent with D
nnoremap Y y$

" Atom style Comments
nmap <D-/> gcc
vmap <D-/> gc
nmap <C-/> gcc
vmap <C-/> gc

" Re-idents entire file
nnoremap <F7> mzgg=G`z

" Bclose
nnoremap <silent> <leader>x :Bclose<CR>
nnoremap <silent> <leader>X :Bclose!<CR>
nnoremap <silent> ,x :Bclose<CR>
nnoremap <silent> ,X :Bclose!<CR>

nnoremap <leader>v V

" listtoggle
let g:lt_location_list_toggle_map = '<leader>L'
let g:lt_quickfix_list_toggle_map = '<leader>Q'

" Switch buffers - vim-submode
let g:submode_timeout = 0
" let g:submode_timeoutlen = 2
let g:submode_keep_leaving_key = 1
let g:submode_keyseqs_to_leave = ['Esc', 'Space']
call submode#enter_with('bnext/bprev', 'n', '', '<Leader>l', ':bn<CR>')
call submode#enter_with('bnext/bprev', 'n', '', '<Leader>h', ':bp<CR>')
call submode#map('bnext/bprev',        'n', '', 'l', ':bn<CR>')
call submode#map('bnext/bprev',        'n', '', 'h', ':bp<CR>')

" Split the current line at the cursor position and paste above
" the current line
nnoremap K DO<C-r>"<ESC>_

" :)
map q: :q

if executable('jq')
	" Run current buffer through jq back in to the same buffer
	map <leader>J :%!jq .<CR>
	" Run current file through jq to see if it parses successfully
	map <leader>j :!jq -M -c . % 2>&1 >/dev/null<CR>
endif

" map <tab> %

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L $
vnoremap L g_

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap <leader>a <Plug>(EasyAlign)

" Fugitive
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Gblame<CR>

" Formatting, TextMate-style
nnoremap Q gqip
vnoremap Q gq

" Keep the cursor in place while joining lines
nnoremap J mzJ`z


if exists('veonim')
	set guifont=RobotoMono\ Nerd\ Font:h12
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

	" Duplicate line with Cmd+d
	nmap <D-d> yyp
endif

" Remove annoying F1 help
inoremap <F1> <nop>
nnoremap <F1> <nop>
vnoremap <F1> <nop>

" Split window
nnoremap <leader>sv <C-w>v<C-w>l
nnoremap <leader>sh <C-w>s<C-w>l

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
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

" Easily fix = & : alignments
nmap <leader>T= :Tabularize /=<CR>
vmap <leader>T= :Tabularize /=<CR>
nmap <leader>T: :Tabularize /:\zs<CR>
vmap <leader>T: :Tabularize /:\zs<CR>

" Quickly toggle `set list` (Show/Hide invisible characters)
nmap <leader>' :set list!<CR>

" NERDTree mappings
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap § :NERDTreeToggle<CR> " Macs
nnoremap ` :NERDTreeToggle<CR> " Non-Macs

" Remove ^M from file
map <leader>M :%s/^M//<CR>

" Bubble multiple lines
vmap <C-K> [egv
vmap <C-J> ]egv

" Show current file in finder
nnoremap <leader>F :silent :Reveal<cr>

" select all
map <leader>a ggVG

" Shortcut to yanking to the system clipboard
map <leader>y "*y
map <leader>p "*p

" Clear search highlighting
noremap <silent><leader>/ :nohlsearch<cr>

" " Easy window resizing
" nnoremap <Tab><Left> :vertical resize +5<CR>
" nnoremap <Tab><Right> :vertical resize -5<CR>
" nnoremap <Tab><Down> :res +5<CR>
" nnoremap <Tab><Up> :res -5<CR>

" Hop to start/end of line
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Space to toggle folds.
nnoremap <Enter> za
vnoremap <Enter> za

" Command to write as root if we don't have permission
cmap w!! %!sudo tee > /dev/null %
" }}}

" vim-expand-region {{{
call expand_region#custom_text_objects({
			\ "\/\\n\\n\<CR>": 1,
			\ 'a]' :1,
			\ 'ab' :1,
			\ 'aB' :1,
			\ 'ii' :0,
			\ 'ai' :0,
			\ })
" }}}

" {{{ fzf
let g:fzf_layout = { 'down': '~20%' }
let g:fzf_colors =
			\ { 'fg':    ['fg', 'Normal'],
			\ 'bg':      ['bg', 'Normal'],
			\ 'hl':      ['fg', 'Comment'],
			\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
			\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
			\ 'hl+':     ['fg', 'Statement'],
			\ 'info':    ['fg', 'PreProc'],
			\ 'border':  ['fg', 'Ignore'],
			\ 'prompt':  ['fg', 'Conditional'],
			\ 'pointer': ['fg', 'Exception'],
			\ 'marker':  ['fg', 'Keyword'],
			\ 'spinner': ['fg', 'Label'],
			\ 'header':  ['fg', 'Comment'] }

" Use ripgrep instead of ag:
if executable('rg')
	command! -bang -nargs=* Rg
				\ call fzf#vim#grep(
				\   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
				\   <bang>0 ? fzf#vim#with_preview('up:60%')
				\           : fzf#vim#with_preview('right:50%:hidden', '?'),
				\   <bang>0)
endif

nmap <c-p> :Files<CR>
nmap <Leader><Space> :BLines<CR>
nmap <Leader>ff :Files<CR>
nmap <Leader>fF :GFiles<CR>
nmap <Leader>fb :Buffers<CR>
nmap <Leader>fh :History<CR>
nmap <Leader>ft :Filetypes<CR>
nmap <Leader>fT :Tags<CR>
nmap <Leader>fl :BLines<CR>
nmap <Leader>fL :Lines<CR>
nmap <Leader>fm :Marks<CR>
nmap <Leader>fa :Rg<Space>
nmap <Leader>fc :Colors<CR>
nmap <Leader>f/ :History/<Space>

nmap <Leader>w :update<CR>

" Open fzf if vim opened without any args except in home dir
if argc() == 0 && getcwd() != expand("~")
	if isdirectory('.git')
		autocmd vimenter * GFiles
	else
		autocmd vimenter * Files
	endif
endif
" }}}

" NERDTree {{{
" Open NERDTree automatically when vim starts up if no file is specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Auto refresh NERDTree on focus
" autocmd WinEnter * if exists('b:NERDTree') | execute 'normal R' | endif

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

" Quit NERDTree when last file closed
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

augroup ps_nerdtree
	au!
	au Filetype nerdtree setlocal nolist
	au Filetype nerdtree nnoremap <buffer> H :vertical resize -10<cr>
	au Filetype nerdtree nnoremap <buffer> L :vertical resize +10<cr>
augroup END

let NERDTreeHighlightCursorline = 1
" let NERDTreeIgnore = ['.vim$', '\~$', '.*\.pyc$', 'pip-log\.txt$', 'whoosh_index',
"                     \ 'xapian_index', '.*.pid', 'monitor.py', '.*-fixtures-.*.json',
"                     \ '.*\.o$', 'db.db', 'tags.bak', '.*\.pdf$', '.*\.mid$',
"                     \ '.*\.midi$']

let g:NERDTreeMinimalUI = 1
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeDirArrowExpandable = "\u00a0" " make arrows invisible
let g:NERDTreeDirArrowCollapsible = "\u00a0" " make arrows invisible
let g:NERDTreeNodeDelimiter = "\u263a" " smiley face

" let s:brown = "905532"
" let s:aqua =  "3AFFDB"
" let s:blue = "58A4D7"
" let s:darkBlue = "2980B9"
" let s:purple = "A852D0"
" let s:lightPurple = "B97AD7"
" let s:red = "AE403F"
" let s:beige = "F5C06F"
" let s:yellow = "F09F17"
" let s:orange = "D4843E"
" let s:darkOrange = "F16529"
" let s:pink = "CB6F6F"
" let s:salmon = "EE6E73"
" let s:green = "8FAA54"
" let s:lightGreen = "31B53E"
" let s:white = "FFFFFF"
" let s:rspec_red = 'FE405F'
" let s:git_orange = 'F54D27'

" let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
" let g:NERDTreeExtensionHighlightColor['yml'] = s:blue " sets the color of css files to blue
" let g:NERDTreeExtensionHighlightColor['tf'] = s:lightPurple " sets the color of css files to blue
" let g:NERDTreeExtensionHighlightColor['tfvars'] = s:lightPurple " sets the color of css files to blue
" let g:NERDTreeExtensionHighlightColor['md'] = s:salmon " sets the color of css files to blue
" }}}

" ALE {{{
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['flake8', 'pylint'],
\   'terraform': ['terraform']
\}

let g:ale_fixers = {
\   'python': ['autopep8', 'yapf'],
\   'terraform': ['terraform']
\}

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_fix_on_save = 1

let g:ale_sh_shellcheck_exclusions = 'SC2068,SC2086'
" }}}

" vim-go {{{
" Taken from https://github.com/fatih/vim-go-tutorial/blob/master/vimrc
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
let g:go_auto_type_info = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_textobj_include_function_doc = 0

au Filetype go nnoremap <leader>d :GoDef<CR>
au Filetype go nnoremap <leader>god :vsp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>gov :vsp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>gos :sp <CR>:exe "GoDef"<CR>

" Open :GoDeclsDir with ctrl-g
nmap <C-g> :GoDeclsDir<cr>
imap <C-g> <esc>:<C-u>GoDeclsDir<cr>

augroup go
	autocmd!
	" Show by default 4 spaces for a tab
	autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
	" :GoBuild and :GoTestCompile
	autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
	" :GoTest
	autocmd FileType go nmap <leader>t  <Plug>(go-test)
	" :GoRun
	autocmd FileType go nmap <leader>r  <Plug>(go-run)
	" :GoDoc
	autocmd FileType go nmap <Leader>D <Plug>(go-doc)
	" :GoInfo
	autocmd FileType go nmap <Leader>i <Plug>(go-info)
	" :GoMetaLinter
	autocmd FileType go nmap <Leader>m <Plug>(go-metalinter)
	" :GoDef but opens in a vertical split
	autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
	" :GoDef but opens in a horizontal split
	autocmd FileType go nmap <Leader>s <Plug>(go-def-split)
	" :GoAlternate  commands :A, :AV, :AS and :AT
	autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
	autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
	autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
	autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

" build_go_files is a custom function that builds or compiles the test file.
" It calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
function! s:build_go_files()
	let l:file = expand('%')
	if l:file =~# '^\f\+_test\.go$'
		call go#cmd#Test(0, 1)
	elseif l:file =~# '^\f\+\.go$'
		call go#cmd#Build(0)
	endif
endfunction
" }}}

" ctags {{{
" nnoremap <leader>f :ta<space>

" Auto open the TagBar when file is supported
autocmd FileType * nested :call tagbar#autoopen(0)

" Auto run ctags on file save
if !empty(glob(".ctags"))
	let g:auto_ctags = 1
endif

let g:tagbar_compact = 1

let g:tagbar_type_ansible = {
			\ 'ctagstype' : 'ansible',
			\ 'kinds' : [
			\ 't:tasks',
			\ 'h:hosts'
			\ ],
			\ 'sort' : 0
			\ }

let g:tagbar_type_terraform = {
			\ 'ctagstype' : 'terraform',
			\ 'kinds' : [
			\ 'r:resources',
			\ 'm:modules',
			\ 'o:outputs',
			\ 'v:variables',
			\ 'f:tfvars'
			\ ],
			\ 'sort' : 0
			\ }

let g:tagbar_type_make = {
			\ 'kinds':[
			\ 'm:macros',
			\ 't:targets'
			\ ]
			\}

let g:tagbar_type_sh = {
			\ 'kinds':[
			\ 'f:functions',
			\ 'c:constants'
			\ ]
			\}

let g:tagbar_type_markdown = {
			\ 'ctagstype' : 'markdown',
			\ 'kinds' : [
			\ 'h:Heading_L1',
			\ 'i:Heading_L2',
			\ 'k:Heading_L3'
			\ ]
			\ }
" }}}

" functions/commands {{{
" :Root
function! s:root()
	let root = systemlist('git rev-parse --show-toplevel')[0]
	if v:shell_error
		echo 'Not in git repo'
	else
		execute 'lcd' root
		echo 'Changed directory to: '.root
	endif
endfunction
command! Root call s:root()

" When using `dd` in the quickfix list, remove the item from the quickfix list.
" https://stackoverflow.com/questions/42905008/quickfix-list-how-to-add-and-remove-entries

function! RemoveQuickfixItem()
	let curqfidx = line('.') - 1
	let qfall = getqflist()
	call remove(qfall, curqfidx)
	call setqflist(qfall, 'r')
	execute curqfidx + 1 . "cfirst"
	:copen
endfunction

autocmd FileType qf map <buffer> dd :call RemoveQuickfixItem()<cr>

" e.g. :Tfdoc aws_instance
if executable('tfdoc')
	command! -nargs=* Tfdoc :call system('tfdoc' . ' ' . <q-args>)
endif

nnoremap <silent> <Leader>tfr :Tfdoc <C-R><C-W><CR>
nnoremap <silent> <Leader>tfd :Tfdoc -d <C-R><C-W><CR>
xnoremap <silent> <Leader>tfr y:Tfdoc <C-R>"<CR>
xnoremap <silent> <Leader>tfd y:Tfdoc -d <C-R>"<CR>
" }}}

" Source Files {{{
" Stuff I don't want up on github
if filereadable(glob("~/.vim/private"))
	source ~/.vim/private
endif

" Stuff I don't want up on github
if filereadable(glob(".vimrc.local"))
	source .vimrc.local
endif
" }}}
