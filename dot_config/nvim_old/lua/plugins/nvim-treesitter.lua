-- https://github.com/nvim-treesitter/nvim-treesitter
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    { "nvim-treesitter/nvim-treesitter-textobjects" }, -- Syntax aware text-objects
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "bash",
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
        "terraform",
        "toml",
        "vim",
        "vimdoc",
        "xml",
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
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
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
