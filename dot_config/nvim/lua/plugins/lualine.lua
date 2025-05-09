-- https://github.com/nvim-lualine/lualine.nvim
return {
  "hoob3rt/lualine.nvim",

  config = function()
    require("lualine").setup({
      extensions = {
        "neo-tree",
        "quickfix",
      },
    })
  end,
}
