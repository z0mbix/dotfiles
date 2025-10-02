-- Credits to original https://github.com/rose-pine/neovim
-- Rose Pine Moon theme converted to base46 format for NvChad

local M = {}

M.base_30 = {
	white = "#e0def4",       -- rose-pine text
	darker_black = "#1f1d30", -- rose-pine _nc (darker than base)
	black = "#232136",       -- rose-pine base (main background)
	black2 = "#28253a",      -- slightly lighter than base
	one_bg = "#2a273f",      -- rose-pine surface
	one_bg2 = "#393552",     -- rose-pine overlay
	one_bg3 = "#44415a",     -- rose-pine highlight_med
	grey = "#6e6a86",        -- rose-pine muted
	grey_fg = "#908caa",     -- rose-pine subtle
	grey_fg2 = "#9893a5",    -- slightly lighter subtle
	light_grey = "#a8a4b8",  -- even lighter
	red = "#eb6f92",         -- rose-pine love
	baby_pink = "#f0a3c1",   -- lighter love
	pink = "#ea9a97",        -- rose-pine rose (used as pink alternative)
	line = "#2a283e",        -- rose-pine highlight_low (for splits)
	green = "#95b1ac",       -- rose-pine leaf (closest to green)
	vibrant_green = "#a3c7a3", -- brighter green
	nord_blue = "#3e8fb0",   -- rose-pine pine
	blue = "#3e8fb0",        -- rose-pine pine
	yellow = "#f6c177",      -- rose-pine gold
	sun = "#f9d71c",         -- brighter yellow
	purple = "#c4a7e7",      -- rose-pine iris
	dark_purple = "#b48ead", -- darker purple
	teal = "#9ccfd8",        -- rose-pine foam
	orange = "#ea9a97",      -- rose-pine rose
	cyan = "#9ccfd8",        -- rose-pine foam
	statusline_bg = "#26233a", -- slightly darker than surface
	lightbg = "#2d2a41",     -- lighter background for certain elements
	pmenu_bg = "#3e8fb0",    -- pine for popup menu
	folder_bg = "#c4a7e7",   -- iris for folder icons
}

M.base_16 = {
	base00 = "#232136", -- rose-pine base
	base01 = "#2a273f", -- rose-pine surface
	base02 = "#393552", -- rose-pine overlay
	base03 = "#56526e", -- rose-pine highlight_high
	base04 = "#6e6a86", -- rose-pine muted
	base05 = "#908caa", -- rose-pine subtle
	base06 = "#e0def4", -- rose-pine text
	base07 = "#e6e4f4", -- lighter than text
	base08 = "#eb6f92", -- rose-pine love (red)
	base09 = "#ea9a97", -- rose-pine rose (orange)
	base0A = "#f6c177", -- rose-pine gold (yellow)
	base0B = "#95b1ac", -- rose-pine leaf (green)
	base0C = "#9ccfd8", -- rose-pine foam (cyan)
	base0D = "#3e8fb0", -- rose-pine pine (blue)
	base0E = "#c4a7e7", -- rose-pine iris (purple)
	base0F = "#d87084", -- darker love variant (brown/dark red)
}

M.type = "dark"

M = require("base46").override_theme(M, "rose-pine-moon")

M.polish_hl = {
	syntax = {
		Comment = { fg = M.base_30.grey, italic = true },
		String = { fg = M.base_30.green },
		Function = { fg = M.base_30.blue },
		Keyword = { fg = M.base_30.purple },
		Type = { fg = M.base_30.cyan },
		Constant = { fg = M.base_30.orange },
	},

	treesitter = {
		["@comment"] = { fg = M.base_30.grey, italic = true },
		["@string"] = { fg = M.base_30.green },
		["@function"] = { fg = M.base_30.blue },
		["@function.call"] = { fg = M.base_30.blue },
		["@keyword"] = { fg = M.base_30.purple },
		["@type"] = { fg = M.base_30.cyan },
		["@constant"] = { fg = M.base_30.orange },
		["@variable"] = { fg = M.base_30.white },
		["@parameter"] = { fg = M.base_30.purple, italic = true },
		["@property"] = { fg = M.base_30.cyan },
		["@punctuation"] = { fg = M.base_30.grey_fg },
		["@tag"] = { fg = M.base_30.red },
		["@tag.attribute"] = { fg = M.base_30.yellow },
		["@operator"] = { fg = M.base_30.purple },
	},
}

return M
