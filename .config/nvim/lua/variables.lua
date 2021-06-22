-- colours
vim.g.nvcode_termcolors = 256

--	vim-shfmt
vim.g.shfmt_fmt_on_save = 1 -- Auto run shfmt on save
vim.g.shfmt_extra_args = '-i 2 -ci' -- Always use two space indentation for shell scripts

-- vim-submode
vim.g.submode_timeout = 0
vim.g.submode_timeoutlen = 2
vim.g.submode_keep_leaving_key = 1
-- vim.g.submode_keyseqs_to_leave = {'Esc'}

--	terraform
vim.g.terraform_fmt_on_save = 1

 -- markdown Language highlighting
vim.g.markdown_fenced_languages = {
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
vim.g.ale_linters = {
	javascript = {'eslint'},
	terraform = {'terraform'},
	python = {'flake8', 'pylint'},
	sh = {'shellcheck'},
}

vim.g.ale_fixers = {
	javascript = {'prettier', 'eslint'},
	python = {'autopep8', 'yapf'},
	terraform = {'terraform'},
	typescript = {'eslint', 'tslint', 'tsserver'},
	vue = {'prettier', 'eslint'},
}

vim.g.ale_sign_error = '✗'
vim.g.ale_sign_warning = '⚡'
vim.g.ale_echo_msg_error_str = 'E'
vim.g.ale_echo_msg_warning_str = 'W'
vim.g.ale_echo_msg_format = '[%linter%] %s [%severity%]'
vim.g.ale_sign_highlight_linenrs = 1
vim.g.ale_fix_on_save = 1
vim.g.ale_sh_shellcheck_exclusions = 'SC2068,SC2086'
vim.g.ale_sh_shellcheck_dialect = 'bash'

-- vim-json
vim.g.vim_json_syntax_conceal = 0

-- autopep8
vim.g.autopep8_disable_show_diff = 1
vim.g.autopep8_max_line_length = 160
vim.g.autopep8_on_save = 1

-- goyo
vim.g.goyo_height = '80%'
vim.g.goyo_width = '80%'

-- nvim-tree
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_auto_close = 1 -- 0 by default, closes the tree when it's the last window
vim.g.nvim_tree_ignore = { '.git', 'node_modules', '.cache', '__pycache__', '.idea', '.vagrant' }
vim.g.nvim_tree_special_files = { 'init.lua' }
