local g = vim.g

-- set formatoptions to override all the shit plugins do to it
g.mysyntaxfile = '~/.config/nvim/after/ftplugin/all.vim'

-- colours
g.colorscheme_name = 'palenight'
g.nvcode_termcolors = 256

--	shfmt
g.shfmt_fmt_on_save = 1 -- Auto run shfmt on save
g.shfmt_extra_args = '-i 2 -ci' -- Always use two space indentation for shell scripts

-- submode
g.submode_timeout = 0
g.submode_timeoutlen = 2
g.submode_keep_leaving_key = 1
-- g.submode_keyseqs_to_leave = {'Esc'}

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
	javascript = {'eslint'},
	terraform = {'terraform'},
	python = {'flake8', 'pylint'},
	sh = {'shellcheck'},
}

g.ale_fixers = {
	javascript = {'prettier', 'eslint'},
	python = {'autopep8', 'yapf'},
	terraform = {'terraform'},
	typescript = {'eslint', 'tslint', 'tsserver'},
	vue = {'prettier', 'eslint'},
}

g.ale_sign_error = '✗'
g.ale_sign_warning = '⚡'
g.ale_echo_msg_error_str = 'E'
g.ale_echo_msg_warning_str = 'W'
g.ale_echo_msg_format = '[%linter%] %s [%severity%]'
g.ale_sign_highlight_linenrs = 1
g.ale_fix_on_save = 1
g.ale_sh_shellcheck_exclusions = 'SC2068,SC2086'
g.ale_sh_shellcheck_dialect = 'bash'

-- json
g.json_syntax_conceal = 0

-- autopep8
g.autopep8_disable_show_diff = 1
g.autopep8_max_line_length = 160
g.autopep8_on_save = 1

-- goyo
g.goyo_height = '80%'
g.goyo_width = '80%'

-- nvim-tree
g.nvim_tree_highlight_opened_files = 1
g.nvim_tree_auto_close = 1 -- 0 by default, closes the tree when it's the last window
g.nvim_tree_special_files = { 'init.lua' }
g.nvim_tree_show_icons = {
  git = 0,
  folders = 1,
  files = 1,
  folder_arrows = 1,
}

g.nvim_tree_ignore = {
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
