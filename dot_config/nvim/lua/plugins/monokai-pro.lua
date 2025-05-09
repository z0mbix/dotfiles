-- https://github.com/loctvl842/monokai-pro.nvim
return {
  "loctvl842/monokai-pro.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("monokai-pro").setup({})
    --   filter = vim.g.colorscheme.filter, -- classic | octagon | pro | machine | ristretto | spectrum
    -- })
  end,
}
