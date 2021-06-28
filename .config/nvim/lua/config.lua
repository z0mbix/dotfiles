-- lualine
require('lualine').setup{
	options = {
		theme = vim.g.colorscheme_name,
		-- disabled_filetypes = {'NvimTree', 'minimap'}
	},
	extensions = {'quickfix', 'nvim-tree'}
}

-- treesitter
require('nvim-treesitter.configs').setup {
	ensure_installed = "maintained",
	highlight = {
		enable = true,
		disable = {
			"beancount",
			"c",
			"c_sharp",
			"clojure",
			"commonlisp",
			"cpp",
			"dart",
			"elixir",
			"erlang",
			"haskell",
			"java",
			"kotlin",
			"rust",
			"zig",
		}
	},
}

-- telescope
local actions = require('telescope.actions')

require('telescope').setup {
	defaults = {
		prompt_prefix = "» ",
		prompt_position = "top",
		mappings = {
			i = {
				["<esc>"] = actions.close,
			},
			n = {
				["<esc>"] = actions.close,
			},
		},
		layout_strategy = 'flex',
		scroll_strategy = 'cycle',
		winblend = 10,
		width = 0.5,
		results_height = 0.5,
		layout_defaults = {
			horizontal = {
				width_padding = 0.1,
				height_padding = 0.1,
				preview_width = 0.6,
			},
			vertical = {
				width_padding = 0.05,
				height_padding = 1,
				preview_height = 0.5,
			}
		},
		file_ignore_patterns = { 'tags' },
		extensions = {
			fzf = {
				fuzzy = true,
				override_file_sorter = true,
			}
		}
	}
}

require('telescope').load_extension('fzf')

-- nvim-compe
require('compe').setup {
	enabled = true;
	autocomplete = true;
	debug = false;
	min_length = 1;
	preselect = 'enable';
	throttle_time = 80;
	source_timeout = 200;
	incomplete_delay = 400;
	max_abbr_width = 100;
	max_kind_width = 100;
	max_menu_width = 100;
	documentation = true;

	source = {
		path = true;
		buffer = true;
		calc = true;
		nvim_lsp = true;
		nvim_lua = true;
		vsnip = true;
		ultisnips = true;
	};
}

vim.cmd[[
	inoremap <silent><expr> <C-Space> compe#complete()
	inoremap <silent><expr> <CR>			compe#confirm('<CR>')
	inoremap <silent><expr> <C-e>			compe#close('<C-e>')
	inoremap <silent><expr> <C-f>			compe#scroll({ 'delta': +4 })
	inoremap <silent><expr> <C-d>			compe#scroll({ 'delta': -4 })

	inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
	inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

	highlight link CompeDocumentation NormalFloat
]]

-- trim.nvim
require('trim').setup {
	disable = {"markdown"},
}

-- nvim-autopairs
require('nvim-autopairs').setup()

-- zen-mode
require("zen-mode").setup {
	window = {
		backdrop = 0.70,
		height = 0.95,
		width = 0.95,
	}
}

-- gitsigns
require('gitsigns').setup {
	keymaps = {},
	current_line_blame = false,
}
