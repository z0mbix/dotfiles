local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    sh = { "shfmt" },
    go = { "gofmt" },
    fish = { "fish_indent" },
    python = { "ruff_format" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
