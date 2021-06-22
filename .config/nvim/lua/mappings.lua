local remap = vim.api.nvim_set_keymap

-- source/edit init.lua
remap('n', '<leader>ec', ':edit $MYVIMRC<cr>', { noremap = true, silent = true })
remap('n', '<leader>sc', ':source $MYVIMRC<CR>', { noremap = true, silent = true })

-- move a character to the beginning or end of the line
remap('n', 'mH', ':let @z=@"<cr>x0P:let @"=@z<cr>', { noremap = true, silent = true })
remap('n', 'mL', ':let @z=@"<cr>x$p:let @"=@z<cr>', { noremap = true, silent = true })

-- Show/Hide invisible characters
remap('n', '<leader>\'', ':set list!<CR>', { noremap = true, silent = true })

-- move a character to the beginning or end of the word
remap('n', 'mh', ':let @z=@"<cr>xBP:let @"=@z<cr>', { noremap = true, silent = true })
remap('n', 'ml', ':let @z=@"<cr>xep:let @"=@z<cr>', { noremap = true, silent = true })

-- Go to first character, not column 0
remap('n', '0', '^', { noremap = true, silent = true })

-- Easier to type, and I never use the default behavior.
remap('n', 'H', '^', { noremap = true, silent = true })
remap('n', 'L', '$', { noremap = true, silent = true })
remap('v', 'H', '^', { noremap = true, silent = true })
remap('v', 'L', 'g_', { noremap = true, silent = true })

-- Close/save files
remap('n', '<leader>q', ':q<CR>' , { noremap = true, silent = true })
remap('n', '<leader>w', ':update<CR>', { noremap = true, silent = true })

-- Buffers
remap('n', '<leader>x', ':BufferClose<CR>', { noremap = true, silent = true })
remap('n', '<leader>X', ':BufferClose!<CR>', { noremap = true, silent = true })

-- Undotree
remap('n', '<leader>u', ':UndotreeToggle<CR>', { noremap = true, silent = true })

-- Git
remap('n', '<leader>gs', ':Gstatus<CR>gg<c-n>', { noremap = true, silent = true })
remap('n', '<leader>gd', ':Gitsigns toggle_linehl<CR>', { noremap = true, silent = true })
remap('n', '<leader>gb', ':Gitsigns blame_line<CR>', { noremap = true, silent = true })
remap('n', '<leader>ghp', ':Gitsigns preview_hunk<CR>', { noremap = true, silent = true })
remap('n', '<leader>ghr', ':Gitsigns reset_hunk<CR>', { noremap = true, silent = true })
remap('n', '<leader>gg', ':LazyGit<CR>', { noremap = true, silent = true })

-- Convert json to pretty printed version
remap('n', '<leader>ppj', '!%jq .<CR>', { noremap = true, silent = true })

-- Write as root if we don't have permission
remap('c', 'w!!', '%!sudo tee > /dev/null %', { noremap = true, silent = true })

-- Clear search highlighting
remap('n', '<leader>/', ':nohlsearch<CR>', { noremap = true, silent = true })

-- Telescope
remap('n', '<leader>ts', ':Telescope<CR>', { noremap = true, silent = true })
remap('n', '<leader><Space>', ':Telescope current_buffer_fuzzy_find sorting_strategy=ascending prompt_position=top<CR>', { noremap = true, silent = true })
remap('n', '<leader>fl', ':Telescope current_buffer_fuzzy_find sorting_strategy=ascending prompt_position=top<CR>', { noremap = true, silent = true })
remap('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })
remap('n', '<leader>fb', ':Telescope file_browser<CR>', { noremap = true, silent = true })
remap('n', '<leader>fc', ':Telescope commands<CR>', { noremap = true, silent = true })
remap('n', '<leader>fF', ':Telescope git_files<CR>', { noremap = true, silent = true })
remap('n', '<leader>fb', ':Telescope buffers<CR>', { noremap = true, silent = true })
remap('n', '<leader>fh', ':Telescope command_history<CR>', { noremap = true, silent = true })
remap('n', '<leader>ft', ':Telescope filetypes<CR>', { noremap = true, silent = true })
remap('n', '<leader>fT', ':Telescope tags<CR>', { noremap = true, silent = true })
remap('n', '<leader>fm', ':Telescope marks<CR>', { noremap = true, silent = true })
remap('n', '<leader>fa', ':Telescope live_grep<CR>', { noremap = true, silent = true })
remap('n', '<leader>fp', ':Telescope live_grep<CR>', { noremap = true, silent = true })
remap('n', '<leader>fw', ':Telescope grep_string<CR>', { noremap = true, silent = true })
remap('n', '<leader>fgs', ':Telescope git_status<CR>', { noremap = true, silent = true })
remap('n', '<leader>fgc', ':Telescope git_commits<CR>', { noremap = true, silent = true })
remap('n', '<leader>fgb', ':Telescope git_branches<CR>', { noremap = true, silent = true })

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
	call submode#enter_with('bnext/bprev', 'n', 's', '<leader>l', ':bn<CR>')
	call submode#enter_with('bnext/bprev', 'n', 's', '<leader>h', ':bp<CR>')
	call submode#map('bnext/bprev', 'n', 's', 'l', ':bn<CR>')
	call submode#map('bnext/bprev', 'n', 's', 'h', ':bp<CR>')
]])

-- nvim-tree
remap('n', '<leader>n', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Folds
remap('n', '<Enter>', 'za', { noremap = true, silent = true })
remap('v', '<Enter>', 'za', { noremap = true, silent = true })

-- Make navigating around splits easier
remap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
remap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
remap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
remap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- Fix split window ratios
remap('n', '<leader>we', '<C-w>=', { noremap = true, silent = true })

-- Bubble multiple lines
remap('v', '<C-K>', '[egv', { noremap = true, silent = true })
remap('v', '<C-J>', ']egv', { noremap = true, silent = true })
-- remap('v', 'J', ':m '>+1<CR>gv=gv', { noremap = true, silent = true })
-- remap('v', 'K', ':m '<-2<CR>gv=gv', { noremap = true, silent = true })
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
remap('v', '<', '<gv', { noremap = true, silent = true })
remap('v', '>', '>gv', { noremap = true, silent = true })

-- Improve up/down movement on wrapped lines
remap('n', 'j', 'gj', { noremap = true, silent = true })
remap('n', 'k', 'gk', { noremap = true, silent = true })

-- Show current file in finder
-- nnoremap <leader>F :silent :Reveal<cr>

-- select all
remap('n', '<leader>a', 'ggVG', { noremap = true, silent = true })

-- Remove annoying F1 help
remap('i', '<F1>', '<nop>', { noremap = true, silent = true })
remap('n', '<F1>', '<nop>', { noremap = true, silent = true })
remap('v', '<F1>', '<nop>', { noremap = true, silent = true })

-- Show registers
remap('n', '<leader>r', ':registers<CR>', { noremap = true, silent = true })

-- Keep the cursor in place while joining lines
remap('n', 'J', 'mzJ`z', { noremap = true, silent = true })

-- Delete without cutting
remap('n', '<leader>d', '"_d', { noremap = true, silent = true })
remap('v', '<leader>d', '"_d', { noremap = true, silent = true })

-- goyo
remap('n', '<leader>oo', ':Goyo<CR>', { noremap = true, silent = true })
