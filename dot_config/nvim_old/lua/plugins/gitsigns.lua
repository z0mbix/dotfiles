-- https://github.com/lewis6991/gitsigns.nvim
return {
  "lewis6991/gitsigns.nvim",
  dependencies = "nvim-lua/plenary.nvim",
  config = function()
    require("gitsigns").setup({
      current_line_blame = false,
    })
  end,
}
