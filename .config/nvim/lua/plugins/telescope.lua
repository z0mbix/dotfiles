-- https://github.com/nvim-telescope/telescope.nvim
return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope-project.nvim" },
    { "nvim-telescope/telescope-symbols.nvim" },
    { "nvim-telescope/telescope-frecency.nvim" },
    { "debugloop/telescope-undo.nvim" },
  },

  config = function()
    local actions = require("telescope.actions")
    require("telescope").setup({
      defaults = {
        prompt_prefix = "» ",
        mappings = {
          i = {
            ["<esc>"] = actions.close,
            ["<C-h>"] = "which_key",
          },
          n = {
            ["<esc>"] = actions.close,
          },
        },
        layout_strategy = "flex",
        scroll_strategy = "cycle",
        winblend = 0,
        -- winblend = 10,
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
    require("telescope").load_extension("yank_history")
    require("telescope").load_extension("project")
    require("telescope").load_extension("undo")
  end,
}
