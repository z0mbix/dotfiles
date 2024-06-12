-- https://github.com/loctvl842/monokai-pro.nvim
return {
  "loctvl842/monokai-pro.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("monokai-pro").setup()
  end,
}
