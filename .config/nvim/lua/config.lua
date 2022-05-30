-- lualine
require('lualine').setup({
	options = {
		theme = vim.g.colorscheme_name,
	},
	extensions = {
		'quickfix',
		'nvim-tree',
	},
})

-- nvim-tree
require('nvim-tree').setup({
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = false,
	ignore_ft_on_setup = { 'minimap' },
	open_on_tab = false,
	hijack_cursor = false, -- hijack the cursor in the tree to put it at the start of the filename
	update_cwd = false, -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually

	actions = {
		open_file = {
			window_picker = {
				exclude = {
					filetype = {
						'diff',
						'fugitive',
						'fugitiveblame',
						'notify',
						'packer',
						'qf',
						'minimap',
					},
					buftype = {
						'terminal',
					}
				},
			},
		},
	},

	filters = {
		custom = {
			'.DS_Store',
			'.cache',
			'.git',
			'.idea',
			'.mypy_cache',
			'.pytest_cache',
			'.terraform.lock.hcl',
			'.terragrunt-cache',
			'.vagrant',
			'__pycache__',
			'node_modules',
		},
	},

	-- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
	update_focused_file = {
		enable = true,
		update_cwd = false,
		-- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
		-- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
		ignore_list = {},
	},

	-- configuration options for the system open command (`s` in the tree by default)
	system_open = {
		cmd = nil, -- the command to run this, leaving nil should work in most cases
		args = {}, -- the command arguments as a list
	},

	view = {
		width = 30, -- width of the window, can be either a number (columns) or a string in `%`
		side = 'left',
		mappings = {
			-- custom only false will merge the list with the default mappings
			-- if true, it will only use your list to set the mappings
			custom_only = false,
			-- list of mappings to set on the tree manually
			list = {},
		},
	},
})

-- treesitter
require('nvim-treesitter.configs').setup({
	ensure_installed = {
		'bash',
		'go',
		'gomod',
		'hcl',
		'html',
		'json',
		'lua',
		'make',
		'markdown',
		'python',
		'toml',
		'vim',
		'yaml',
	},
	highlight = {
		enable = true,
	},
	rainbow = {
		enable = false,
		extended_mode = true,
		-- palenight colours
		colors = {
			'#ffcb6b',
			'#f78c6c',
			'#82b1ff',
			'#ff5370',
			'#f78c6c',
			'#c3e88d',
			'#c792ea',
		},
	},
	textobjects = {
		select = {
			enable = true,

			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,

			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				['af'] = '@function.outer',
				['if'] = '@function.inner',
				['ac'] = '@class.outer',
				['ic'] = '@class.inner',
			},
		},
	},
})

-- telescope
local actions = require('telescope.actions')

require('telescope').setup({
	defaults = {
		prompt_prefix = '» ',
		mappings = {
			i = {
				['<esc>'] = actions.close,
			},
			n = {
				['<esc>'] = actions.close,
			},
		},
		layout_strategy = 'flex',
		scroll_strategy = 'cycle',
		winblend = 10,
		layout_config = {
			width = 0.6,
			height = 0.8,
		},
		file_ignore_patterns = { 'tags' },
		extensions = {
			fzf = {
				fuzzy = true,
				override_file_sorter = true,
			},
		},
	},
})

require('telescope').load_extension('fzf')

-- nvim-compe
require('compe').setup({
	enabled = true,
	autocomplete = true,
	debug = false,
	min_length = 1,
	preselect = 'enable',
	throttle_time = 80,
	source_timeout = 200,
	incomplete_delay = 400,
	max_abbr_width = 100,
	max_kind_width = 100,
	max_menu_width = 100,
	documentation = true,

	source = {
		buffer = true,
		calc = true,
		nvim_lsp = true,
		nvim_lua = true,
		path = true,
		spell = true,
		treesitter = true,
		ultisnips = true,
		vsnip = true,
	},
})

-- TODO: Move to lua config
vim.cmd([[
	inoremap <silent><expr> <C-Space> compe#complete()
	inoremap <silent><expr> <CR>			compe#confirm('<CR>')
	inoremap <silent><expr> <C-e>			compe#close('<C-e>')
	inoremap <silent><expr> <C-f>			compe#scroll({ 'delta': +4 })
	inoremap <silent><expr> <C-d>			compe#scroll({ 'delta': -4 })

	inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
	inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

	highlight link CompeDocumentation NormalFloat
]])

-- trim.nvim
require('trim').setup({
	disable = { 'markdown' },
})

-- nvim-autopairs
require('nvim-autopairs').setup()

-- zen-mode
require('zen-mode').setup({
	window = {
		width = 0.85, -- width will be 85% of the editor width
	},
})

-- twilight
require('twilight').setup({})

-- gitsigns
require('gitsigns').setup({
	keymaps = {},
	current_line_blame = false,
})

-- nvim-colorizer.lua
require('colorizer').setup()

-- todo-comments
require('todo-comments').setup()

-- which-key.nvim
require('which-key').setup()

-- trouble.nvim
require('trouble').setup({})

-- surround.nvim
require('surround').setup({})

-- nvim-web-devicons
require('nvim-web-devicons').setup({})

-- FTerm
require('FTerm').setup({})
