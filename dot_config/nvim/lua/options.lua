require("nvchad.options")

local opt = vim.opt

opt.termguicolors = true -- use all the colours
opt.background = "dark" -- dark things

if vim.g.zvim then
  vim.opt.guifont = "JetBrainsMono_Nerd_Font:h13"
end

opt.wildmode = { "longest", "full" } -- nice things
opt.number = true -- allow numbers when in insert mode
opt.relativenumber = true -- relative numbers when not in insert mode
opt.cursorline = true -- highlight the current line
opt.shortmess:append("atOIcF") -- disable start-up message; append so NvChad's flags survive
opt.ruler = true -- show the line and column number of the cursor position
opt.ignorecase = false -- do not ignore case when searching
opt.smartcase = true -- smart searching
opt.tabstop = 2 -- default tabs to 2 spaces
opt.softtabstop = -1 -- follow shiftwidth for soft tabs
opt.shiftwidth = 2 -- match default tab spacing
opt.hlsearch = true -- highlight search results
opt.linebreak = true -- enable linebreaks
opt.showbreak = "↪ " -- what to put infront of linebreaks
opt.breakindent = true -- preserve horizontal blocks indentation
opt.startofline = false -- keep cursor in same column
opt.visualbell = false -- disable visual bell
opt.showmatch = true -- show matching brackets
opt.colorcolumn = "120" -- highlight column 120
opt.foldenable = true -- enable folding
opt.foldmethod = "indent" -- fold lines with equal indent
opt.foldcolumn = "1" -- use 1 fold column
opt.foldlevel = 99 -- opt.fold close level
opt.foldlevelstart = 99 -- opt.fold close level
opt.laststatus = 3 -- always show status line
opt.clipboard = "unnamedplus" -- use system clipboard
opt.confirm = true -- ask to save files
opt.splitbelow = true -- splits show up below by default
opt.splitright = true -- splits go to the right by default
opt.scrolloff = 4 -- start scrolling when we're n lines away from margins
opt.sidescrolloff = 15 -- start scrolling when we're n lines away from margins
opt.sidescroll = 1 -- enable side scrolling
opt.scrolljump = 8 -- minimum lines to scroll at end of screen
opt.swapfile = false -- we live in the future
opt.undofile = true -- persistent undo across sessions
opt.showtabline = 1 -- only show the tabline when more than one tab open
opt.autoread = true -- detect files changed outside of vim
opt.showmode = false -- don't show the default vim mode line
opt.modeline = true -- honor in-file modelines like `# vim: ft=yaml`
opt.mouse = "a" -- enable mouse support
opt.mousemoveevent = true -- enable mouse events
opt.cmdheight = 0 -- hide the command line when not in use; messages flow through the statusline
opt.updatetime = 200 -- faster swap file writes
opt.timeoutlen = 300 -- timeout a bit quicker
opt.signcolumn = "yes" -- show signcolumn in number column
opt.pumblend = 15 -- popup menu transparency
opt.winblend = 0 -- popup window transparency
opt.wrap = true -- wrap lines
opt.list = true -- show invisible characters
opt.switchbuf = "useopen,uselast" -- sensible buffer switching
opt.grepprg = "rg --hidden --glob=!.git --vimgrep --smart-case --" -- use ripgrep instead of grep

-- characters for the statusline
opt.fillchars = {
  eob = " ", -- empty lines below the last buffer line (default: ~)
  fold = " ", -- filler between fold text and window edge
  foldopen = "", -- marker for an open fold in the foldcolumn
  foldclose = "", -- marker for a closed fold in the foldcolumn
}

-- characters for invisibles
opt.listchars = {
  tab = "› ", -- tab character
  eol = "¬", -- end of line
  trail = "·", -- trailing whitespace
  extends = "→", -- line continues beyond the right edge (nowrap)
  precedes = "←", -- line continues beyond the left edge (nowrap)
  nbsp = "␣", -- non-breaking space
}

opt.wildignore = {
  "*.o", -- compiled object files
  "*.pyc", -- python bytecode
  "*pycache*", -- python bytecode cache directories
  "*~", -- editor backup files
  "*.gif", -- image binaries
  ".git", -- git metadata directory
  ".hg", -- mercurial metadata directory
  ".idea", -- jetbrains IDE project directory
  "*.jpeg", -- image binaries
  "*.jpg", -- image binaries
  ".mypy_cache", -- mypy type-checker cache
  "*.png", -- image binaries
  ".svn", -- subversion metadata directory
}

opt.shada = {
  "!", -- global variables that start with an uppercase letter and don't contain lowercase letters
  "'1000", -- how many files to save marks for
  "<50", -- maximum number of lines saved for each register
  "s10", -- maximum size of an item contents in KiB
  "h", -- disable 'hlsearch' highlighting when starting neovim
}
