-- https://github.com/nvim-neo-tree/neo-tree.nvim
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "s1n7ax/nvim-window-picker",
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },

  config = function()
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
        width = 34,
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
  end,
}
