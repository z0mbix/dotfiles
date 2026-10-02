return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require("configs.conform"),
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("configs.lspconfig")
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
      -- cue and rust_analyzer are deliberately omitted: they are managed outside neovim
      -- (the cue binary and mise respectively), and mason prepends its bin dir to PATH,
      -- which would shadow those versions
      ensure_installed = {
        "bashls",
        "cssls",
        "gopls",
        "html",
        "jsonls",
        "lua_ls",
        "pyright",
        "terraformls",
        "ts_ls",
        "yamlls",
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
    config = function()
      local parsers = {
        "bash",
        "css",
        "csv",
        "cue",
        "diff",
        "dockerfile",
        "fish",
        "git_rebase",
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
        "javascript",
        "jinja",
        "json",
        "just",
        "lua",
        "luadoc",
        "make",
        "markdown",
        "markdown_inline",
        "nginx",
        "printf",
        "python",
        "regex",
        "ruby",
        "rust",
        "sql",
        "ssh_config",
        "tera",
        "terraform",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
      }

      local treesitter = require("nvim-treesitter")
      local installed = {}
      for _, lang in ipairs(treesitter.get_installed("parsers")) do
        installed[lang] = true
      end
      local missing = vim.tbl_filter(function(lang)
        return not installed[lang]
      end, parsers)
      if #missing > 0 then
        treesitter.install(missing)
      end

      local max_filesize = 1024 * 1024
      local max_lines = 20000

      local function has_query(lang, name)
        local ok, query = pcall(vim.treesitter.query.get, lang, name)
        return ok and query ~= nil
      end

      -- enable highlight, treesitter-based indent and folds on FileType, skipping large files
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("nvim_treesitter_start", { clear = true }),
        callback = function(args)
          local buf = args.buf
          local lang = vim.treesitter.language.get_lang(vim.bo[buf].filetype)
          if not lang or not pcall(vim.treesitter.language.add, lang) then
            return
          end

          local stat = vim.uv.fs_stat(vim.api.nvim_buf_get_name(buf))
          if (stat and stat.size > max_filesize) or vim.api.nvim_buf_line_count(buf) > max_lines then
            return
          end

          if not pcall(vim.treesitter.start, buf, lang) then
            return
          end

          if has_query(lang, "indents") then
            vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end

          if has_query(lang, "folds") then
            for _, win in ipairs(vim.fn.win_findbuf(buf)) do
              vim.wo[win][0].foldmethod = "expr"
              vim.wo[win][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
            end
          end
        end,
      })
    end,
  },

  -- https://github.com/kylechui/nvim-surround
  -- add, delete, change surroundings (parens, brackets, quotes, tags, custom)
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {},
  },

  -- https://github.com/wfxr/minimap.vim
  -- code minimap sidebar (install code-minimap separately)
  {
    "wfxr/minimap.vim",
    cmd = { "Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight" },
  },

  -- https://github.com/lewis6991/fileline.nvim
  -- allows opening files at specific line command line, e.g. nvim ~/.ssh/known_hosts:21`
  {
    "lewis6991/fileline.nvim",
    lazy = false,
  },

  -- https://github.com/DanilaMihailov/beacon.nvim
  -- highlights the cursor line after large movements
  -- {
  --   "danilamihailov/beacon.nvim",
  --   event = "VeryLazy",
  -- },

  -- https://github.com/MagicDuck/grug-far.nvim
  -- search and replace across files
  {
    "MagicDuck/grug-far.nvim",
    cmd = { "GrugFar", "GrugFarWithin" },
  },

  -- https://github.com/nvim-telescope/telescope.nvim
  -- extends NvChad's telescope spec with the zoxide and undo extensions, loaded with telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      -- https://github.com/jvgrootveld/telescope-zoxide
      -- telescope extension for zoxide
      "jvgrootveld/telescope-zoxide",
      -- https://github.com/debugloop/telescope-undo.nvim
      -- telescope extension for visualizing and restoring undo history
      "debugloop/telescope-undo.nvim",
    },
    opts = function(_, opts)
      opts.extensions = vim.tbl_deep_extend("force", opts.extensions or {}, {
        undo = {
          vim_diff_opts = { ctxlen = vim.o.scrolloff },
          entry_format = "#$ID, $STAT, $TIME",
        },
      })
    end,
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("zoxide")
      telescope.load_extension("undo")
    end,
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
      local win_mover = require("win-mover")
      win_mover.setup({
        ignore = {
          enable = true,
          filetypes = { "minimap", "NvimTree" },
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
      })
    end,
  },

  -- https://github.com/luukvbaal/statuscol.nvim
  -- highly customizable status column
  {
    "luukvbaal/statuscol.nvim",
    lazy = false,
    config = function()
      local builtin = require("statuscol.builtin")
      require("statuscol").setup({
        segments = {
          { text = { "%s" },             click = "v:lua.ScSa" },
          { text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
          {
            text = { " ", builtin.foldfunc, " " },
            condition = { builtin.not_empty, true, builtin.not_empty },
            click = "v:lua.ScFa",
          },
        },
      })
    end,
  },

  -- https://github.com/lukas-reineke/virt-column.nvim
  -- customise the appearance of the column character
  {
    "lukas-reineke/virt-column.nvim",
    event = "User FilePost",
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
    event = "ModeChanged *:[vV\22]", -- lazy load on entering visual mode
    opts = {
      list_chars = {
        space = "·",
        tab = "› ",
        nbsp = "␣",
        lead = "‹",
        trail = "›",
      },
      ignore = {
        filetypes = { "TelescopePrompt", "NvimTree", "neo-tree", "Trouble", "help" },
        buftypes = {},
      },
    },
  },

  -- https://github.com/zbirenbaum/copilot.lua
  -- GitHub Copilot
  -- {
  --   "zbirenbaum/copilot.lua",
  --   event = "VeryLazy",
  --   -- Only load when Node.js is available, otherwise copilot.lua errors on
  --   -- startup with "Could not determine Node.js version". Also respect an
  --   -- explicit COPILOT_ENABLED=0/false opt-out.
  --   cond = function()
  --     local enabled = vim.env.COPILOT_ENABLED
  --     if enabled == "0" or enabled == "false" then
  --       return false
  --     end
  --     return vim.fn.executable "node" == 1
  --   end,
  --   config = function()
  --     require("copilot").setup {
  --       copilot_node_command = vim.fn.exepath "node",
  --       panel = {
  --         enabled = true,
  --         auto_refresh = false,
  --         keymap = {
  --           jump_prev = "[[",
  --           jump_next = "]]",
  --           accept = "<CR>",
  --           refresh = "gr",
  --           open = "<M-CR>",
  --         },
  --         layout = {
  --           position = "bottom", -- | top | left | right
  --           ratio = 0.4,
  --         },
  --       },
  --       suggestion = {
  --         enabled = true,
  --         auto_trigger = true,
  --         debounce = 75,
  --         keymap = {
  --           -- accept = "<M-l>",
  --           accept = "<Tab>",
  --           accept_word = false,
  --           accept_line = false,
  --           next = "<M-]>",
  --           prev = "<M-[>",
  --           dismiss = "<C-]>",
  --         },
  --       },
  --       filetypes = {
  --         yaml = true,
  --         markdown = true,
  --         help = false,
  --         ["."] = false,
  --       },
  --     }
  --   end,
  -- },

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

  -- https://github.com/NeogitOrg/neogit
  -- a Magit clone for Neovim that provides an easy-to-use Git interface
  {
    "NeogitOrg/neogit",
    cmd = "Neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional
      "nvim-telescope/telescope.nvim", -- optional
    },
  },

  -- https://github.com/smart-splits-nvim/smart-splits.nvim
  -- intelligently resize and navigate splits
  {
    "smart-splits-nvim/smart-splits.nvim",
    event = "VeryLazy",
    opts = {
      ignored_filetypes = { "NvimTree", "minimap" },
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
        -- `L` defaults to the `url` textobject, which shadows our `L` = end-of-line
        -- mapping in visual/operator-pending mode (mappings.lua).
        disabledDefaults = { "L" },
      },
    },
  },

  -- https://github.com/cappyzawa/trim.nvim
  -- automatically trim trailing whitespace on save
  {
    "cappyzawa/trim.nvim",
    event = "BufWritePre",
    opts = {
      ft_blocklist = { "markdown", "diff" },
    },
  },

  -- https://github.com/coffebar/neovim-project
  -- Neovim project manager plugin
  {
    "coffebar/neovim-project",
    opts = {
      last_session_on_startup = false,
      projects = {
        "~/Repos/*",
        "~/.config/nvim",
        "~/.local/share/chezmoi",
      },
      picker = {
        type = "telescope",
        opts = {
          attach_mappings = function(prompt_bufnr, map)
            if not vim.g.zvim then
              return true
            end

            local function open_in_zvim_window()
              local entry = require("telescope.actions.state").get_selected_entry()
              if not entry then
                return
              end
              local directory = vim.fn.expand(entry.value)
              local launcher = vim.fn.exepath "zvim"
              if launcher == "" then
                vim.notify("Install the Zvim CLI launcher to open a new window", vim.log.levels.ERROR)
                return
              end
              if vim.fn.isdirectory(directory) == 0 then
                vim.notify("Project directory is unavailable: " .. directory, vim.log.levels.ERROR)
                return
              end

              local ok, err = pcall(vim.system, { launcher, "--", directory }, { text = true }, function(result)
                if result.code ~= 0 then
                  vim.schedule(function()
                    vim.notify("Cannot open Zvim window: " .. (result.stderr or ""), vim.log.levels.ERROR)
                  end)
                end
              end)
              if not ok then
                vim.notify("Cannot launch Zvim: " .. tostring(err), vim.log.levels.ERROR)
                return
              end
              require("telescope.actions").close(prompt_bufnr)
            end

            map("i", "<C-o>", open_in_zvim_window, { desc = "Open project in a new Zvim window" })
            map("n", "<C-o>", open_in_zvim_window, { desc = "Open project in a new Zvim window" })
            return true
          end,
        },
      },
    },
    init = function()
      vim.g.neovim_project_session_loaded = false
      vim.api.nvim_create_autocmd("User", {
        group = vim.api.nvim_create_augroup("project_startup_session", { clear = true }),
        pattern = "SessionLoadPost",
        callback = function()
          vim.g.neovim_project_session_loaded = true
        end,
      })
      -- enable saving the state of plugins in the session
      vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
    end,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
      { "Shatur/neovim-session-manager" },
    },
    lazy = false,
    priority = 100,
  },
}
