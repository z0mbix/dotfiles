-- https://github.com/b0o/incline.nvim
return {
  "b0o/incline.nvim",

  config = function()
    require("incline").setup()
  end,
  -- Optional: Lazy load Incline
  event = "VeryLazy",
}
