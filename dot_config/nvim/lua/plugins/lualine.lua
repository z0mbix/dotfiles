-- https://github.com/nvim-lualine/lualine.nvim
return {
  "hoob3rt/lualine.nvim",

  config = function()
    require("lualine").setup({
      options = {
        theme = vim.g.colorscheme.name,
      },
      extensions = {
        "neo-tree",
        "quickfix",
      },
    })
  end,
}
