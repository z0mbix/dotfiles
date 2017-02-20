scriptencoding utf-8
set encoding=utf-8                                       " default to utf-8
set statusline=%<%f%h%m%r%w%y%=%l/%L,%c\ %P\ \|\ %n      " dope statusline
set shortmess=atOI                                       " disable start-up message
set number                                               " show line numbers
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
set ttymouse=xterm2                                      " terminal type for mouse codes
set ttyscroll=3                                          " speedup scrolling
set pastetoggle=<F8>                                     " toggle pasting
set clipboard=unnamed,unnamedplus                        " use system clipboard "
set spellfile=~/.vimspell.add"                           " my words
set confirm                                              " ask to save files
set t_Co=256                                             " use all 256 colors
set viminfo='100,f1                                      " save up to 100 marks, enable capital marks
set listchars=tab:›\ ,eol:¬,trail:·,extends:❯,precedes:❮ " set the characters for the invisibles
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
set cursorline                                           " Highlight the current line
set mouse=a                                              " enable mouse support
set nojoinspaces                                         " remove extra space when joining lines
set wildmenu                                             " Tab completion
set wildmode=list:longest,full                           " Wildcard matches show a list, matching the longest first
set wildignore+=.git,.hg,.svn                            " Ignore version control repos
set wildignore+=*.6                                      " Ignore Go compiled files
set wildignore+=.hg,.git,.svn                            " Version control
set wildignore+=*.aux,*.out,*.toc                        " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg           " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest         " compiled object files
set wildignore+=*.spl                                    " compiled spelling word lists
set wildignore+=*.sw?                                    " Vim swap files
set wildignore+=*.DS_Store                               " OSX bullshit
set wildignore+=*.luac                                   " Lua byte code
set wildignore+=migrations                               " Django migrations
set wildignore+=*.pyc                                    " Python byte code

let mapleader=","                                        " The <leader> key

filetype off                                             " required for vundle

if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Language plugins
Plug 'ekalinin/Dockerfile.vim', {'for' : 'Dockerfile'}
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'empanda/vim-varnish', { 'for': 'varnish' }
Plug 'evanmiller/nginx-vim-syntax', {'for': 'nginx' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'fatih/vim-nginx' , {'for' : 'nginx'}
Plug 'groenewege/vim-less'
Plug 'hashivim/vim-packer'
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
Plug 'pearofducks/ansible-vim'
Plug 'tell-k/vim-autopep8', { 'for': 'python' }
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'z0mbix/vim-terraform-snippets'
" Plug 'phenomenes/ansible-snippets'

" Other plugins
Plug 'AndrewRadev/splitjoin.vim'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'Lokaltog/vim-easymotion'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Townk/vim-autoclose'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'amiorin/vim-project'
Plug 'bling/vim-airline'
Plug 'bling/vim-bufferline'
Plug 'chriskempson/base16-vim'
Plug 'christophermca/meta5'
Plug 'danro/rename.vim'
Plug 'dougireton/vim-chef'
Plug 'duff/vim-bufonly'
Plug 'dyng/ctrlsf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'enricobacis/vim-airline-clock'
Plug 'flazz/vim-colorschemes'
Plug 'garbas/vim-snipmate'
Plug 'gosukiwi/vim-atom-dark'
Plug 'henrik/vim-reveal-in-finder'
Plug 'honza/vim-snippets'
Plug 'jdkanani/vim-material-theme'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/vim-after-object'
Plug 'junegunn/fzf'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-peekaboo'
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-startify'
Plug 'michaeljsmith/vim-indent-object'
Plug 'mileszs/ack.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'rbgrouleff/bclose.vim'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'soramugi/auto-ctags.vim'
Plug 'terryma/vim-expand-region'
Plug 'terryma/vim-multiple-cursors'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'wincent/ferret'

call plug#end()

" Set colour after vim-colorschemes
set background=dark
let g:rehash256 = 1
if (has("termguicolors"))
	set termguicolors
endif
color onedark
syntax on

set t_ut=

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Hack\ 9
  elseif has("gui_win32")
    set guifont=Hack\ 9
  elseif has("gui_macvim")
    " set guifont=Hack:h12
    set guifont=Sauce\ Code\ Powerline:h12
    " set fullscreen
  elseif has("gui_vimr")
    " set guifont=Hack:h12
    set guifont=Sauce\ Code\ Powerline:h12
    " set fullscreen
  endif
endif

set guioptions=
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

" Prefer # comments for terraform
au FileType terraform setlocal commentstring=#\ %s

" PHP
au BufNewFile,BufRead *.php set ft=php
au FileType php set ts=4 sw=4 tw=79 et sts=4 smartindent
let php_sql_query=1
let php_htmlInStrings=1

" Perl
let perl_extended_vars=1

" Python
au BufNewFile,BufRead .py set ft=python
au FileType python set ts=4 sw=4 tw=79 et sts=4 smartindent
au FileType python map <buffer> <F7> :call Autopep8()<CR>
let g:autopep8_disable_show_diff=1

" JavaScript
au BufNewFile,BufRead *.js set ft=javascript
au FileType javascript set ts=2 sw=2 tw=79 et sts=2 smartindent

" JSON
let g:vim_json_syntax_conceal = 0

" The Jenkinsfile
au BufNewFile,BufRead Jenkinsfile set ft=groovy

" nginx
au BufRead,BufNewFile */etc/nginx/* set ft=nginx ts=4 sw=4 sts=4 et smartindent
autocmd FileType nginx set commentstring=#\ %s

" Resize splits when the window is resized
au VimResized * :wincmd =

" vim-after-object - e.g. ca= / da= etc.
autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')

" Abbreviations
inoreabbrev teh the
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q

" ansible-vim
let g:ansible_extra_keywords_highlight = 1
let g:ansible_attribute_highlight = "ob"

" simple separators for buffer list
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#syntastic#enabled = 1

" Stop bufferline from echoing to command bar (vim-bufferline)
let g:bufferline_echo = 0

" " Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" " Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" " Use smartcase.
let g:neocomplete#enable_smart_case = 1
" " Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
" " Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  " return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/plugged/vim-snippets/snippets'
let g:neosnippet#snippets_directory='~/.vim/plugged/vim-terraform-snippets'

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB>
  \ pumvisible() ? "\<C-n>" :
  \ neosnippet#expandable_or_jumpable() ?
  \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
	\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
	set conceallevel=2 concealcursor=niv
endif

" CtrlSF
let g:ctrlsf_ignore_dir = ['tags', 'npm_modules']

nmap <C-F>s <Plug>CtrlSFCwordExec
vmap <C-F>s <Plug>CtrlSFVwordExec
nmap <C-F>S <Plug>CtrlSFPrompt

" ferret - find word under cursor
nmap <leader>f <Plug>(FerretAckWord)
nmap <leader>F <Plug>(FerretLack)

" Atom style Comments
nmap <D-/> gcc
vmap <D-/> gc
nmap <C-/> gcc
vmap <C-/> gc

" Re-idents entire file
nnoremap <F7> mzgg=G`z

" Switch buffers
nnoremap <C-Tab> :bn<CR>
nnoremap <C-S-Tab> :bp<CR>

" Switch buffers in non-gui
nnoremap <Tab>e :bn<CR>
nnoremap <S-Tab>e :bp<CR>

" Bclose
nnoremap <leader>x :Bclose<CR>
nnoremap <leader>X :Bclose!<CR>

" vim-expand-region
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

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap <leader>a <Plug>(EasyAlign)

" Fugitive
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Gblame<CR>

" Indent Guides
" let g:indent_guides_enable_on_vim_startup = 1

" Puppet
au BufRead,BufNewFile *.pp set ft=puppet
au FileType puppet set ts=2 sw=2 tw=79 et sts=2 smartindent
autocmd FileType puppet set commentstring=#\ %s

" Yum repos
au BufRead,BufNewFile *.repo set ft=yum

" source code gets wrapped at <80
au FileType asm,javascript,php,html,perl,c,cpp set tw=79 autoindent

" makefiles and c have tabstops at 8 for portability
au FileType make,c,cpp set ts=8 sw=8

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal! g'\"" |
\ endif

" Clear whitespace at the end of lines automatically
autocmd BufWritePre * :%s/\s\+$//e

" automatically reload vimrc when it's saved
autocmd BufWritePost .vimrc source $HOME/.vimrc

" Startify
" Make Startify work with NERDTree
" autocmd VimEnter *
" 	\   if !argc()
" 	\ |   Startify
" 	\ |   NERDTree
" 	\ |   wincmd w
" 	\ | endif

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

let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "58A4D7"
let s:darkBlue = "2980B9"
let s:purple = "A852D0"
let s:lightPurple = "B97AD7"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['yml'] = s:blue " sets the color of css files to blue
let g:NERDTreeExtensionHighlightColor['tf'] = s:lightPurple " sets the color of css files to blue
let g:NERDTreeExtensionHighlightColor['tfvars'] = s:lightPurple " sets the color of css files to blue
let g:NERDTreeExtensionHighlightColor['md'] = s:salmon " sets the color of css files to blue

" YouCompleteMe
" let g:ycm_auto_trigger = 1

" vim-go
" au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
" au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>
" au Filetype go nnoremap <leader>t :tab split <CR>:exe "GoDef"<CR>
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_textobj_include_function_doc = 0

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

let g:syntastic_eruby_ruby_quiet_messages =
	\ {'regex': 'possibly useless use of a variable in void context'}

" Exclude some annoying shellcheck checks
let g:syntastic_sh_shellcheck_args='--exclude=SC2086
	\ --exclude=SC2068'

" let g:syntastic_yaml_checkers = ['js-yaml']
" let g:syntastic_terraform_checkers = ['terraform validate']
" let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = '✖︎'
let g:terraform_fmt_on_save = 1

" vim-go
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

" Open :GoDeclsDir with ctrl-g
nmap <C-g> :GoDeclsDir<cr>
imap <C-g> <esc>:<C-u>GoDeclsDir<cr>

" vim-go
" Taken from https://github.com/fatih/vim-go-tutorial/blob/master/vimrc
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
	autocmd FileType go nmap <Leader>d <Plug>(go-doc)
	" :GoCoverageToggle
	autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
	" :GoInfo
	autocmd FileType go nmap <Leader>i <Plug>(go-info)
	" :GoMetaLinter
	autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)
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
endif

" Remove annoying F1 help
inoremap <F1> <nop>
nnoremap <F1> <nop>
vnoremap <F1> <nop>

nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>s <C-w>s<C-w>l

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
nmap <leader>n :NERDTreeToggle<CR>
nmap § :NERDTreeToggle<CR> " Macs
nmap ` :NERDTreeToggle<CR> " Non-Macs

" Remove ^M from file
map <leader>M :%s/^M//<CR>

" Bubble single lines
" nmap <C-k> [e
" nmap <C-j> ]e

" Bubble multiple lines
vmap <C-k> [egv
vmap <C-j> ]egv

" Open PWD in finder
" nnoremap <leader>F :silent !open .<cr>

" select all
map <leader>a ggVG

" Shortcut to yanking to the system clipboard
map <leader>y "*y
map <leader>p "*p

" Clear search highlighting
noremap <silent><leader>/ :nohlsearch<cr>

" Easy window resizing
nnoremap <Tab><Left> :vertical resize +5<CR>
nnoremap <Tab><Right> :vertical resize -5<CR>
nnoremap <Tab><Down> :res +5<CR>
nnoremap <Tab><Up> :res -5<CR>

" CtrlP
nnoremap <silent> <leader>o :CtrlP<CR>
nnoremap <silent> <leader>t :CtrlPTag<cr>
nnoremap <silent> <leader>b :CtrlPBuffer<cr>
nnoremap <silent> <leader>l :CtrlPLine<cr>
nnoremap <silent> <leader>m :CtrlPMRUFiles<CR>
nnoremap <silent> <leader>B :TagbarToggle<CR>
nnoremap <silent> ; :CtrlPBuffer<CR>

" Hop to start/end of line
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za
"
" Command to write as root if we don't have permission
cmap w!! %!sudo tee > /dev/null %

" ctags/tagbar
" nnoremap <leader>f :ta<space>

" Auto open the TagBar when file is supported
" autocmd FileType * nested :call tagbar#autoopen(0)

" Auto run ctags on file save
" let g:auto_ctags = 1

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
