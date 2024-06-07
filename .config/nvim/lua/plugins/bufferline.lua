-- https://github.com/akinsho/bufferline.nvim
return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",

  config = function()
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
  end,
}
