local g = vim.g

-- minimap.vim
g.minimap_auto_start = 0
g.minimap_width = 20
g.minimap_highlight_range = true
g.minimap_block_filetypes = { "help", "NvimTree", "grug-far", "grug-far-results", "grug-far-history", "terminal" }

-- markdown Language highlighting
g.markdown_fenced_languages = {
  "go",
  "html",
  "java",
  "javascript",
  "json",
  "python",
  "ruby",
  "rust",
  "toml",
  "typescript",
  "vim",
  "yaml",
}

-- json
g.vim_json_syntax_conceal = 0

-- surround.nvim
g.surround_mappings_style = "surround"

-- vim-maximizer
g.maximizer_set_default_mapping = 0
