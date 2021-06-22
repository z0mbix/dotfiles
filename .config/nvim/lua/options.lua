local opt = vim.opt

vim.api.nvim_command('colorscheme palenight')

vim.g.mapleader = " "

opt.termguicolors = true
opt.background = "dark"
opt.wildmode = { "longest", "list", "full" } -- Nice things
opt.wildmenu = true													 -- Tab completion
opt.number = true														 -- Allow numbers when in insert mode
opt.relativenumber = true										 -- Relative numbers when not in insert mode
opt.encoding = "utf-8"
opt.exrc = true															 -- source .vimrc files
opt.cursorline = true												 -- Highlight the current line
opt.shortmess = "atOIc"											 -- disable start-up message
opt.ruler = true														 -- show the line and column number of the cursor position
opt.hidden = true														 -- sensible buffer behaviour
opt.showcmd = true													 -- show command in last line
opt.ignorecase = true												 -- ignore case when searching
opt.incsearch = true												 -- search while typing
opt.backspace = { "indent", "eol", "start" } -- super backspacing
opt.smartcase = true												 -- smart searching
opt.tabstop = 2															 -- default tabs to 2 spaces
opt.shiftwidth = 2													 -- match default tab spacing
opt.hlsearch = true													 -- highlight search results
opt.autoindent = true												 -- auto indent new lines
opt.linebreak = true												 -- enable linebreaks
opt.showbreak = "=>>"												 -- what to put infront of linebreaks
opt.breakindent = true											 -- preserve horizontal blocks
opt.startofline = false											 -- keep cursor in same column
opt.history = 200														 -- search history
opt.errorbells = false											 -- don't annoy me
opt.visualbell = false											 -- disable visual bell
opt.report = 0															 -- always report lines changed
opt.showmatch = true												 -- show matching brackets
opt.foldenable = true												 -- enable folding
opt.foldmethod = "indent"										 -- fold lines with equal indent
opt.foldlevel = 20													 -- opt.fold close level
opt.laststatus = 2													 -- always show status line
opt.ttyfast = true													 -- fast terminal conn for faster redraw
opt.clipboard = "unnamed,unnamedplus"				 -- use system clipboard --
opt.spellfile = "~/.vimspell.add"						 -- my words
opt.confirm = true													 -- ask to save files
opt.viminfo = "'100,f1"											 -- save up to 100 marks, enable capital marks
opt.splitbelow = true												 -- splits show up below by default
opt.splitright = true												 -- splits go to the right by default
opt.scrolloff = 4														 -- start scrolling when we're 4 lines away from margins
opt.sidescrolloff = 15											 -- start scrolling when we're 15 lines away from margins
opt.sidescroll = 1													 -- enable side scrolling
opt.scrolljump = 8													 -- minimum lines to scroll at end of screen
opt.swapfile = false												 -- we live in the future
opt.showtabline = 1													 -- only show the tabline when more than one tab open
opt.autoread = true													 -- detect files changed outside of vim
opt.showmode = false												 -- don't show the default vim mode line
opt.modeline = true													 -- don't show mode line
opt.lazyredraw = true												 -- Redraw only when required
opt.mouse = "a"															 -- enable mouse support
opt.joinspaces = false											 -- remove extra space when joining lines
opt.cmdheight = 1														 -- Better display for messages
opt.updatetime = 200												 -- Required for coc
opt.signcolumn = "number"										 -- Show signcolumn in number column
opt.completeopt = "menuone,noselect"				 -- For nvim-compe
opt.inccommand = "nosplit"
opt.pumblend = 15														 -- Popup menu transparency
opt.winblend = 15														 -- Popup window transparency
opt.autoindent = true
opt.cindent = true
opt.wrap = true

opt.list = true -- Show invisible characters
-- characters for invisibles
opt.listchars = {
 tab = "› ",
 eol = "¬",
 trail = "·",
 extends = "❯",
 precedes = "❮",
 nbsp = "_",
}

opt.formatoptions = opt.formatoptions
	- "a" -- Auto formatting is BAD.
	- "t" -- Don't auto format my code. I got linters for that.
	+ "c" -- In general, I like it when comments respect textwidth
	+ "q" -- Allow formatting comments w/ gq
	- "o" -- O and o, don't continue comments
	+ "r" -- But do continue when pressing enter.
	+ "n" -- Indent past the formatlistpat, not underneath it.
	+ "j" -- Auto-remove comments if possible.
	- "2" -- I'm not in gradeschool anymore

opt.wildignore = {
 "*.o",
 "*.pyc",
 "*pycache*",
 "*~",
 ".gif",
 ".git",
 ".hg",
 ".jpeg",
 ".jpg",
 ".png",
 ".svn",
}

opt.shada = { "!", "'1000", "<50", "s10", "h" }
