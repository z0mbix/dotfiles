vim.bo.commentstring = "// %s"
vim.bo.expandtab = false
vim.bo.softtabstop = 0

local undo = vim.b.undo_ftplugin
vim.b.undo_ftplugin = (undo and undo ~= "" and undo .. " | " or "") .. "setlocal commentstring< expandtab< softtabstop<"
