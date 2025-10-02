-- https://github.com/axieax/urlview.nvim
return {
  "axieax/urlview.nvim",
  config = function()
    require("urlview").setup({
      default_action = "system",
      default_picker = "telescope",
      log_level_min = vim.log.levels.OFF,
    })
  end,
}
