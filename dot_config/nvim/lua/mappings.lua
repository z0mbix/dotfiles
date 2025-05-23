local remap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- source/edit init.lua
remap("n", "<leader>ce", ":edit $MYVIMRC<cr>", opts)
remap("n", "<leader>cs", ":source $MYVIMRC<CR>", opts)

-- move a character to the beginning or end of the line
remap("n", "mH", ':let @z=@"<cr>x0P:let @"=@z<cr>', opts)
remap("n", "mL", ':let @z=@"<cr>x$p:let @"=@z<cr>', opts)

-- Show/Hide invisible characters
remap("n", "<leader>'", ":set list!<CR>", opts)

-- move a character to the beginning or end of the word
remap("n", "mh", ':let @z=@"<cr>xBP:let @"=@z<cr>', opts)
remap("n", "ml", ':let @z=@"<cr>xep:let @"=@z<cr>', opts)

-- Go to first character, not column 0
remap("n", "0", "^", opts)

-- Easier to type, and I never use the default behavior.
remap("n", "H", "^", opts)
remap("n", "L", "$", opts)
remap("v", "H", "^", opts)
remap("v", "L", "g_", opts)

-- Make yanking behave like D/C/S etc.
remap("n", "Y", "y$", opts)

-- Keep search results and joins centred
remap("n", "n", "nzzzv", opts)
remap("n", "N", "Nzzzv", opts)
remap("n", "J", "mzJ`z", opts)

-- Buffers (commands provided by ojroques/nvim-bufdel)
remap("n", "<leader>x", ":BufDel<CR>", opts)
remap("n", "<leader>X", ":BufDelAll<CR>", opts)
remap("n", "<C-q>", ":BufDel<CR>", opts)

-- Undotree
remap("n", "<leader>u", ":UndotreeToggle<CR>", opts)

-- Git
remap("n", "<leader>gs", ":Gstatus<CR>gg<c-n>", opts)
remap("n", "<leader>gd", ":Gitsigns toggle_linehl<CR>", opts)
remap("n", "<leader>gb", ":GitBlameToggle<CR>", opts)
remap("n", "<leader>ghp", ":Gitsigns preview_hunk<CR>", opts)
remap("n", "<leader>ghr", ":Gitsigns reset_hunk<CR>", opts)
remap("n", "<leader>ghj", ":Gitsigns next_hunk<CR>", opts)
remap("n", "<leader>ghk", ":Gitsigns prev_hunk<CR>", opts)
remap("n", "<leader>gg", ":Neogit<CR>", opts)

-- Write as root if we don't have permission
remap("c", "w!!", "%!sudo tee > /dev/null %", opts)

-- Clear search highlighting
remap("n", "<leader>/", ":nohlsearch<CR>", opts)

-- Telescope
remap("n", "<leader>ts", ":Telescope<CR>", opts)
remap("n", "<leader><Space>", ":Telescope current_buffer_fuzzy_find sorting_strategy=ascending<CR>", opts)
remap("n", "<leader>fl", ":Telescope current_buffer_fuzzy_find sorting_strategy=ascending<CR>", opts)
remap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
remap("n", "<leader>fb", ":Telescope file_browser<CR>", opts)
remap("n", "<leader>fc", ":Telescope commands<CR>", opts)
remap("n", "<leader>fC", ":Telescope colorscheme<CR>", opts)
remap("n", "<leader>fF", ":Telescope git_files<CR>", opts)
remap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
remap("n", "<leader>fh", ":Telescope command_history<CR>", opts)
remap("n", "<leader>ft", ":Telescope filetypes<CR>", opts)
remap("n", "<leader>fT", ":TodoTelescope<CR>", opts)
remap("n", "<leader>fU", ":UrlView<CR>", opts)
remap("n", "<leader>fu", ":Telescope undo<CR>", opts)
remap("n", "<leader>fm", ":Telescope marks<CR>", opts)
remap("n", "<leader>fa", ":Telescope live_grep<CR>", opts)
remap("n", "<leader>fp", ":Telescope live_grep<CR>", opts)
remap("n", "<leader>fs", ":Telescope spell_suggect<CR>", opts)
remap("n", "<leader>fw", ":Telescope grep_string<CR>", opts)
remap("n", "<leader>fy", ":Telescope yank_history<CR>", opts)
remap("n", "<leader>fgs", ":Telescope git_status<CR>", opts)
remap("n", "<leader>fgc", ":Telescope git_commits<CR>", opts)
remap("n", "<leader>fgb", ":Telescope git_branches<CR>", opts)

-- Remap for dealing with word wrap
remap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
remap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Switch buffers with tab/shift-tab
remap("n", "<TAB>", ":bnext!<CR>", opts)
remap("n", "<S-TAB>", ":bprevious!<CR>", opts)

-- nvim-tree
remap("n", "<leader>n", ":Neotree toggle=true action=show<CR>", opts)
remap("n", "<leader>Ne", ":Neotree source=filesystem toggle=true action=focus position=float<CR>", opts)
remap("n", "<leader>Ng", ":Neotree source=git_status toggle=true action=focus position=float reveal=true<CR>", opts)

-- Folds
remap("n", "<Enter>", "za", opts)
remap("v", "<Enter>", "za", opts)

-- Make navigating around splits easier
remap("n", "<C-j>", "<C-w>j", opts)
remap("n", "<C-k>", "<C-w>k", opts)
remap("n", "<C-h>", "<C-w>h", opts)
remap("n", "<C-l>", "<C-w>l", opts)

-- Close/save files
remap("n", "<leader>wf", ":update<CR>", opts)

-- Fix split window ratios
remap("n", "<leader>we", "<C-w>=", opts)
remap("n", "<leader>ws", "<C-w>x", opts)

-- smart-splits.nvim
remap("n", "<leader>wh", ":SmartResizeLeft 10<CR>", opts)
remap("n", "<leader>wj", ":SmartResizeDown 5<CR>", opts)
remap("n", "<leader>wk", ":SmartResizeUp 5<CR>", opts)
remap("n", "<leader>wl", ":SmartResizeRight 10<CR>", opts)
remap("n", "<leader>wr", ":SmartResizeMode<CR>", opts)

-- Reselect visual block after indent/outdent
remap("v", "<", "<gv", opts)
remap("v", ">", ">gv", opts)

-- Improve up/down movement on wrapped lines
remap("n", "j", "gj", opts)
remap("n", "k", "gk", opts)

-- Show current file in finder
remap("n", "<leader>oo", ":Reveal<CR>", opts)

-- Open file with the default application
remap("n", "<leader>of", ':silent !open "%"<CR>', opts)

-- Select all
remap("n", "<leader>a", "ggVG", opts)

-- Comment all
remap("n", "<leader>ga", "ggVGgc", opts)

-- Remove annoying F1 help
remap("i", "<F1>", "<nop>", opts)
remap("n", "<F1>", "<nop>", opts)
remap("v", "<F1>", "<nop>", opts)

-- Show registers
remap("n", "<leader>r", ":registers<CR>", opts)

-- Keep the cursor in place while joining lines
remap("n", "J", "mzJ`z", opts)

-- Delete without cutting
remap("n", "<leader>d", '"_d', opts)
remap("v", "<leader>d", '"_d', opts)

-- zen-mode
remap("n", "<leader>z", ":ZenMode<CR>", opts)

-- minimap.vim
remap("n", "<leader>mm", ":MinimapToggle<CR>", opts)

-- lsp
remap("n", "<leader>F", ":Format<CR>", opts)

-- which-key.nvim
-- remap("n", "<leader>Wk", ":WhichKey<CR>", opts)

-- vim-maximizer
remap("n", "<leader>W", ":MaximizerToggle<CR>", opts)
remap("v", "<leader>W", ":MaximizerToggle<CR>gv", opts)

-- trouble.nvim
remap("n", "<leader>T", ":TroubleToggle<CR>", opts)

-- quickfix
remap("n", "<leader>qft", [[<Cmd>lua require('functions').toggle_qf()<CR>]], opts)
remap("n", "<leader>qfo", ":copen<CR>", opts)
remap("n", "<leader>qfc", ":cclose<CR>", opts)

-- FTerm
remap("t", "<leader>tt", [[<Cmd>lua require('FTerm').toggle()<CR>]], opts)
remap("n", "<leader>tt", [[<Cmd>lua require('FTerm').toggle()<CR>]], opts)

-- glow.nvim
remap("n", "<leader>mp", ":Glow<CR>", opts)

-- open things
remap("n", "gx", ":!open <C-R><C-A><CR>", opts)

-- move.nvim
remap("n", "<A-j>", ":MoveLine(1)<CR>", opts)
remap("n", "<A-k>", ":MoveLine(-1)<CR>", opts)
remap("n", "<A-h>", ":MoveHChar(-1)<CR>", opts)
remap("n", "<A-l>", ":MoveHChar(1)<CR>", opts)
remap("n", "<leader>wf", ":MoveWord(1)<CR>", opts)
remap("n", "<leader>wb", ":MoveWord(-1)<CR>", opts)
remap("v", "<A-j>", ":MoveBlock(1)<CR>", opts)
remap("v", "<A-k>", ":MoveBlock(-1)<CR>", opts)
remap("v", "<A-h>", ":MoveHBlock(-1)<CR>", opts)
remap("v", "<A-l>", ":MoveHBlock(1)<CR>", opts)

-- Disable annoying things
remap("n", "Q", "<nop>", opts)
remap("n", "q", "<nop>", opts)

-- Ctrl + h,j,k,l for insert mode
remap("i", "<C-h>", "<left>", opts)
remap("i", "<C-j>", "<down>", opts)
remap("i", "<C-k>", "<up>", opts)
remap("i", "<C-l>", "<right>", opts)

-- Switch buffers using vim-submode
vim.cmd([[
	call submode#enter_with('bnext/bprev', 'n', 's', '<leader>l', ':bn<CR>')
	call submode#enter_with('bnext/bprev', 'n', 's', '<leader>h', ':bp<CR>')
	call submode#map('bnext/bprev', 'n', 's', 'l', ':bn<CR>')
  call submode#map('bnext/bprev', 'n', 's', 'h', ':bp<CR>')
]])

-- renamer.nvim
remap("i", "<F2>", '<cmd>lua require("renamer").rename()<cr>', opts)
remap("n", "<leader>rn", '<cmd>lua require("renamer").rename()<cr>', opts)
remap("v", "<leader>rn", '<cmd>lua require("renamer").rename()<cr>', opts)

-- spectre.nvim
remap("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', opts)
remap("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<cr>', opts)
remap("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', opts)
remap("n", "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', opts)

-- win-mover.nvim
remap("n", "<leader>mw", '<cmd>lua require("win-mover").enter_move_mode()<cr>', opts)
