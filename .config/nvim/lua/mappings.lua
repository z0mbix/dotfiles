-- source/edit init.lua
vim.api.nvim_set_keymap('n', '<leader>ec', ':edit $MYVIMRC<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sc', ':source $MYVIMRC<CR>', { noremap = true, silent = true })

-- move a character to the beginning or end of the line
vim.api.nvim_set_keymap('n', 'mH', ':let @z=@"<cr>x0P:let @"=@z<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'mL', ':let @z=@"<cr>x$p:let @"=@z<cr>', { noremap = true, silent = true })

-- Show/Hide invisible characters
vim.api.nvim_set_keymap('n', '<leader>\'', ':set list!<CR>', { noremap = true, silent = true })

-- move a character to the beginning or end of the word
vim.api.nvim_set_keymap('n', 'mh', ':let @z=@"<cr>xBP:let @"=@z<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'ml', ':let @z=@"<cr>xep:let @"=@z<cr>', { noremap = true, silent = true })

-- Go to first character, not column 0
vim.api.nvim_set_keymap('n', '0', '^', { noremap = true, silent = true })

-- Easier to type, and I never use the default behavior.
vim.api.nvim_set_keymap('n', 'H', '^', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'L', '$', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'H', '^', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'L', 'g_', { noremap = true, silent = true })

-- Close/save files
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>' , { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>w', ':update<CR>', { noremap = true, silent = true })

-- Buffers
vim.api.nvim_set_keymap('n', '<leader>x', ':BufferClose<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>X', ':BufferClose!<CR>', { noremap = true, silent = true })

-- Undotree
vim.api.nvim_set_keymap('n', '<leader>u', ':UndotreeToggle<CR>', { noremap = true, silent = true })

-- Git
vim.api.nvim_set_keymap('n', '<leader>gs', ':Gstatus<CR>gg<c-n>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gd', ':Gitsigns toggle_linehl<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gb', ':Gitsigns blame_line<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ghp', ':Gitsigns preview_hunk<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ghr', ':Gitsigns reset_hunk<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gg', ':LazyGit<CR>', { noremap = true, silent = true })

-- Convert json to pretty printed version
vim.api.nvim_set_keymap('n', '<leader>ppj', '!%jq .<CR>', { noremap = true, silent = true })

-- Write as root if we don't have permission
vim.api.nvim_set_keymap('c', 'w!!', '%!sudo tee > /dev/null %', { noremap = true, silent = true })

-- Clear search highlighting
vim.api.nvim_set_keymap('n', '<leader>/', ':nohlsearch<CR>', { noremap = true, silent = true })

-- Telescope
vim.api.nvim_set_keymap('n', '<leader>ts', ':Telescope<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><Space>', ':Telescope current_buffer_fuzzy_find sorting_strategy=ascending prompt_position=top<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fl', ':Telescope current_buffer_fuzzy_find sorting_strategy=ascending prompt_position=top<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope file_browser<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fc', ':Telescope commands<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fF', ':Telescope git_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fh', ':Telescope command_history<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ft', ':Telescope filetypes<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fT', ':Telescope tags<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fm', ':Telescope marks<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fa', ':Telescope live_grep<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fp', ':Telescope live_grep<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fw', ':Telescope grep_string<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fgs', ':Telescope git_status<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fgc', ':Telescope git_commits<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fgb', ':Telescope git_branches<CR>', { noremap = true, silent = true })

if vim.v.argc == 0 then
	print('NO ARGS')
end

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
  call submode#enter_with('bnext/bprev', 'n', '', '<leader>l', ':bn<CR>')
  call submode#enter_with('bnext/bprev', 'n', '', '<leader>h', ':bp<CR>')
  call submode#map('bnext/bprev', 'n', '', 'l', ':bn<CR>')
  call submode#map('bnext/bprev', 'n', '', 'h', ':bp<CR>')
]])

-- nvim-tree
vim.api.nvim_set_keymap('n', '<leader>n', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Folds
vim.api.nvim_set_keymap('n', '<Enter>', 'za', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Enter>', 'za', { noremap = true, silent = true })

-- Make navigating around splits easier
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- Fix split window ratios
vim.api.nvim_set_keymap('n', '<leader>we', '<C-w>=', { noremap = true, silent = true })

-- Bubble multiple lines
vim.api.nvim_set_keymap('v', '<C-K>', '[egv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-J>', ']egv', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('v', 'J', ':m '>+1<CR>gv=gv', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('v', 'K', ':m '<-2<CR>gv=gv', { noremap = true, silent = true })
--
-- vmap <C-K> [egv
-- vmap <C-J> ]egv
-- vnoremap J :m '>+1<CR>gv=gv
-- vnoremap K :m '<-2<CR>gv=gv
-- nmap <A-k> ddkP
-- nmap <A-j> ddp
-- nmap <A-Up> ddkP
-- nmap <A-Down> ddp

-- Reselect visual block after indent/outdent
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })

-- Improve up/down movement on wrapped lines
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true, silent = true })

-- Show current file in finder
-- nnoremap <leader>F :silent :Reveal<cr>

-- select all
vim.api.nvim_set_keymap('n', '<leader>a', 'ggVG', { noremap = true, silent = true })

-- Remove annoying F1 help
vim.api.nvim_set_keymap('i', '<F1>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F1>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<F1>', '<nop>', { noremap = true, silent = true })

-- Show registers
vim.api.nvim_set_keymap('n', '<leader>r', ':registers<CR>', { noremap = true, silent = true })

-- Keep the cursor in place while joining lines
vim.api.nvim_set_keymap('n', 'J', 'mzJ`z', { noremap = true, silent = true })

-- Delete without cutting
vim.api.nvim_set_keymap('n', '<leader>d', '"_d', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>d', '"_d', { noremap = true, silent = true })
