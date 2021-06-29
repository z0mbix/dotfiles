local g = vim.g

-- disable stuff I don't care about
g.loaded_ruby_provider     = 1
g.loaded_perl_provider     = 1
g.loaded_python_provider   = 1
g.loaded_gzip              = 1
g.loaded_tar               = 1
g.loaded_tarPlugin         = 1
g.loaded_zip               = 1
g.loaded_zipPlugin         = 1
g.loaded_getscript         = 1
g.loaded_getscriptPlugin   = 1
g.loaded_vimball           = 1
g.loaded_vimballPlugin     = 1
g.loaded_2html_plugin      = 1
g.loaded_logiPat           = 1
g.loaded_rrhelper          = 1
g.loaded_netrw             = 1
g.loaded_netrwPlugin       = 1
g.loaded_netrwSettings     = 1
g.loaded_netrwFileHandlers = 1

-- set formatoptions to override all the shit plugins do to it
g.mysyntaxfile = '~/.config/nvim/after/ftplugin/all.vim'

-- python provider for neovim
-- g.python3_host_prog='~/.venvs/neovim3/bin/python'

-- colours
g.colorscheme_name = 'palenight'
g.nvcode_termcolors = 256

-- submode
g.submode_timeout = 0
g.submode_timeoutlen = 2
g.submode_keep_leaving_key = 1

--	terraform
g.terraform_fmt_on_save = 1

 -- markdown Language highlighting
g.markdown_fenced_languages = {
	'go',
	'html',
	'java',
	'javascript',
	'json',
	'python',
	'ruby',
	'rust',
	'typescript',
	'vim',
	'yaml'
}

-- ALE
g.ale_linters = {
	javascript = { 'eslint' },
	python = { 'pylint', 'flake8' },
	sh = { 'shellcheck' },
	terraform = { 'terraform' },
}

g.ale_fixers = {
	go = { 'goimports' },
	javascript = { 'prettier', 'eslint' },
	python = { 'autopep8' },
	sh = { 'shfmt' },
	terraform = { 'terraform' },
	typescript = { 'eslint', 'tslint', 'tsserver' },
	vue = { 'prettier', 'eslint' },
}

g.ale_fix_on_save = 1
g.ale_sign_error = '✗'
g.ale_sign_warning = '⚡'
g.ale_echo_msg_error_str = '✗'
g.ale_echo_msg_warning_str = '⚡'
g.ale_echo_msg_format = '[%linter%] %s [%severity%]'
g.ale_sign_highlight_linenrs = 1
g.ale_sh_shellcheck_exclusions = 'SC2068,SC2086'
g.ale_sh_shellcheck_dialect = 'bash'
g.ale_sh_shfmt_options = '-i 2 -ci'
g.ale_python_autopep8_options = '--max-line-length=160'

-- json
g.json_syntax_conceal = 0

-- goyo
g.goyo_height = '80%'
g.goyo_width = '80%'

-- nvim-tree
g.nvim_tree_highlight_opened_files = 1
g.nvim_tree_auto_close = 1
g.nvim_tree_auto_ignore_ft = { 'minimap' }
g.nvim_tree_follow = 1

g.nvim_tree_show_icons = {
  git = 0,
  folders = 1,
  files = 1,
  folder_arrows = 1,
}

g.nvim_tree_window_picker_exclude = {
	filetype = {
		'minimap',
		'packer',
		'qf',
	},
	buftype = {
		'terminal',
	}
}

g.nvim_tree_ignore = {
	'.DS_Store',
	'.cache',
	'.git',
	'.idea',
	'.mypy_cache',
	'.vagrant',
	'__pycache__',
	'node_modules',
}

-- git.blame.nvim
g.gitblame_enabled = 0

-- minimap.vim
g.minimap_auto_start = 0
g.minimap_width = 20
g.minimap_highlight_range = true
g.minimap_block_filetypes = { 'help', 'NvimTree' }
