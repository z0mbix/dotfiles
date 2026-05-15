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

  -- https://github.com/mason-org/mason-lspconfig.nvim
  -- bridges mason.nvim (bundled by NvChad) with lspconfig; auto-installs the listed servers
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    event = "User FilePost",
    opts = {
      -- keep this list in sync with lua/configs/lspconfig.lua
      ensure_installed = {
        "bashls",
        "cssls",
        "gopls",
        "html",
        "lua_ls",
        "pyright",
        "terraformls",
      },
      -- enabling is handled manually in lua/configs/lspconfig.lua via vim.lsp.enable
      automatic_enable = false,
    },
  },

  { import = "nvchad.blink.lazyspec" },

  -- https://github.com/nvim-treesitter/nvim-treesitter
  -- treesitter configurations and abstraction layer (main branch — new API)
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    dependencies = {
      -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
      -- syntax aware text-objects (also on main branch)
      { "nvim-treesitter/nvim-treesitter-textobjects", branch = "main" },
    },
    config = function()
      local parsers = {
        "bash",
        "css",
        "csv",
        "dockerfile",
        "gitcommit",
        "gitignore",
        "go",
        "gomod",
        "gosum",
        "gotmpl",
        "hcl",
        "helm",
        "hocon",
        "html",
        "jinja",
        "json",
        "just",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "nginx",
        "python",
        "regex",
        "sql",
        "ssh_config",
        "tera",
        "terraform",
        "toml",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
      }

      require("nvim-treesitter").install(parsers)

      -- enable highlight + treesitter-based indent on FileType
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("nvim_treesitter_start", { clear = true }),
        callback = function(args)
          local buf = args.buf
          local lang = vim.treesitter.language.get_lang(vim.bo[buf].filetype)
          if lang and pcall(vim.treesitter.language.add, lang) then
            pcall(vim.treesitter.start, buf, lang)
            vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },

  -- https://github.com/folke/persistence.nvim
  -- a session manager
  {
    "folke/persistence.nvim",
    -- lazy = false,
    event = "VimEnter",
    opts = {
      dir = vim.fn.stdpath "data" .. "/sessions/",
    },
  },

  -- https://github.com/szw/vim-maximizer
  -- maximizes and restores current window
  {
    "szw/vim-maximizer",
    event = "VeryLazy",
  },

  -- https://github.com/kylechui/nvim-surround
  -- add, delete, change surroundings (parens, brackets, quotes, tags, custom)
  {
    "kylechui/nvim-surround",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    event = "VeryLazy",
    opts = {},
  },

  -- https://github.com/wfxr/minimap.vim
  -- code minimap sidebar (install code-minimap separately)
  {
    "wfxr/minimap.vim",
    event = "VeryLazy",
  },

  -- https://github.com/wellle/targets.vim
  -- adds various text objects to give you more targets to operate on
  {
    "wellle/targets.vim",
    event = "VeryLazy",
  },

  -- https://github.com/lewis6991/fileline.nvim
  -- allows opening files at specific line command line, e.g. nvim ~/.ssh/known_hosts:21`
  {
    "lewis6991/fileline.nvim",
    lazy = false,
  },

  -- https://github.com/DanilaMihailov/beacon.nvim
  -- highlights the cursor line after large movements
  {
    "danilamihailov/beacon.nvim",
    event = "VeryLazy",
  },

  -- https://github.com/MagicDuck/grug-far.nvim
  -- search and replace across files
  {
    "MagicDuck/grug-far.nvim",
    cmd = { "GrugFar", "GrugFarWithin" },
  },

  -- https://github.com/jvgrootveld/telescope-zoxide
  -- telescope extension for zoxide
  {
    "jvgrootveld/telescope-zoxide",
    event = "VeryLazy",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension "zoxide"
    end,
  },

  -- https://github.com/debugloop/telescope-undo.nvim
  -- telescope extension for visualizing and restoring undo history
  {
    "debugloop/telescope-undo.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      local telescope = require "telescope"
      -- merge undo extension opts into the existing telescope config without clobbering it
      telescope.setup(vim.tbl_deep_extend("force", telescope.config or {}, {
        extensions = {
          undo = {
            vim_diff_opts = { ctxlen = vim.o.scrolloff },
            entry_format = "#$ID, $STAT, $TIME",
          },
        },
      }))
      telescope.load_extension "undo"
    end,
  },

  -- https://github.com/ojroques/nvim-bufdel
  -- delete buffers without closing your windows
  {
    "ojroques/nvim-bufdel",
    event = "VeryLazy",
    opts = {
      next = "tabs",
      quit = false, -- do not quit neovim when last buffer is closed
    },
  },

  -- https://github.com/fedepujol/move.nvim
  -- move lines and blocks of code up and down
  {
    "fedepujol/move.nvim",
    event = "VeryLazy",
    -- config = function()
    --   require("move").setup()
    -- end,
    opts = {
      line = {
        enable = true, -- Enables line movement
        indent = true, -- Toggles indentation
      },
      block = {
        enable = true, -- Enables block movement
        indent = true, -- Toggles indentation
      },
      word = {
        enable = true, -- Enables word movement
      },
      char = {
        enable = true, -- Enables char movement
      },
    },
  },

  -- https://github.com/nacro90/numb.nvim
  -- peeks lines of a file in command mode when typing line numbers
  {
    "nacro90/numb.nvim",
    event = "BufRead",
    config = function()
      require("numb").setup()
    end,
  },

  -- https://github.com/ycdzj/win-mover.nvim
  -- easily move and resize windows
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
  -- highly customizable status column
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

  -- https://github.com/lukas-reineke/virt-column.nvim
  -- customise the appearance of the column character
  {
    "lukas-reineke/virt-column.nvim",
    event = "VeryLazy",
    opts = {
      -- char = "┊",
      char = "┃",
      virtcolumn = "+1,120",
    },
  },

  -- https://github.com/mcauley-penney/visual-whitespace.nvim
  -- shows all whitespaces when in visual mode
  {
    "mcauley-penney/visual-whitespace.nvim",
    config = true,
    event = "ModeChanged *:[vV\22]", -- lazy load on entering visual mode
    opts = {
      ignore = {
        filetypes = { "TelescopePrompt", "NvimTree", "neo-tree", "Trouble", "help" },
        buftypes = {},
        list_chars = {
          space = "·",
          tab = "› ",
          nbsp = "␣",
          lead = "‹",
          trail = "›",
        },
      },
    },
  },

  -- https://github.com/zbirenbaum/copilot.lua
  -- GitHub Copilot
  {
    "zbirenbaum/copilot.lua",
    event = "VeryLazy",
    config = function()
      require("copilot").setup {
        copilot_node_command = vim.fn.exepath "node",
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
            -- accept = "<M-l>",
            accept = "<Tab>",
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
      }
    end,
  },

  -- https://github.com/olimorris/codecompanion.nvim
  -- AI code generation and chat within Neovim
  {
    "olimorris/codecompanion.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      strategies = {
        chat = {
          adapter = "copilot",
          model = "claude-sonnet-4-6",
          -- model = "gpt-4.1",
        },
        inline = {
          adapter = "copilot",
          model = "claude-sonnet-4-6",
        },
        cmd = {
          adapter = "copilot",
          model = "claude-sonnet-4-6",
        },
      },
      display = {
        action_palette = {
          provider = "telescope",
        },
      },
    },
  },

  -- https://github.com/folke/todo-comments.nvim
  -- highlight, list and search todo comments like TODO, HACK, BUG in your projects
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}, -- required but can be left empty
  },

  -- https://github.com/mateuszwieloch/automkdir.nvim
  -- automatically create missing directories when saving files
  {
    "mateuszwieloch/automkdir.nvim",
    event = { "BufWritePre", "BufNewFile" },
    opts = {},
  },

  -- https://github.com/f-person/git-blame.nvim
  -- git blame inline comments at the end of lines
  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    opts = {
      enabled = false,
      schedule_event = "CursorHold",
    },
  },

  -- https://github.com/NeogitOrg/neogit
  -- a Magit clone for Neovim that provides an easy-to-use Git interface
  {
    "NeogitOrg/neogit",
    cmd = "Neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional
      "nvim-telescope/telescope.nvim", -- optional
    },
  },

  -- https://github.com/mrjones2014/smart-splits.nvim
  -- intelligently resize and navigate splits
  {
    "mrjones2014/smart-splits.nvim",
    event = "VeryLazy",
    opts = {
      ignored_filetypes = { "NvimTree", "neo-tree", "toggleterm", "minimap" },
      ignored_buftypes = { "nofile", "prompt", "quickfix" },
    },
  },

  -- https://github.com/chrisgrieser/nvim-various-textobjs
  -- a collection of various text objects including `ii` for indentation level
  {
    "chrisgrieser/nvim-various-textobjs",
    event = "VeryLazy",
    opts = {
      keymaps = {
        useDefaults = true,
      },
    },
  },

  -- https://github.com/cappyzawa/trim.nvim
  -- automatically trim trailing whitespace on save
  {
    "cappyzawa/trim.nvim",
    event = "BufWritePre",
    opts = {},
  },
}
