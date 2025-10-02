---@type Base46Table
local M = {}

M.base_30 = {
  white = "#fcfcfa",
  black = "#2d2a2e", -- nvim bg
  darker_black = "#252329",
  black2 = "#353339",
  one_bg = "#3c3a40", -- statusline bg
  one_bg2 = "#444248",
  one_bg3 = "#4e4c52",
  grey = "#727072",
  grey_fg = "#848384",
  grey_fg2 = "#949394",
  light_grey = "#a1a0a2",
  red = "#ff6188",
  baby_pink = "#ff7597",
  pink = "#ff6188",
  line = "#3a383e", -- for lines like vertsplit
  green = "#a9dc76",
  vibrant_green = "#b4e67e",
  nord_blue = "#78dce8",
  blue = "#78dce8",
  seablue = "#68c6d8",
  yellow = "#ffd866",
  sun = "#ffeba6",
  purple = "#ab9df2",
  dark_purple = "#9a84e0",
  teal = "#78dce8",
  orange = "#fc9867",
  cyan = "#78dce8",
  statusline_bg = "#353339",
  lightbg = "#444248",
  pmenu_bg = "#ffd866",
  folder_bg = "#78dce8",
}

M.base_16 = {
  base00 = "#2d2a2e", -- bg
  base01 = "#353339",
  base02 = "#3c3a40",
  base03 = "#444248",
  base04 = "#848384", -- fg4
  base05 = "#fcfcfa", -- fg
  base06 = "#f7f7f7",
  base07 = "#ffffff",
  base08 = "#ff6188", -- red
  base09 = "#fc9867", -- orange
  base0A = "#ffd866", -- yellow
  base0B = "#a9dc76", -- green
  base0C = "#78dce8", -- cyan
  base0D = "#78dce8", -- blue
  base0E = "#ab9df2", -- purple
  base0F = "#ff6188", -- pinkish accent
}

M.polish_hl = {
  treesitter = {
    ["parameter"] = { fg = M.base_30.blue },
    ["@variable.member.key"] = { fg = M.base_30.white },
    ["@string"] = { fg = M.base_30.sun },
    ["@boolean"] = { fg = M.base_16.base09 },
    ["@punctuation.bracket"] = { fg = M.base_30.sun },
    ["@operator"] = { fg = M.base_30.red },
  },

  syntax = {
    Operator = { fg = M.base_30.red },
  },
}

M.type = "dark"

M = require("base46").override_theme(M, "monokai-pro-octagon")

return M
