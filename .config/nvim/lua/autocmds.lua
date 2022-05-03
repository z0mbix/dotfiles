vim.cmd([[
	" remember where I am in the file
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

	" toggle number/relativenumber
	augroup numbertoggle
		autocmd!
		autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
		autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
	augroup END

	" when writing new files, mkdir -p their paths
	augroup AutoCreateDir
		au!
		au BufWritePre * if expand("<afile>")!~#'^\w\+:/' && !isdirectory(expand("%:h")) | execute "silent! !mkdir -p ".shellescape(expand('%:h'), 1) | redraw! | endif
	augroup END

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

	" JavaScript
	autocmd BufNewFile,BufRead *.js set ft=javascript
	autocmd FileType javascript set ts=2 sw=2 tw=120 et sts=2 smartindent

	" Typescript
	autocmd BufNewFile,BufRead *.ts set ft=typescript
	autocmd FileType typescript set ts=2 sw=2 tw=120 et sts=2 smartindent

	" JSON
	autocmd BufNewFile,BufRead *.json,*.json.j2 set ft=json
	autocmd FileType json set ts=2 sw=2 et sts=2 smartindent

	" YAML
	autocmd BufNewFile,BufRead *.yaml,*.yml.j2,*.yaml.j2,*.yml.j2 set ft=yaml
	autocmd FileType yaml set ts=2 sw=2 et sts=2 smartindent

	" The Jenkinsfile
	autocmd BufNewFile,BufRead *.Jenkinsfile set ft=jenkinsfile
	autocmd BufNewFile,BufRead Jenkinsfile set ft=jenkinsfile
	autocmd BufNewFile,BufRead Jenkinsfile* set ft=jenkinsfile

	" Puppet
	autocmd BufRead,BufNewFile *.pp set ft=puppet
	autocmd FileType puppet set ts=2 sw=2 tw=79 et sts=2 smartindent
	autocmd FileType puppet set commentstring=#\ %s

	" Yum repos
	autocmd BufRead,BufNewFile *.repo,*.repo.j2 set ft=yum

	" HCL
	autocmd BufNewFile,BufRead *.hcl set ft=hcl
	autocmd FileType hcl set ts=2 sw=2 et sts=2 smartindent

	" Makefiles and c have tabstops at 8 for portability
	autocmd FileType make,c,cpp set ts=8 sw=8

	" casey/just justfiles
	autocmd BufNewFile,BufRead justfile setf make

	" Clear whitespace at the end of lines automatically
	autocmd BufWritePre * :%s/\s\+$//e

	" Automatically reload vim config when it's saved
	augroup lua
		autocmd!
		autocmd BufWritePost lua/*.lua,init.lua source $MYVIMRC
	augroup end

	" Resize splits when the window is resized
	autocmd VimResized * :wincmd =

	" vim-after-object - e.g. ca= / da= etc.
	" autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')

	" git re-uses the same filename all the time, so ignore viminfo
	autocmd BufNewFile,BufRead *.git/* call setpos('.', [0, 1, 1, 0])

	" disable auto comment new line
	autocmd FileType * set fo-=c fo-=r fo-=o fo+=j
]])
