require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

-- source/edit init.lua
map("n", "<leader>ce", ":edit $MYVIMRC<cr>")
map("n", "<leader>cs", ":source $MYVIMRC<CR>")

-- move a character to the beginning or end of the line
map("n", "mH", ':let @z=@"<cr>x0P:let @"=@z<cr>')
map("n", "mL", ':let @z=@"<cr>x$p:let @"=@z<cr>')

-- Show/Hide invisible characters
map("n", "<leader>'", ":set list!<CR>")

-- move a character to the beginning or end of the word
map("n", "mh", ':let @z=@"<cr>xBP:let @"=@z<cr>', { desc = "Move character to beginning of word", silent = true })
map("n", "ml", ':let @z=@"<cr>xep:let @"=@z<cr>', { desc = "Move character to end of word", silent = true })

-- Go to first character, not column 0
map("n", "0", "^")

-- Easier to type, and I never use the default behavior.
map("n", "H", "^")
map("n", "L", "$")
map("v", "H", "^")
map("v", "L", "g_")

-- Keep search results and joins centred
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "J", "mzJ`z")

-- Buffers (commands provided by ojroques/nvim-bufdel)
map("n", "<leader>x", ":BufDel<CR>")
map("n", "<leader>X", ":BufDelAll<CR>")
map("n", "<C-q>", ":BufDel<CR>")

-- Nvdash
map("n", "<leader>da", ":Nvdash<CR>")

-- Git
map("n", "<leader>gs", ":Gstatus<CR>gg<c-n>")
map("n", "<leader>gd", ":Gitsigns toggle_linehl<CR>")
map("n", "<leader>gb", ":GitBlameToggle<CR>")
map("n", "<leader>ghp", ":Gitsigns preview_hunk<CR>")
map("n", "<leader>ghr", ":Gitsigns reset_hunk<CR>")
map("n", "<leader>ghj", ":Gitsigns next_hunk<CR>")
map("n", "<leader>ghk", ":Gitsigns prev_hunk<CR>")
map("n", "<leader>gg", ":Neogit<CR>")

-- Write as root if we don't have permission
map("c", "w!!", "%!sudo tee > /dev/null %")

-- Clear search highlighting
map("n", "<leader>/", ":nohlsearch<CR>")

-- Telescope
map("n", "<leader>ts", ":Telescope<CR>", { desc = "Telescope show picker", silent = true })
map(
  "n",
  "<leader><Space>",
  ":Telescope current_buffer_fuzzy_find sorting_strategy=ascending<CR>",
  { desc = "Telescope current buffer fuzzy find", silent = true }
)
map("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Telescope find files", silent = true })
map("n", "<leader>fb", ":Telescope file_browser<CR>", { desc = "Telescope file browser", silent = true })
map("n", "<leader>fc", ":Telescope commands<CR>", { desc = "Telescope commands", silent = true })
map("n", "<leader>fC", ":Telescope colorscheme<CR>", { desc = "Telescope colorscheme", silent = true })
map("n", "<leader>fF", ":Telescope git_files<CR>", { desc = "Telescope git files", silent = true })
map("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Telescope buffers", silent = true })
map("n", "<leader>fh", ":Telescope command_history<CR>", { desc = "Telescope command history", silent = true })
map("n", "<leader>ft", ":Telescope filetypes<CR>", { desc = "Telescope filetypes", silent = true })
map("n", "<leader>fT", ":TodoTelescope<CR>", { desc = "Telescope todos", silent = true })
map("n", "<leader>fU", ":UrlView<CR>", { desc = "Telescope url view", silent = true })
map("n", "<leader>fu", ":Telescope undo<CR>", { desc = "Telescope undo", silent = true })
map("n", "<leader>fm", ":Telescope marks<CR>", { desc = "Telescope marks", silent = true })
map("n", "<leader>fa", ":Telescope live_grep<CR>", { desc = "Telescope live grep", silent = true })
map("n", "<leader>fp", ":Telescope live_grep<CR>", { desc = "Telescope live grep", silent = true })
map("n", "<leader>fr", ":Telescope registers<CR>", { desc = "Telescope registers", silent = true })
map("n", "<leader>fs", ":Telescope spell_suggect<CR>", { desc = "Telescope spell suggest", silent = true })
map("n", "<leader>fw", ":Telescope grep_string<CR>", { desc = "Telescope grep string under cursor", silent = true })
map("n", "<leader>fy", ":Telescope yank_history<CR>", { desc = "Telescope yank history", silent = true })
map("n", "<leader>fgs", ":Telescope git_status<CR>", { desc = "Telescope git status", silent = true })
map("n", "<leader>fgc", ":Telescope git_commits<CR>", { desc = "Telescope git commits", silent = true })
map("n", "<leader>fgb", ":Telescope git_branches<CR>", { desc = "Telescope git branches", silent = true })
map("n", "<leader>cd", ":Telescope zoxide list<CR>", { desc = "Telescope zoxide", silent = true })

-- Remap for dealing with word wrap
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Switch buffers with tab/shift-tab
map("n", "<TAB>", ":bnext!<CR>", { desc = "Next buffer", silent = true })
map("n", "<S-TAB>", ":bprevious!<CR>", { desc = "Previous buffer", silent = true })

-- nvim-tree
map("n", "<leader>n", ":NvimTreeToggle toggle=true action=show<CR>", { desc = "Toggle file tree", silent = true })

-- Folds
map("n", "<Enter>", "za")
map("v", "<Enter>", "za")

-- Make navigating around splits easier
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")

-- Close/save files
map("n", "<leader>wf", ":update<CR>")

-- Fix split window ratios
map("n", "<leader>we", "<C-w>=")
map("n", "<leader>ws", "<C-w>x")

-- smart-splits.nvim
map("n", "<leader>wh", ":SmartResizeLeft 10<CR>")
map("n", "<leader>wj", ":SmartResizeDown 5<CR>")
map("n", "<leader>wk", ":SmartResizeUp 5<CR>")
map("n", "<leader>wl", ":SmartResizeRight 10<CR>")
map("n", "<leader>wr", ":SmartResizeMode<CR>")

-- Reselect visual block after indent/outdent
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Improve up/down movement on wrapped lines
map("n", "j", "gj")
map("n", "k", "gk")

-- Show current file in finder
map("n", "<leader>oo", ":Reveal<CR>")

-- Open file with the default application
map("n", "<leader>of", ':silent !open "%"<CR>')

-- Select all
map("n", "<leader>a", "ggVG")

-- Comment all
map("n", "<leader>ga", "ggVGgc")

-- Remove annoying F1 help
map("i", "<F1>", "<nop>")
map("n", "<F1>", "<nop>")
map("v", "<F1>", "<nop>")

-- Keep the cursor in place while joining lines
map("n", "J", "mzJ`z")

-- Delete without cutting
map("n", "<leader>d", '"_d')
map("v", "<leader>d", '"_d')

-- zen-mode
map("n", "<leader>z", ":ZenMode<CR>", { desc = "Toggle Zen Mode", silent = true })

-- minimap.vim
map("n", "<leader>mm", ":MinimapToggle<CR>", { desc = "Toggle minimap", silent = true })

-- vim-maximizer
map("n", "<leader>W", ":MaximizerToggle<CR>", { desc = "Maximize/restore current window", silent = true })
map("v", "<leader>W", ":MaximizerToggle<CR>gv", { desc = "Maximize/restore current window", silent = true })

-- trouble.nvim
map("n", "<leader>T", ":TroubleToggle<CR>")

-- persistence.nvim
map("n", "<leader>qs", function()
  require("persistence").load()
end) -- load the session for the current directory

map("n", "<leader>qS", function()
  require("persistence").select()
end) -- select a session to load

map("n", "<leader>ql", function()
  require("persistence").load { last = true }
end) -- load the last session

map("n", "<leader>qd", function()
  require("persistence").stop()
end) -- stop Persistence => session won't be saved on exit

-- quickfix
map("n", "<leader>qft", [[<Cmd>lua require('functions').toggle_qf()<CR>]])
map("n", "<leader>qfo", ":copen<CR>")
map("n", "<leader>qfc", ":cclose<CR>")

-- move.nvim
map("n", "<A-j>", ":MoveLine(1)<CR>")
map("n", "<A-k>", ":MoveLine(-1)<CR>")
map("n", "<A-h>", ":MoveHChar(-1)<CR>")
map("n", "<A-l>", ":MoveHChar(1)<CR>")
map("n", "<leader>wf", ":MoveWord(1)<CR>")
map("n", "<leader>wb", ":MoveWord(-1)<CR>")
map("v", "<A-j>", ":MoveBlock(1)<CR>")
map("v", "<A-k>", ":MoveBlock(-1)<CR>")
map("v", "<A-h>", ":MoveHBlock(-1)<CR>")
map("v", "<A-l>", ":MoveHBlock(1)<CR>")

-- Disable annoying things
map("n", "Q", "<nop>")
map("n", "q", "<nop>")

-- Ctrl + h,j,k,l for insert mode
map("i", "<C-h>", "<left>")
map("i", "<C-j>", "<down>")
map("i", "<C-k>", "<up>")
map("i", "<C-l>", "<right>")

-- grug-far.nvim
map("n", "<leader>S", function()
  require("grug-far").open()
end, { desc = "Search in project", silent = true })

map("n", "<leader>sp", function()
  require("grug-far").open()
end, { desc = "Search in project", silent = true })

map("v", "<leader>sp", function()
  require("grug-far").with_visual_selection()
end, { desc = "Search selection in project", silent = true })

map("n", "<leader>sb", function()
  require("grug-far").open { prefills = { paths = vim.fn.expand "%" } }
end, { desc = "Search in current file", silent = true })

map("v", "<leader>sb", function()
  require("grug-far").with_visual_selection { prefills = { paths = vim.fn.expand "%" } }
end, { desc = "Search selection in current file", silent = true })

map({ "n", "v" }, "<leader>sw", function()
  require("grug-far").open { prefills = { search = vim.fn.expand "<cword>" } }
end, { desc = "Search word under cursor", silent = true })

map("v", "<leader>si", function()
  require("grug-far").open { visualSelectionUsage = "operate-within-range" }
end, { desc = "Search within range", silent = true })

-- win-mover.nvim
map("n", "<leader>mw", '<cmd>lua require("win-mover").enter_move_mode()<cr>', { desc = "enter window move mode" })

-- terminal
map({ "n", "t" }, "<leader>tt", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal toggleable horizontal term" })

map({ "t", "t" }, "<leader>tt", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal toggleable horizontal term" })

-- CodeCompanion
map({ "n", "v" }, "<leader>ai", function()
  require("codecompanion").toggle()
end, { desc = "Toggle CodeCompanion Chat", silent = true })
