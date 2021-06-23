-- lualine
require('lualine').setup{
	options = {theme = vim.g.colorscheme_name},
	extensions = {'quickfix', 'nvim-tree'}
}

-- treesitter
require('nvim-treesitter.configs').setup {
	ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	highlight = {
		enable = true,
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
				-- mirror = false,
			},
			vertical = {
				width_padding = 0.05,
				height_padding = 1,
				preview_height = 0.5,
				-- mirror = true,
			}
		},
		file_ignore_patterns = { 'tags' },
		extensions = {
			fzf = {
				fuzzy = true,										 -- false will only do exact matching
				override_file_sorter = true,		 -- override the file sorter
				case_mode = "smart_case",				 -- or "ignore_case" or "respect_case"
			}
		}
	}
}

require('telescope').load_extension('fzf')

-- lsp
require('lspconfig').bashls.setup{}
require('lspconfig').terraformls.setup{}

require('lspconfig').pylsp.setup {
	on_attach = function(client)
		require 'illuminate'.on_attach(client)
	end,
}
require('lspconfig').gopls.setup {
	on_attach = function(client)
		require 'illuminate'.on_attach(client)
	end,
}

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

-- gitsigns
require('gitsigns').setup()

-- nvim-autopairs
require('nvim-autopairs').setup()
