-- https://github.com/loctvl842/monokai-pro.nvim
require("monokai-pro").setup()

-- https://github.com/nvim-lualine/lualine.nvim
require("lualine").setup({
  options = {
    theme = vim.g.colorscheme.name,
  },
  extensions = {
    "neo-tree",
    "quickfix",
  },
})

-- https://github.com/akinsho/bufferline.nvim
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

-- https://github.com/ojroques/nvim-bufdel
require("bufdel").setup({
  next = "tabs",
  quit = false, -- do not quit neovim when last buffer is closed
})

-- https://github.com/nvim-neo-tree/neo-tree.nvim
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
        vim.api.nvim_exec("Neotree focus filesystem", true)
      end,
      ["b"] = function()
        vim.api.nvim_exec("Neotree focus buffers", true)
      end,
      ["g"] = function()
        vim.api.nvim_exec("Neotree focus git_status", true)
      end,
    },
    position = "right",
    width = 30,
    mapping_options = {
      noremap = true,
      nowait = true,
    },
  },

  git_status = {
    window = {
      position = "right",
      mappings = {
        ["A"] = "git_add_all",
        ["gu"] = "git_unstage_file",
        ["ga"] = "git_add_file",
        ["gr"] = "git_revert_file",
        ["gc"] = "git_commit",
        ["gp"] = "git_push",
        ["gg"] = "git_commit_and_push",
      },
    },
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

-- https://github.com/nvim-treesitter/nvim-treesitter
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

-- https://github.com/nvim-telescope/telescope.nvim
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
      undo = {},
    },
  },
})
require("telescope").load_extension("fzf")
require("telescope").load_extension("undo")

-- https://github.com/hrsh7th/nvim-cmp
local cmp = require("cmp")
cmp.setup({
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
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

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
  inoremap <silent><expr> <CR>      compe#confirm('<CR>')
  inoremap <silent><expr> <C-e>     compe#close('<C-e>')
  inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
  inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

  inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  highlight link CompeDocumentation NormalFloat
]])

-- https://github.com/cappyzawa/trim.nvim
require("trim").setup({
  ft_blocklist = { "markdown" },
})

-- https://github.com/windwp/nvim-autopairs
require("nvim-autopairs").setup()

-- https://github.com/folke/zen-mode.nvim
require("zen-mode").setup({
  window = {
    width = 0.85, -- width will be 85% of the editor width
  },
})

-- https://github.com/folke/twilight.nvim
require("twilight").setup({})

-- https://github.com/lewis6991/gitsigns.nvim
require("gitsigns").setup({
  current_line_blame = false,
})

-- https://github.com/norcalli/nvim-colorizer.lua
require("colorizer").setup()

-- https://github.com/folke/todo-comments.nvim
require("todo-comments").setup()

-- https://github.com/folke/which-key.nvim
require("which-key").setup()

-- https://github.com/folke/trouble.nvim
require("trouble").setup({})

-- https://github.com/ur4ltz/surround.nvim
require("surround").setup({})

-- https://github.com/nvim-tree/nvim-web-devicons
require("nvim-web-devicons").setup({})

-- https://github.com/numToStr/FTerm.nvim
require("FTerm").setup({})

-- https://github.com/m-demare/hlargs.nvim
require("hlargs").setup()

-- https://github.com/chentoast/marks.nvim
require("marks").setup()

-- https://github.com/williamboman/mason.nvim
require("mason").setup()

-- https://github.com/ellisonleao/glow.nvim
require("glow").setup()

-- https://github.com/jose-elias-alvarez/null-ls.nvim
local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.shfmt,
    null_ls.builtins.formatting.yamlfmt,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.completion.spell,
  },
})

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
      position = "bottom", -- | top | left | right
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

-- https://github.com/filipdutescu/renamer.nvim
require("renamer").setup()

-- https://github.com/axieax/urlview.nvim
require("urlview").setup({
  default_action = "system",
  default_picker = "telescope",
  log_level_min = vim.log.levels.OFF,
})
