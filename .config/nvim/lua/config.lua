-- lualine
require("lualine").setup({
  options = {
    theme = vim.g.colorscheme_name,
  },
  extensions = {
    "neo-tree",
    "quickfix",
  },
})

-- akinsho/bufferline.nvim
require("bufferline").setup({
  options = {
    separator_style = "slant",
    hover = {
      enabled = true,
      delay = 100,
      reveal = { "close" },
    },
  },
})

-- ojroques/nvim-bufdel
require("bufdel").setup({
  next = "tabs",
  quit = false, -- do not quit neovim when last buffer is closed
})

require("neo-tree").setup({
  close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
  popup_border_style = "rounded",
  enable_git_status = true,
  enable_diagnostics = true,

  event_handlers = {
    {
      event = "neo_tree_window_after_open",
      handler = function(args)
        if args.position == "left" or args.position == "right" then
          vim.cmd("wincmd =")
        end
      end,
    },
    {
      event = "neo_tree_window_after_close",
      handler = function(args)
        if args.position == "left" or args.position == "right" then
          vim.cmd("wincmd =")
        end
      end,
    },
  },

  window = {
    mappings = {
      ["e"] = function()
        vim.api.nvim_exec("Neotree focus filesystem left", true)
      end,
      ["b"] = function()
        vim.api.nvim_exec("Neotree focus buffers left", true)
      end,
      ["g"] = function()
        vim.api.nvim_exec("Neotree focus git_status left", true)
      end,
    },
    width = 30,
  },

  filesystem = {
    use_libuv_file_watcher = true,
    filtered_items = {
      visible = false, -- when true, they will just be displayed differently than normal items
      hide_dotfiles = true,
      hide_gitignored = true,
      hide_by_name = {
        ".DS_Store",
        ".cache",
        ".git",
        ".idea",
        ".mypy_cache",
        ".pytest_cache",
        ".terraform.lock.hcl",
        ".terragrunt-cache",
        ".vagrant",
        "__pycache__",
        "node_modules",
      },
    },

    follow_current_file = {
      enabled = true,
      leave_dirs_open = false,
    },
  },
})

-- treesitter
require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash",
    "go",
    "gomod",
    "hcl",
    "html",
    "json",
    "lua",
    "make",
    "markdown",
    "python",
    "toml",
    "vim",
    "yaml",
  },
  highlight = {
    enable = true,
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
    },
  },
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },
})

-- telescope
local actions = require("telescope.actions")

require("telescope").setup({
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
    layout_strategy = "flex",
    scroll_strategy = "cycle",
    winblend = 10,
    layout_config = {
      width = 0.6,
      height = 0.8,
    },
    file_ignore_patterns = { "tags" },
    extensions = {
      fzf = {
        fuzzy = true,
        override_file_sorter = true,
      },
    },
  },
})

require("telescope").load_extension("fzf")

-- nvim-compe
require("compe").setup({
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 1,
  preselect = "enable",
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
require("trim").setup({
  ft_blocklist = { "markdown" },
})

-- nvim-autopairs
require("nvim-autopairs").setup()

-- zen-mode
require("zen-mode").setup({
  window = {
    width = 0.85, -- width will be 85% of the editor width
  },
})

-- twilight
require("twilight").setup({})

-- gitsigns
require("gitsigns").setup({
  keymaps = {},
  current_line_blame = false,
})

-- nvim-colorizer.lua
require("colorizer").setup()

-- todo-comments
require("todo-comments").setup()

-- which-key.nvim
require("which-key").setup()

-- trouble.nvim
require("trouble").setup({})

-- surround.nvim
require("surround").setup({})

-- nvim-web-devicons
require("nvim-web-devicons").setup({})

-- FTerm
require("FTerm").setup({})

-- https://github.com/m-demare/hlargs.nvim
require("hlargs").setup()

-- https://github.com/chentoast/marks.nvim
require("marks").setup()

-- https://github.com/williamboman/mason.nvim
require("mason").setup()

-- TODO: Required neovim >= 0.10
-- https://github.com/Bekaboo/dropbar.nvim
-- require("Bekaboo/dropbar.nvim").setup()

-- https://github.com/zbirenbaum/copilot.lua
require("copilot").setup({
  panel = {
    enabled = true,
    auto_refresh = false,
    keymap = {
      jump_prev = "[[",
      jump_next = "]]",
      accept = "<CR>",
      refresh = "gr",
      open = "<M-CR>",
    },
    layout = {
      position = "bottom",
      ratio = 0.4,
    },
  },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    debounce = 75,
    keymap = {
      accept = "<M-l>",
      accept_word = false,
      accept_line = false,
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
    },
  },
  filetypes = {
    yaml = true,
    markdown = true,
    help = false,
    ["."] = false,
  },
  copilot_node_command = "node", -- Node.js version must be > 16.x
  server_opts_overrides = {},
})
