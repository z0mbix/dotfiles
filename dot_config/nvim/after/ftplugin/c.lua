vim.bo.tabstop = 8
vim.bo.shiftwidth = 8

local undo = vim.b.undo_ftplugin
vim.b.undo_ftplugin = (undo and undo ~= "" and undo .. " | " or "") .. "setlocal tabstop< shiftwidth<"
