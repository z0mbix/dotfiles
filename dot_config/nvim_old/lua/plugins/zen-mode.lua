-- https://github.com/folke/zen-mode.nvim
return {
  "folke/zen-mode.nvim",

  config = function()
    require("zen-mode").setup({
      window = {
        width = 0.85, -- width will be 85% of the editor width
      },
    })
  end,
}
