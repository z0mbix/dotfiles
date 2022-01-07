" vim:foldmethod=marker:foldlevel=0
" Settings {{{

scriptencoding utf-8
set encoding=utf-8										" default to utf-8
set statusline=%<%f%h%m%r%w%y%=%l/%L,%c\ %P\ \|\ %n		" dope statusline
set exrc												" source .vimrc files
set shortmess=atOIc										" disable start-up message
set number												" show line numbers
set relativenumber										" show relative line numbers
set ruler												" show line and column no
set hidden												" hidden buffers?
set showcmd												" show command in last line
set nocompatible										" not compatible with vi
set ignorecase											" ignore case when searching
set incsearch											" search while typing
set backspace=indent,eol,start							" super backspacing
set smartcase											" smart searching
set tabstop=4											" default tabs to 4 spaces
set shiftwidth=4										" match default tab spacing
set hlsearch											" highlight search results
set autoindent											" auto indent new lines
set linebreak											" enable linebreaks
set showbreak=>>										" what to put infront of linebreaks
set breakindent											" preserve horizontal blocks
set formatoptions+=j									" remove comments when joining lines
set nostartofline										" keep cursor in same column
set history=200											" set command and search history
set noerrorbells										" don't annoy me
set novisualbell										" disable visual bell
set report=0											" always report lines changed
set showmatch											" show matching brackets
set foldenable											" enable folding
set foldmethod=indent									" fold lines with equal indent
set foldlevel=20										" set fold close level
set laststatus=2										" always show status line
set ttyfast												" fast terminal conn for faster redraw
set pastetoggle=<F8>									" toggle pasting
set clipboard=unnamed,unnamedplus						" use system clipboard "
set spellfile=~/.vimspell.add							" my words
set confirm												" ask to save files
set viminfo='100,f1										" save up to 100 marks, enable capital marks
set list												" Show invisible characters
set listchars=tab:›\ ,eol:¬,trail:·,extends:❯,precedes:❮,nbsp:_ " set the characters for the invisibles
set splitbelow											" splits show up below by default
set splitright											" splits go to the right by default
set scrolloff=4											" start scrolling when we're 4 lines away from margins
set sidescrolloff=15									" start scrolling when we're 15 lines away from margins
set sidescroll=1										" enable side scrolling
set scrolljump=8										" minimum lines to scroll at end of screen
set nrformats=											" treat numbers as decimal instead of octal
set noswapfile											" we live in the future
set showtabline=1										" only show the tabline when more than one tab open
set autoread											" detect files changed outside of vim
set noshowmode											" don't show the default vim mode line
set modeline											" don't show mode line
set lazyredraw											" Redraw only when required
set mouse=a												" enable mouse support
set nojoinspaces										" remove extra space when joining lines
set cmdheight=1											" Better display for messages
set updatetime=200										" Required for coc
set signcolumn=number									" Show signcolumn in number column
set completeopt=menuone,noselect						" For nvim-compe
set wildmenu											" Tab completion
set wildmode=longest,full								" Wildcard matches show a list, matching the longest first
set wildignore+=.git,.hg,.svn							" Ignore version control repos
set wildignore+=*.6										" Ignore Go compiled files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg			" binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest		" compiled object files
set wildignore+=*.spl									" compiled spelling word lists
set wildignore+=*.sw?									" Vim swap files
set wildignore+=*.DS_Store								" OSX bullshit
set wildignore+=*.luac									" Lua byte code
set wildignore+=*.pyc									" Python byte code

if exists('veonim')
	set guifont=Fira\ Code:h12
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
set title
set titlestring=vim:\ %-25.55F\ %a%r%m titlelen=70
set titlelen=70
if &term == "screen"
	set t_ts=k
	set t_fs=\
endif

hi NonText cterm=NONE ctermfg=NONE

let mapleader=" "
" }}}

" Plugins {{{

" Auto install vim-plug
let s:plug_dir = '~/.vim/plugged'
let s:plug_file = '~/.vim/autoload/plug.vim'

if empty(glob(s:plug_file))
	if executable('curl')
		silent execute '!curl -fLo ' . s:plug_file . ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
		autocmd VimEnter * PlugInstall | source $MYVIMRC
	endif
endif

call plug#begin(s:plug_dir)

" Language plugins
Plug 'ekalinin/Dockerfile.vim', { 'for' : 'Dockerfile' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'fatih/vim-nginx', { 'for': 'nginx' }
Plug 'hashivim/vim-packer', { 'for': 'json' }
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
Plug 'juliosueiras/vim-terraform-completion', { 'for': 'terraform' }
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'martinda/Jenkinsfile-vim-syntax', { 'for': 'jenkinsfile' }
Plug 'ngmy/vim-rubocop', { 'for': 'ruby' }
Plug 'pearofducks/ansible-vim', { 'for': 'ansible' }
Plug 'sheerun/vim-polyglot'
Plug 'tell-k/vim-autopep8', { 'for': 'python' }
Plug 'z0mbix/vim-shfmt', { 'for': 'sh' }

" Colours
Plug 'arcticicestudio/nord-vim'
Plug 'kaicataldo/material.vim'

" Other plugins
Plug 'AndrewRadev/sideways.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'FooSoft/vim-argwrap'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'RRethy/vim-illuminate'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-bufferline'
Plug 'bogado/file-line'
Plug 'danro/rename.vim'
Plug 'doums/coBra'
Plug 'duff/vim-bufonly'
Plug 'enricobacis/vim-airline-clock'
Plug 'ggandor/lightspeed.nvim'
Plug 'honza/vim-snippets'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/vim-after-object'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-peekaboo'
Plug 'kana/vim-submode'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'mg979/vim-visual-multi'
Plug 'michaeljsmith/vim-indent-object'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'pechorin/any-jump.vim'
Plug 'psliwka/vim-smoothie'
Plug 'rbgrouleff/bclose.vim'
Plug 'rbong/vim-flog'
Plug 'rhysd/clever-f.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'sodapopcan/vim-twiggy'
Plug 'terryma/vim-expand-region'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tonchis/vim-to-github'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'unblevable/quick-scope'
Plug 'valloric/listtoggle'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'wellle/targets.vim'
Plug 'dense-analysis/ale'
Plug 'kdheepak/lazygit.nvim'

" conditional plugins
if has('python') || has('python3')
	Plug 'SirVer/ultisnips'
	Plug 'honza/vim-snippets'
endif

if v:version >= 800
	Plug 'machakann/vim-highlightedyank'
endif

" if executable('node')
" 	Plug 'neoclide/coc.nvim', {'branch': 'release'}
" endif

if has("mac")
	Plug 'rizzatti/dash.vim'
	Plug 'henrik/vim-reveal-in-finder'
	Plug 'ryanoasis/vim-devicons'
endif

call plug#end()
" }}}

" Colours/Theme {{{

" Set colour after vim-colorschemes
set background=dark
let g:rehash256 = 1
if (has("termguicolors"))
	set termguicolors
endif

color material
let g:material_theme_style = 'palenight'

syntax on

set t_ut= " disable background color erase
set fillchars+=vert:│ " set split window character
" set fillchars+=eob:\  " remove end of buffer tilde
hi VertSplit ctermbg=none guibg=none
" }}}

" Auto Commands {{{

" when writing new files, mkdir -p their paths
augroup AutoCreateDir
	au!
	au BufWritePre * if expand("<afile>")!~#'^\w\+:/' && !isdirectory(expand("%:h")) | execute "silent! !mkdir -p ".shellescape(expand('%:h'), 1) | redraw! | endif
augroup END

" Highlight line if in insert mode
autocmd InsertEnter * set cursorline
autocmd InsertLeave * set nocursorline

" git commit messages
autocmd FileType gitcommit set textwidth=72
autocmd FileType gitcommit set colorcolumn=73

" Shell files
autocmd BufNewFile,BufRead *.rc,*.sh,.envrc,~/.sh/* set ft=sh
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
autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc
let g:autopep8_disable_show_diff = 1
let g:autopep8_max_line_length = 160
let g:autopep8_on_save = 1

" JavaScript
autocmd BufNewFile,BufRead *.js set ft=javascript
autocmd FileType javascript set ts=2 sw=2 tw=120 et sts=2 smartindent

" Typescript
autocmd BufNewFile,BufRead *.ts set ft=typescript
autocmd FileType typescript set ts=2 sw=2 tw=120 et sts=2 smartindent

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

" HCL
autocmd BufNewFile,BufRead *.hcl set ft=hcl
autocmd FileType hcl set ts=2 sw=2 et sts=2 smartindent

" Source code gets wrapped at <80
autocmd FileType asm,javascript,php,html,perl,c,cpp set tw=79 autoindent

" Makefiles and c have tabstops at 8 for portability
autocmd FileType make,c,cpp set ts=8 sw=8

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
	\ if line("'\"") > 0 && line ("'\"") <= line("$") |
	\	exe "normal! g'\"" |
	\ endif

" Clear whitespace at the end of lines automatically
autocmd BufWritePre * :%s/\s\+$//e

" Automatically reload vim config when it's saved
augroup vimrc
	autocmd!
	autocmd BufWritePost .vimrc,init.vim source $MYVIMRC
augroup end

" Resize splits when the window is resized
autocmd VimResized * :wincmd =

" vim-after-object - e.g. ca= / da= etc.
autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')

" Toggle relativenumber in insert mode
augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
	autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

" git re-uses the same filename all the time, so ignore viminfo
autocmd BufNewFile,BufRead *.git/* call setpos('.', [0, 1, 1, 0])
" }}}

" Abbreviations {{{

inoreabbrev teh the
inoreabbrev chnage change
inoreabbrev zzo zombie@zombix.org
inoreabbrev gte get
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q ccl<cr>
" }}}

" Variables {{{

" vim-airline
let g:airline_theme = 'material'
let g:airline#extensions#lsp#enabled = 1

" floaterm
let g:floaterm_keymap_toggle = '<leader>tt'
let g:floaterm_position = 'center'
let g:floaterm_winblend = '0'

" Disable <cr> for auto-pairs due to conflicts with autocomplete plugins
let g:AutoPairsMapCR = 0

" vim-shfmt
let g:shfmt_fmt_on_save = 1 " Auto run shfmt on save
let g:shfmt_extra_args = '-i 2 -ci' " Always use two space indentation for shell scripts

" jedi
let g:deoplete#sources#jedi#show_docstring = 1

" vim-devicons
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_airline_tabline = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:WebDevIconsOS = 'Darwin'

" vim-gitgutter
let g:gitgutter_map_keys = 0
nmap ghd <Plug>(GitGutterPreviewHunk)
nmap ghs <Plug>(GitGutterPreviewHunk)
nmap ghn <Plug>(GitGutterNextHunk)
nmap ghp <Plug>(GitGutterPrevHunk)
nmap ghu <Plug>(GitGutterUndoHunk)

" UltiSnips
let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"
let g:UltiSnipsExpandTrigger = "<nop>" " setting to <tab> conflicts with coc
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" ansible-vim
let g:ansible_extra_keywords_highlight = 1
let g:ansible_attribute_highlight = "ob"
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" ansible-snippets
let g:neosnippet#snippets_directory='~/.vim/plugged/ansible-snippets/snippets'

" clever-f
let g:clever_f_timeout_ms = 2000
let g:clever_f_mark_char = 1
let g:clever_f_mark_char_color = "Number"

map ; <Plug>(clever-f-repeat-forward)
map , <Plug>(clever-f-repeat-back)

" Stop bufferline from echoing to command bar (vim-bufferline)
let g:bufferline_echo = 0

" terraform
let g:terraform_fmt_on_save=1

" markdown Language highlighting
let g:markdown_fenced_languages = ['go', 'html', 'java', 'javascript', 'json', 'python', 'ruby', 'rust', 'typescript', 'vim', 'yaml']
" }}}

" Mappings {{{

" Toggle between most recent files
nnoremap <leader>; <C-^>

" I almost never want to go to the first column
nnoremap 0 ^

" Write when the buffer has been modified
nnoremap <leader>w :update<CR>

" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>ef :e <C-R>=expand("%:p:h") . "/" <CR>

" Work with the config file
" Open the config file in a split fi a buffer is already open
function! s:OpenVimrc()
	if (0==strlen(bufname('%'))) && (1==line('$')) && (0==strlen(getline('$')))
		exe "e $MYVIMRC"
	else
		exe "vsp $MYVIMRC"
	endif
endfunction

" noremap <Leader>ec :vsp $MYVIMRC<CR>
noremap <Leader>ec :call <sid>OpenVimrc()<cr>
noremap <Leader>sc :source $MYVIMRC<CR>

" Auto open the TagBar when file is supported
autocmd FileType go call tagbar#autoopen(0)

nmap <leader>tb :TagbarToggle<CR>

nnoremap <leader>A :silent ArgWrap<CR>

" Hit that file with a hammer
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" move a character to the beginning or end of the line
nnoremap mH :let @z=@"<cr>x0P:let @"=@z<cr>
nnoremap mL :let @z=@"<cr>x$p:let @"=@z<cr>

" move a character to the beginning or end of the word
nnoremap mh :let @z=@"<cr>xBP:let @"=@z<cr>
nnoremap ml :let @z=@"<cr>xep:let @"=@z<cr>

" Closing/saving
nmap <leader>q :q<CR>
nmap <leader>w :update<CR>

" Dash
" nmap <silent> <leader>dl <Plug>DashSearch
" vmap <silent> <leader>dl <Plug>DashSearch

" Close quickfix
" nmap <leader>c :cclose<CR>

" Copy file path to clipboard
" if has("mac")
" 	nnoremap <silent> <leader>cfp :let @*=expand("%:p:h")<CR>
" 	nnoremap <silent> <leader>cfP :let @+=expand("%:p")<CR>
" 	nnoremap <silent> <leader>cfn :let @*=expand("%:t")<CR>
" 	nnoremap <silent> <leader>cfN :let @*=expand("%")<CR>
" endif

" if has("unix")
" 	nnoremap <silent> <leader>cfp :let @+=expand("%:p:h")<CR>
" 	nnoremap <silent> <leader>cfP :let @*=expand("%:p")<CR>
" 	nnoremap <silent> <leader>cfn :let @+=expand("%:t")<CR>
" 	nnoremap <silent> <leader>cfN :let @+=expand("%")<CR>
" endif

" Undotree
nmap <leader>u :UndotreeToggle<CR>

" splitjoin
let g:splitjoin_split_mapping = ''
let g:splitjoin_join_mapping = ''
nnoremap gss :SplitJoinSplit<CR>
nnoremap gsj :SplitJoinJoin<CR>

nmap	 <leader>gs :Gstatus<CR>gg<c-n>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Gblame<CR>

" Search for words
nnoremap <silent> <leader>fi /<C-R><C-W><CR>
nnoremap <silent> <leader>fw :Rg <C-R><C-W><CR>
nnoremap <silent> <leader>fW :Rg <C-R><C-A><CR>
xnoremap <silent> <leader>fw y:Rg <C-R>"<CR>

" Insert lines above/below
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>

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

" Select entire line
nnoremap <leader>v V

" listtoggle
let g:lt_location_list_toggle_map = '<leader>L'
let g:lt_quickfix_list_toggle_map = '<leader>Q'

" Switch buffers - vim-submode
let g:submode_timeout = 0
let g:submode_timeoutlen = 2
let g:submode_keep_leaving_key = 1
let g:submode_keyseqs_to_leave = ['Esc', 'Space']
call submode#enter_with('bnext/bprev', 'n', '', '<leader>l', ':bn<CR>')
call submode#enter_with('bnext/bprev', 'n', '', '<leader>h', ':bp<CR>')
call submode#map('bnext/bprev', 'n', '', 'l', ':bn<CR>')
call submode#map('bnext/bprev', 'n', '', 'h', ':bp<CR>')

" Split the current line at the cursor position and paste above
" the current line
nnoremap K DO<C-r>"<ESC>_

" :)
map q: :q

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L $
vnoremap L g_

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. <leader>aip)
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

if has('gui_macvim')
	" Switch OSX windows with swipes
	nnoremap <silent> <SwipeLeft> :macaction _cycleWindowsBackwards:<CR>
	nnoremap <silent> <SwipeRight> :macaction _cycleWindows:<CR>

	" Indentation key mappings for Cmd+[ and Cmd+]
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
nnoremap <leader>r :registers<cr>

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

" Resize windows easily
nnoremap <C-Left> :vertical resize +3
nnoremap <C-Right> :vertical resize -3
nnoremap <C-Up> :resize +3
nnoremap <C-Down> :resize +3

" Easily fix = & : alignments
nmap <leader>T= :Tabularize /=<CR>
vmap <leader>T= :Tabularize /=<CR>
nmap <leader>T: :Tabularize /:\zs<CR>
vmap <leader>T: :Tabularize /:\zs<CR>

" Show/Hide invisible characters
nmap <leader>' :set list!<CR>

" Remove ^M from file
map <leader>M :%s/^M//<CR>

" Bubble multiple lines
vmap <C-K> [egv
vmap <C-J> ]egv
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nmap <A-k> ddkP
nmap <A-j> ddp
nmap <A-Up> ddkP
nmap <A-Down> ddp

" Show current file in finder
nnoremap <leader>F :silent :Reveal<cr>

" select all
map <leader>a ggVG

" Shortcut to yanking to the system clipboard
" map <leader>y "*y
" map <leader>p "*p

" Delete without cutting
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" Project search
" nnoremap <leader>psw :CocSearch <C-R>=expand("<cword>")<CR><CR>

" Clear search highlighting
noremap <silent><leader>/ :nohlsearch<cr>

" Easy window resizing
nnoremap <Tab><Left> :vertical resize +5<CR>
nnoremap <Tab><Right> :vertical resize -5<CR>
nnoremap <Tab><Down> :res +5<CR>
nnoremap <Tab><Up> :res -5<CR>

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

" Fix split window ratios
noremap <leader>we <C-w>=

" Convert json to pretty printed version
nnoremap <leader>ppj !%jq .<CR>

nnoremap <leader>gg :LazyGit<CR>
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

" NERDTree {{{

" NERDTree mappings
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap § :NERDTreeToggle<CR> " Macs
nnoremap ` :NERDTreeToggle<CR> " Non-Macs

" Check if NERDTree is open or active
function! s:isNERDTreeOpen()
	return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
	if s:isNERDTreeOpen()
		if winnr("$") == 1
			q
		endif
	endif
endfunction

" Quit NERDTree when last file closed
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Easy NERDTree resizing
augroup ps_nerdtree
	au!
	au Filetype nerdtree setlocal nolist
	au Filetype nerdtree nnoremap <buffer> H :vertical resize -5<cr>
	au Filetype nerdtree nnoremap <buffer> L :vertical resize +5<cr>
augroup END

let NERDTreeHighlightCursorline = 1
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

" }}}

" ALE {{{

let g:ale_linters = {
\	'javascript': ['eslint'],
\	'python': ['flake8', 'pylint'],
\	'sh': ['shellcheck'],
\	'terraform': ['terraform']
\}

let g:ale_fixers = {
\	'javascript': ['prettier', 'eslint'],
\	'typescript': ['eslint', 'tslint', 'tsserver'],
\	'vue': ['prettier', 'eslint'],
\	'python': ['autopep8', 'yapf'],
\	'terraform': ['terraform']
\}

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_highlight_linenrs = 1
let g:ale_fix_on_save = 1

let g:ale_sh_shellcheck_exclusions = 'SC2068,SC2086'
let g:ale_sh_shellcheck_dialect = 'bash'

" }}}

" vim-go {{{

" Taken from https://github.com/fatih/vim-go-tutorial/blob/master/vimrc
" let g:go_fmt_command = "goimports"
" let g:go_fmt_command="gopls"
" let g:go_gopls_gofumpt=1
" let g:go_autodetect_gopath = 1
" let g:go_list_type = "quickfix"
" let g:go_auto_type_info = 1
" let g:go_highlight_types = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_functions = 1
" let g:go_highlight_methods = 1
" let g:go_highlight_extra_types = 1
" let g:go_highlight_generate_tags = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_build_constraints = 1
" let g:go_highlight_extra_types = 1
" let g:go_textobj_include_function_doc = 0
" let g:go_metalinter_autosave_enabled = ['vet', 'golint']
" let g:go_metalinter_enabled = ['vet', 'golint']

" }}}

" coc {{{

" let g:coc_global_extensions = [
" 	\ 'coc-css',
" 	\ 'coc-eslint',
" 	\ 'coc-git',
" 	\ 'coc-go',
" 	\ 'coc-html',
" 	\ 'coc-json',
" 	\ 'coc-pairs',
" 	\ 'coc-python',
" 	\ 'coc-sh',
" 	\ 'coc-snippets',
" 	\ 'coc-tsserver',
" 	\ 'coc-ultisnips',
" 	\ 'coc-vetur',
" \ ]

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" inoremap <silent><expr> <TAB>
" 	\ pumvisible() ? "\<C-n>" :
" 	\ <SID>check_back_space() ? "\<TAB>" :
" 	\ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
" 	let col = col('.') - 1
" 	return !col || getline('.')[col - 1]	=~# '\s'
" endfunction

" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() :
										\"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" function! s:check_back_space() abort
" 	let col = col('.') - 1
" 	return !col || getline('.')[col - 1]	=~# '\s'
" endfunction

" let g:coc_snippet_next = '<tab>'

" Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" " Use K to show documentation in preview window
" nnoremap <silent> K :call <SID>show_documentation()<CR>

" function! s:show_documentation()
"	if (index(['vim','help'], &filetype) >= 0)
"		execute 'h '.expand('<cword>')
"	else
"		call CocAction('doHover')
"	endif
" endfunction

" Highlight symbol under cursor on CursorHold
" if !&diff
" 	autocmd CursorHold * silent call CocActionAsync('highlight')
" endif

" Remap for rename current word
" nmap <F2> <Plug>(coc-rename)

" nmap <silent> <C-c> <Plug>(coc-cursors-position)

" nmap <expr> <silent> <C-d> <SID>select_current_word()
" function! s:select_current_word()
" 	if !get(g:, 'coc_cursors_activated', 0)
" 		return "\<Plug>(coc-cursors-word)"
" 	endif
" 	return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
" endfunc
" }}}

" goyo {{{

let g:goyo_height = '90%'
let g:goyo_width = '80%'

function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
	silent !tmux set status off
	silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
  " ...
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
	silent !tmux set status on
	silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
" }}}

" ctags {{{

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
		\ 'd:data',
		\ 'f:tfvars',
		\ 'm:modules',
		\ 'o:outputs',
		\ 'p:providers',
		\ 'r:resources',
		\ 'v:variables'
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

 let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'	  : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }
" }}}

" functions/commands {{{

" :Root - change to root directory of git repo
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

augroup QUICKFIX
	autocmd FileType qf map <buffer> dd :call RemoveQuickfixItem()<cr>
augroup END

" Trim trailing empty lines
function TrimEndLines()
	let save_cursor = getpos(".")
	:silent! %s#\($\n\s*\)\+\%$##
	call setpos('.', save_cursor)
endfunction

augroup TRIM
	au BufWritePre * call TrimEndLines()
augroup END

" e.g. :Tfdoc aws_instance
if executable('tfdoc')
	command! -nargs=* Tfdoc :call system('tfdoc' . ' ' . <q-args>)

	nnoremap <silent> <leader>tfr :Tfdoc <C-R><C-W><CR>
	nnoremap <silent> <leader>tfd :Tfdoc -d <C-R><C-W><CR>
	xnoremap <silent> <leader>tfr y:Tfdoc <C-R>"<CR>
	xnoremap <silent> <leader>tfd y:Tfdoc -d <C-R>"<CR>
endif

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
"
