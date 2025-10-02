return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  { import = "nvchad.blink.lazyspec" },

  -- https://github.com/nvim-treesitter/nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
      { "nvim-treesitter/nvim-treesitter-textobjects" }, -- Syntax aware text-objects
    },
    opts = {
      ensure_installed = {
        "vim",
        "bash",
        "css",
        "csv",
        "dockerfile",
        "gitcommit",
        "gitignore",
        "go",
        "gomod",
        "gosum",
        "hcl",
        "helm",
        "html",
        "json",
        "just",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "python",
        "regex",
        "sql",
        "ssh_config",
        "terraform",
        "toml",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
      },
    },
  },

  -- https://github.com/folke/persistence.nvim
  {
    "folke/persistence.nvim",
    lazy = false,
    event = "VimEnter",
    opts = {
      dir = vim.fn.stdpath "data" .. "/sessions/",
    },
  },

  -- https://github.com/szw/vim-maximizer
  {
    "szw/vim-maximizer",
    event = "VeryLazy",
  },

  -- https://github.com/jiaoshijie/undotree
  {
    "jiaoshijie/undotree",
    opts = {
      window = {
        winblend = 5,
      },
    },
    keys = { -- load the plugin only when using it's keybinding:
      { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
    },
  },

  -- https://github.com/kylechui/nvim-surround
  {
    "kylechui/nvim-surround",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    event = "VeryLazy",
    version = "*",
    config = function()
      require("nvim-surround").setup()
    end,
  },

  -- https://github.com/pearofducks/ansible-vim
  {
    "pearofducks/ansible-vim",
    ft = { "yaml.ansible", "ansible" },
  },

  -- https://github.com/wfxr/minimap.vim
  {
    "wfxr/minimap.vim",
    event = "VeryLazy",
  },

  { "towolf/vim-helm" }, -- https://github.com/towolf/vim-helm
  { "wellle/targets.vim" }, -- https://github.com/wellle/targets.vim

  -- https://github.com/lewis6991/fileline.nvim
  {
    "lewis6991/fileline.nvim",
    lazy = false,
  },

  -- https://github.com/DanilaMihailov/beacon.nvim
  {
    "danilamihailov/beacon.nvim",
    event = "VeryLazy",
  },

  -- https://github.com/nvim-pack/nvim-spectre
  {
    "nvim-pack/nvim-spectre",
    event = "VeryLazy",
  },

  -- https://github.com/nickeb96/fish.vim
  { "nickeb96/fish.vim" },

  -- https://github.com/jvgrootveld/telescope-zoxide
  {
    "jvgrootveld/telescope-zoxide",
    event = "VeryLazy",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension "zoxide"
    end,
  },

  -- https://github.com/ojroques/nvim-bufdel
  {
    "ojroques/nvim-bufdel",
    event = "VeryLazy",
    config = function()
      require("bufdel").setup {
        next = "tabs",
        quit = false, -- do not quit neovim when last buffer is closed
      }
    end,
  },

  -- https://github.com/fedepujol/move.nvim
  {
    "fedepujol/move.nvim",
    event = "VeryLazy",
    config = function()
      require("move").setup()
    end,
  },

  -- https://github.com/nacro90/numb.nvim
  {
    "nacro90/numb.nvim",
    event = "BufRead",
    config = function()
      require("numb").setup()
    end,
  },

  -- https://github.com/ycdzj/win-mover.nvim
  {
    "ycdzj/win-mover.nvim",
    event = "VeryLazy",
    config = function()
      local win_mover = require "win-mover"
      win_mover.setup {
        ignore = {
          enable = true,
          filetypes = { "minimap", "neo-tree", "toggleterm" },
        },
        move_mode = {
          keymap = {
            h = win_mover.ops.move_left,
            j = win_mover.ops.move_down,
            k = win_mover.ops.move_up,
            l = win_mover.ops.move_right,
            H = win_mover.ops.move_far_left,
            J = win_mover.ops.move_far_down,
            K = win_mover.ops.move_far_up,
            L = win_mover.ops.move_far_right,
            q = win_mover.ops.quit,
            ["<Esc>"] = win_mover.ops.quit,
          },
        },
      }
    end,
  },

  -- https://github.com/luukvbaal/statuscol.nvim
  {
    "luukvbaal/statuscol.nvim",
    event = "VeryLazy",
    config = function()
      local builtin = require "statuscol.builtin"
      require("statuscol").setup {
        segments = {
          { text = { "%s" }, click = "v:lua.ScSa" },
          { text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
          {
            text = { " ", builtin.foldfunc, " " },
            condition = { builtin.not_empty, true, builtin.not_empty },
            click = "v:lua.ScFa",
          },
        },
      }
    end,
  },

  -- https://github.com/zbirenbaum/copilot.lua
  {
    "zbirenbaum/copilot.lua",
    event = "VeryLazy",
    config = function()
      require("copilot").setup {
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
        copilot_node_command = "/opt/homebrew/bin/node",
        server_opts_overrides = {},
      }
    end,
  },
}
