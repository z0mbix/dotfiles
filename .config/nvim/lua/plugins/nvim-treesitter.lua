-- https://github.com/nvim-treesitter/nvim-treesitter
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    { "nvim-treesitter/nvim-treesitter-textobjects" }, -- Syntax aware text-objects
    {
      "nvim-treesitter/nvim-treesitter-context", -- Show code context
      opts = {
        enable = true,
        mode = "topline",
        line_numbers = true,
      },
    },
  },
  config = function()
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
  end,
}
