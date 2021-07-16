local remap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- source/edit init.lua
remap('n', '<leader>ce', ':edit $MYVIMRC<cr>', opts)
remap('n', '<leader>cs', ':source $MYVIMRC<CR>', opts)

-- move a character to the beginning or end of the line
remap('n', 'mH', ':let @z=@"<cr>x0P:let @"=@z<cr>', opts)
remap('n', 'mL', ':let @z=@"<cr>x$p:let @"=@z<cr>', opts)

-- Show/Hide invisible characters
remap('n', "<leader>'", ':set list!<CR>', opts)

-- move a character to the beginning or end of the word
remap('n', 'mh', ':let @z=@"<cr>xBP:let @"=@z<cr>', opts)
remap('n', 'ml', ':let @z=@"<cr>xep:let @"=@z<cr>', opts)

-- Go to first character, not column 0
remap('n', '0', '^', opts)

-- Easier to type, and I never use the default behavior.
remap('n', 'H', '^', opts)
remap('n', 'L', '$', opts)
remap('v', 'H', '^', opts)
remap('v', 'L', 'g_', opts)

-- Make yanking behave like D/C/S etc.
remap('n', 'Y', 'y$', opts)

-- Close/save files
remap('n', '<leader>q', ':q<CR>', opts)
remap('n', '<leader>w', ':update<CR>', opts)

-- Buffers
remap('n', '<leader>x', ':BufferClose<CR>', opts)
remap('n', '<leader>X', ':BufferClose!<CR>', opts)
remap('n', '<C-q>', ':BufferClose<CR>', opts)
-- remap('n', '<C-x>', ':BufferClose<CR>', opts)

-- Undotree
remap('n', '<leader>u', ':UndotreeToggle<CR>', opts)

-- Git
remap('n', '<leader>gs', ':Gstatus<CR>gg<c-n>', opts)
remap('n', '<leader>gd', ':Gitsigns toggle_linehl<CR>', opts)
remap('n', '<leader>gb', ':GitBlameToggle<CR>', opts)
remap('n', '<leader>ghp', ':Gitsigns preview_hunk<CR>', opts)
remap('n', '<leader>ghr', ':Gitsigns reset_hunk<CR>', opts)
remap('n', '<leader>ghj', ':Gitsigns next_hunk<CR>', opts)
remap('n', '<leader>ghk', ':Gitsigns prev_hunk<CR>', opts)
remap('n', '<leader>gg', ':LazyGit<CR>', opts)

-- Write as root if we don't have permission
remap('c', 'w!!', '%!sudo tee > /dev/null %', opts)

-- Clear search highlighting
remap('n', '<leader>/', ':nohlsearch<CR>', opts)

-- Telescope
remap('n', '<leader>ts', ':Telescope<CR>', opts)
remap('n', '<leader><Space>', ':Telescope current_buffer_fuzzy_find sorting_strategy=ascending<CR>', opts)
remap('n', '<leader>fl', ':Telescope current_buffer_fuzzy_find sorting_strategy=ascending<CR>', opts)
remap('n', '<leader>ff', ':Telescope find_files<CR>', opts)
remap('n', '<leader>fb', ':Telescope file_browser<CR>', opts)
remap('n', '<leader>fc', ':Telescope commands<CR>', opts)
remap('n', '<leader>fF', ':Telescope git_files<CR>', opts)
remap('n', '<leader>fb', ':Telescope buffers<CR>', opts)
remap('n', '<leader>fh', ':Telescope command_history<CR>', opts)
remap('n', '<leader>ft', ':Telescope filetypes<CR>', opts)
remap('n', '<leader>fT', ':Telescope tags<CR>', opts)
remap('n', '<leader>fm', ':Telescope marks<CR>', opts)
remap('n', '<leader>fa', ':Telescope live_grep<CR>', opts)
remap('n', '<leader>fp', ':Telescope live_grep<CR>', opts)
remap('n', '<leader>fw', ':Telescope grep_string<CR>', opts)
remap('n', '<leader>fgs', ':Telescope git_status<CR>', opts)
remap('n', '<leader>fgc', ':Telescope git_commits<CR>', opts)
remap('n', '<leader>fgb', ':Telescope git_branches<CR>', opts)

-- Open fuzzy finder if vim opened without any args except in home dir
vim.cmd([[
	augroup TELESCOPE_OPEN
		if argc() == 0 && getcwd() != expand("~")
			if isdirectory('.git')
				" autocmd vimenter * GFiles
				autocmd vimenter * Telescope git_files
			else
				" autocmd vimenter * Files
				autocmd vimenter * Telescope find_files
			endif
		endif
	augroup END
]])

-- Switch buffers using vim-submode
vim.cmd([[
	call submode#enter_with('bnext/bprev', 'n', 's', '<leader>l', ':bn<CR>')
	call submode#enter_with('bnext/bprev', 'n', 's', '<leader>h', ':bp<CR>')
	call submode#map('bnext/bprev', 'n', 's', 'l', ':bn<CR>')
	call submode#map('bnext/bprev', 'n', 's', 'h', ':bp<CR>')
]])

-- Switch buffers with tab/shift-tab
remap('n', '<TAB>', ':bnext!<CR>', opts)
remap('n', '<S-TAB>', ':bprevious!<CR>', opts)

-- nvim-tree
remap('n', '<leader>n', ':NvimTreeToggle<CR>', opts)

-- Folds
remap('n', '<Enter>', 'za', opts)
remap('v', '<Enter>', 'za', opts)

-- Make navigating around splits easier
remap('n', '<C-j>', '<C-w>j', opts)
remap('n', '<C-k>', '<C-w>k', opts)
remap('n', '<C-h>', '<C-w>h', opts)
remap('n', '<C-l>', '<C-w>l', opts)

-- Fix split window ratios
remap('n', '<leader>we', '<C-w>=', opts)

-- Bubble multiple lines
remap('v', '<C-j>', ":move '>+1<CR>gv=gv", opts)
remap('v', '<C-k>', ":move '<-2<CR>gv=gv", opts)
remap('v', '<Up>', ":move '<-2<CR>gv=gv", opts)
remap('v', '<Down>', ":move '>+1<CR>gv=gv", opts)

-- Reselect visual block after indent/outdent
remap('v', '<', '<gv', opts)
remap('v', '>', '>gv', opts)

-- Improve up/down movement on wrapped lines
remap('n', 'j', 'gj', opts)
remap('n', 'k', 'gk', opts)

-- Show current file in finder
remap('n', '<leader>oo', ':Reveal<CR>', opts)

-- Open file with the default application
remap('n', '<leader>of', ':silent !open %<CR>', opts)

-- Select all
remap('n', '<leader>a', 'ggVG', opts)

-- Remove annoying F1 help
remap('i', '<F1>', '<nop>', opts)
remap('n', '<F1>', '<nop>', opts)
remap('v', '<F1>', '<nop>', opts)

-- Show registers
remap('n', '<leader>r', ':registers<CR>', opts)

-- Keep the cursor in place while joining lines
remap('n', 'J', 'mzJ`z', opts)

-- Delete without cutting
remap('n', '<leader>d', '"_d', opts)
remap('v', '<leader>d', '"_d', opts)

-- zen-mode
remap('n', '<leader>z', ':ZenMode<CR>', opts)

-- minimap.vim
remap('n', '<leader>mm', ':MinimapToggle<CR>', opts)

-- lsp
remap('n', '<leader>F', ':Format<CR>', opts)

-- which-key.nvim
remap('n', '<leader>W', ':WhichKey<CR>', opts)

-- vim-maximizer
remap('n', '<leader>W', ':MaximizerToggle<CR>', opts)
remap('v', '<leader>W', ':MaximizerToggle<CR>gv', opts)
