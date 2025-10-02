-- https://github.com/ojroques/nvim-bufdel
return {
  "ojroques/nvim-bufdel",

  config = function()
    require("bufdel").setup({
      next = "tabs",
      quit = false, -- do not quit neovim when last buffer is closed
    })
  end,
}
