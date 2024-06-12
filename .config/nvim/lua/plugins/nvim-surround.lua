-- https://github.com/kylechui/nvim-surround
return {
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
}
