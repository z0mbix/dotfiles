local g = vim.g

-- disable stuff I don't care about
g.loaded_2html_plugin = 1
g.loaded_getscript = 1
g.loaded_getscriptPlugin = 1
g.loaded_gzip = 1
g.loaded_logiPat = 1
g.loaded_netrw = 1
g.loaded_netrwFileHandlers = 1
g.loaded_netrwPlugin = 1
g.loaded_netrwSettings = 1
g.loaded_perl_provider = 1
g.loaded_python_provider = 1
g.loaded_python3_provider = 0
g.loaded_rrhelper = 1
g.loaded_ruby_provider = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1
g.loaded_vimball = 1
g.loaded_vimballPlugin = 1
g.loaded_zip = 1
g.loaded_zipPlugin = 1

-- set formatoptions to override all the shit plugins do to it
g.mysyntaxfile = "~/.config/nvim/after/ftplugin/all.vim"

-- colours
g.nvcode_termcolors = 256
g.colorscheme = {
  name = "monokai-pro",
  filter = "octagon",

  -- name = "material",
  -- filter = "palenight",

  -- name = "catppuccin",
  -- filter = "mocha",

  -- name = "ayu",
  -- filter = "mirage",
}

g.colorscheme_name = g.colorscheme.name
if g.colorscheme.filter then
  g.colorscheme_name = string.format("%s-%s", g.colorscheme.name, g.colorscheme.filter)
end

-- submode
g.submode_timeout = 0
g.submode_timeoutlen = 2
g.submode_keep_leaving_key = 1

-- terraform
g.terraform_fmt_on_save = 1

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

-- goyo
g.goyo_height = "80%"
g.goyo_width = "80%"

-- git.blame.nvim
g.gitblame_enabled = 0

-- minimap.vim
g.minimap_auto_start = 0
g.minimap_width = 20
g.minimap_highlight_range = true
g.minimap_block_filetypes = { "help", "NvimTree" }

-- vim-maximizer
g.maximizer_set_default_mapping = 0

-- indent-blankline.nvim
g.indent_blankline_char = "┊"
g.indent_blankline_filetype_exclude = { "help", "packer" }
g.indent_blankline_buftype_exclude = { "terminal" }
g.indent_blankline_char_highlight = "LineNr"
g.indent_blankline_show_trailing_blankline_indent = false

-- surround.nvim
g.surround_mappings_style = "surround"

-- glow.nvim
g.glow_border = "rounded"
