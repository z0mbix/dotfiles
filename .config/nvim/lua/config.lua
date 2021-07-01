-- lualine
require('lualine').setup{
	options = {
		theme = vim.g.colorscheme_name,
	},
	extensions = { 'quickfix', 'nvim-tree' }
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
			"latex",
			"rust",
			"zig",
		}
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		-- palenight colours
		colors = {
			"#ffcb6b",
			"#f78c6c",
			"#82b1ff",
			"#ff5370",
			"#f78c6c",
			"#c3e88d",
			"#c792ea",
		}
	},
}

-- telescope
local actions = require('telescope.actions')

require('telescope').setup {
	defaults = {
		prompt_prefix = "» ",
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
		layout_config = {
			width = 0.6,
			height = 0.8,
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

-- TrueZen
require('true-zen').setup({
	modes = {
		ataraxis = {
			left_padding = 5,
			right_padding = 5,
			top_padding = 5,
			bottom_padding = 5,
		},
	}
})

-- gitsigns
require('gitsigns').setup {
	keymaps = {},
	current_line_blame = false,
}

-- nvim-colorizer.lua
require'colorizer'.setup()
